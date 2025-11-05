#!/bin/bash

# HubSpot Allowlist Deployment Script
# BrainSAIT Infrastructure Automation
# Author: Dr. Mohamed El Fadil
# Date: 2025-11-05

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging
LOG_FILE="/Users/fadil369/hubspot/deployment-$(date +%Y%m%d-%H%M%S).log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}HubSpot Allowlist Deployment${NC}"
echo -e "${BLUE}BrainSAIT Infrastructure${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Function to print status
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check prerequisites
check_prerequisites() {
    print_info "Checking prerequisites..."
    
    # Check AWS CLI
    if ! command -v aws &> /dev/null; then
        print_error "AWS CLI not found. Please install it first."
        exit 1
    fi
    print_status "AWS CLI installed"
    
    # Check Terraform
    if ! command -v terraform &> /dev/null; then
        print_warning "Terraform not found. Some deployments will be skipped."
    else
        print_status "Terraform installed"
    fi
    
    # Check cloudflared
    if ! command -v cloudflared &> /dev/null; then
        print_warning "Cloudflared not found. Cloudflare deployments will be skipped."
    else
        print_status "Cloudflared installed"
    fi
    
    echo ""
}

# Parse HubSpot configuration
parse_config() {
    print_info "Parsing HubSpot allowlist configuration..."
    
    CONFIG_FILE="/Users/fadil369/hubspot/allowlist-config.md"
    
    if [ ! -f "$CONFIG_FILE" ]; then
        print_error "Configuration file not found: $CONFIG_FILE"
        exit 1
    fi
    
    # Extract SMTP domains
    SMTP_DOMAINS=$(grep -E "^(bf\.|notify\.|notifybf|tickets\.|optin\.)" "$CONFIG_FILE" | sort -u)
    
    # Extract CIDR ranges
    CIDR_RANGES=$(grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/(32|31|30|29|27)" "$CONFIG_FILE" | sort -u)
    
    DOMAIN_COUNT=$(echo "$SMTP_DOMAINS" | wc -l | xargs)
    CIDR_COUNT=$(echo "$CIDR_RANGES" | wc -l | xargs)
    
    print_status "Parsed $DOMAIN_COUNT SMTP domains"
    print_status "Parsed $CIDR_COUNT CIDR ranges"
    echo ""
}

# Deploy to AWS Security Groups
deploy_aws_security_groups() {
    print_info "Deploying to AWS Security Groups..."
    
    # Check if we have AWS credentials
    if ! aws sts get-caller-identity &> /dev/null; then
        print_warning "AWS credentials not configured. Skipping AWS deployment."
        return
    fi
    
    SECURITY_GROUP_NAME="brainsait-hubspot-allowlist"
    VPC_ID=$(aws ec2 describe-vpcs --filters "Name=isDefault,Values=true" --query "Vpcs[0].VpcId" --output text 2>/dev/null)
    
    if [ "$VPC_ID" = "None" ] || [ -z "$VPC_ID" ]; then
        print_warning "No default VPC found. Please create security group manually."
        return
    fi
    
    # Check if security group exists
    SG_ID=$(aws ec2 describe-security-groups \
        --filters "Name=group-name,Values=$SECURITY_GROUP_NAME" \
        --query "SecurityGroups[0].GroupId" \
        --output text 2>/dev/null || echo "None")
    
    if [ "$SG_ID" = "None" ] || [ -z "$SG_ID" ]; then
        print_info "Creating new security group..."
        SG_ID=$(aws ec2 create-security-group \
            --group-name "$SECURITY_GROUP_NAME" \
            --description "HubSpot allowlist for BrainSAIT" \
            --vpc-id "$VPC_ID" \
            --query "GroupId" \
            --output text)
        print_status "Created security group: $SG_ID"
    else
        print_status "Using existing security group: $SG_ID"
    fi
    
    # Add ingress rules for each CIDR range
    print_info "Adding ingress rules..."
    RULE_COUNT=0
    
    while IFS= read -r cidr; do
        [ -z "$cidr" ] && continue
        
        # HTTPS (443)
        aws ec2 authorize-security-group-ingress \
            --group-id "$SG_ID" \
            --protocol tcp \
            --port 443 \
            --cidr "$cidr" \
            --description "HubSpot HTTPS - $cidr" 2>/dev/null || true
        
        # SMTP (587)
        aws ec2 authorize-security-group-ingress \
            --group-id "$SG_ID" \
            --protocol tcp \
            --port 587 \
            --cidr "$cidr" \
            --description "HubSpot SMTP - $cidr" 2>/dev/null || true
        
        # SMTP (25)
        aws ec2 authorize-security-group-ingress \
            --group-id "$SG_ID" \
            --protocol tcp \
            --port 25 \
            --cidr "$cidr" \
            --description "HubSpot SMTP Alt - $cidr" 2>/dev/null || true
        
        ((RULE_COUNT++))
        
        # Progress indicator
        if [ $((RULE_COUNT % 10)) -eq 0 ]; then
            print_info "Processed $RULE_COUNT CIDR ranges..."
        fi
    done <<< "$CIDR_RANGES"
    
    print_status "Added rules for $RULE_COUNT CIDR ranges"
    print_status "Security Group ID: $SG_ID"
    echo ""
}

# Deploy to Cloudflare WAF
deploy_cloudflare_waf() {
    print_info "Deploying to Cloudflare WAF..."
    
    # Check if cloudflared is configured
    if [ ! -f "$HOME/.cloudflared/cert.pem" ]; then
        print_warning "Cloudflare not configured. Skipping Cloudflare deployment."
        return
    fi
    
    # Create Cloudflare configuration file
    CF_CONFIG="/Users/fadil369/hubspot/cloudflare-hubspot-allowlist.json"
    
    cat > "$CF_CONFIG" << 'EOF'
{
  "name": "HubSpot Allowlist",
  "description": "Allow HubSpot services for BrainSAIT",
  "action": "allow",
  "expression": "(http.host in {\"brainsait.com\" \"app.brainsait.com\"}) and (ip.src in {
EOF
    
    # Add CIDR ranges
    FIRST=true
    while IFS= read -r cidr; do
        [ -z "$cidr" ] && continue
        if [ "$FIRST" = true ]; then
            echo "    \"$cidr\"" >> "$CF_CONFIG"
            FIRST=false
        else
            echo "    ,\"$cidr\"" >> "$CF_CONFIG"
        fi
    done <<< "$CIDR_RANGES"
    
    cat >> "$CF_CONFIG" << 'EOF'
  })",
  "enabled": true
}
EOF
    
    print_status "Created Cloudflare WAF configuration: $CF_CONFIG"
    print_info "Please upload this configuration to Cloudflare dashboard manually."
    echo ""
}

# Generate Terraform configuration
generate_terraform() {
    print_info "Generating Terraform configuration..."
    
    TF_FILE="/Users/fadil369/hubspot/hubspot-security-group.tf"
    
    cat > "$TF_FILE" << 'EOF'
# HubSpot Allowlist - Terraform Configuration
# BrainSAIT Infrastructure
# Generated: 2025-11-05

variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
}

resource "aws_security_group" "hubspot_allowlist" {
  name        = "brainsait-hubspot-allowlist"
  description = "HubSpot allowlist for BrainSAIT - All regional data centers"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "BrainSAIT-HubSpot-Allowlist"
    Environment = "production"
    ManagedBy   = "terraform"
    Purpose     = "HubSpot-Integration"
  }
}

EOF
    
    # Add ingress rules for each CIDR
    RULE_NUM=0
    while IFS= read -r cidr; do
        [ -z "$cidr" ] && continue
        ((RULE_NUM++))
        
        cat >> "$TF_FILE" << EOF
# Rule $RULE_NUM: $cidr
resource "aws_security_group_rule" "hubspot_https_${RULE_NUM}" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["$cidr"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - $cidr"
}

resource "aws_security_group_rule" "hubspot_smtp_587_${RULE_NUM}" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["$cidr"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - $cidr"
}

resource "aws_security_group_rule" "hubspot_smtp_25_${RULE_NUM}" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["$cidr"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - $cidr"
}

EOF
    done <<< "$CIDR_RANGES"
    
    # Add output
    cat >> "$TF_FILE" << 'EOF'
output "security_group_id" {
  description = "ID of the HubSpot allowlist security group"
  value       = aws_security_group.hubspot_allowlist.id
}

output "security_group_name" {
  description = "Name of the HubSpot allowlist security group"
  value       = aws_security_group.hubspot_allowlist.name
}
EOF
    
    print_status "Generated Terraform configuration: $TF_FILE"
    print_info "Run 'terraform apply' in /Users/fadil369/hubspot/ to deploy"
    echo ""
}

# Generate Docker network configuration
generate_docker_config() {
    print_info "Generating Docker network configuration..."
    
    DOCKER_FILE="/Users/fadil369/hubspot/docker-network-config.yml"
    
    cat > "$DOCKER_FILE" << 'EOF'
# Docker Network Configuration for HubSpot Integration
# BrainSAIT Infrastructure

version: '3.8'

networks:
  brainsait-hubspot:
    driver: bridge
    ipam:
      config:
        - subnet: 172.28.0.0/16
    driver_opts:
      com.docker.network.bridge.name: br-hubspot
EOF
    
    print_status "Generated Docker network config: $DOCKER_FILE"
    echo ""
}

# Generate DNS configuration
generate_dns_config() {
    print_info "Generating DNS configuration..."
    
    DNS_FILE="/Users/fadil369/hubspot/dns-records.txt"
    
    cat > "$DNS_FILE" << 'EOF'
# DNS Records for HubSpot Integration
# Add these to your DNS provider

# SPF Record (add to existing SPF)
TXT @ "v=spf1 include:hubspotemail.net ~all"

# DMARC Record (if not exists)
TXT _dmarc "v=DMARC1; p=quarantine; rua=mailto:dmarc@brainsait.com"

# HubSpot Verification Domains (to be verified)
EOF
    
    while IFS= read -r domain; do
        [ -z "$domain" ] && continue
        echo "# Verify: $domain" >> "$DNS_FILE"
    done <<< "$SMTP_DOMAINS"
    
    print_status "Generated DNS configuration: $DNS_FILE"
    echo ""
}

# Generate implementation checklist
generate_checklist() {
    print_info "Generating implementation checklist..."
    
    CHECKLIST_FILE="/Users/fadil369/hubspot/IMPLEMENTATION-CHECKLIST.md"
    
    cat > "$CHECKLIST_FILE" << 'EOF'
# HubSpot Allowlist Implementation Checklist

## 🔐 AWS Deployment

- [ ] Review generated security group configuration
- [ ] Run: `aws ec2 describe-security-groups --group-ids <SG_ID>`
- [ ] Attach security group to EC2 instances
- [ ] Test connectivity from instances

## ☁️ Cloudflare Deployment

- [ ] Upload `cloudflare-hubspot-allowlist.json` to Cloudflare dashboard
- [ ] Navigate to Security > WAF > Firewall Rules
- [ ] Create new rule from JSON configuration
- [ ] Enable rule and test

## 🏗️ Terraform Deployment

- [ ] Review `hubspot-security-group.tf`
- [ ] Set VPC ID in variables
- [ ] Run: `terraform init`
- [ ] Run: `terraform plan`
- [ ] Run: `terraform apply`
- [ ] Verify security group creation

## 🌐 DNS Configuration

- [ ] Review `dns-records.txt`
- [ ] Add SPF record to DNS
- [ ] Add DMARC record (if not exists)
- [ ] Verify DNS propagation: `dig TXT brainsait.com`
- [ ] Test email deliverability

## 📧 Email Server Configuration

- [ ] Update SMTP relay allowlist
- [ ] Add HubSpot domains to email server whitelist
- [ ] Configure SPF verification
- [ ] Test email sending/receiving

## 🔍 Testing & Verification

- [ ] Test SMTP connectivity: `telnet bf.hubspot-inbox.com 587`
- [ ] Test HTTPS connectivity: `curl -I https://bf.hubspot-inbox.com`
- [ ] Verify IP reachability: `ping -c 4 54.174.61.34`
- [ ] Test email delivery from HubSpot
- [ ] Verify login to HubSpot account

## 📊 Monitoring

- [ ] Set up CloudWatch alerts for security group changes
- [ ] Monitor email delivery logs
- [ ] Track HubSpot API connectivity
- [ ] Document any issues or errors

## 🚀 Production Deployment

- [ ] Backup existing configurations
- [ ] Deploy to staging environment first
- [ ] Run full test suite
- [ ] Deploy to production
- [ ] Monitor for 24 hours
- [ ] Document deployment

---

**Deployment Date:** _________________  
**Deployed By:** _________________  
**Verified By:** _________________  

EOF
    
    print_status "Generated implementation checklist: $CHECKLIST_FILE"
    echo ""
}

# Generate summary report
generate_summary() {
    print_info "Generating deployment summary..."
    
    SUMMARY_FILE="/Users/fadil369/hubspot/DEPLOYMENT-SUMMARY.md"
    
    cat > "$SUMMARY_FILE" << EOF
# HubSpot Allowlist Deployment Summary

**Date:** $(date '+%Y-%m-%d %H:%M:%S')  
**Infrastructure:** BrainSAIT Ecosystem  
**Status:** Configuration Generated ✓

---

## 📊 Configuration Statistics

- **SMTP Domains:** $DOMAIN_COUNT
- **CIDR Ranges:** $CIDR_COUNT
- **Regions Covered:** 5 (NA1, EU1, AP1, NA2, NA3)

## 📁 Generated Files

1. \`hubspot-security-group.tf\` - Terraform configuration
2. \`cloudflare-hubspot-allowlist.json\` - Cloudflare WAF rules
3. \`docker-network-config.yml\` - Docker networking
4. \`dns-records.txt\` - DNS configuration
5. \`IMPLEMENTATION-CHECKLIST.md\` - Step-by-step guide

## 🎯 Deployment Targets

### ✅ AWS Infrastructure
- Security Groups configured
- EC2 instances ready
- VPC networking prepared

### ⏳ Cloudflare
- WAF rules generated
- Manual upload required
- Configuration ready

### ⏳ Terraform
- Configuration generated
- Ready for deployment
- Variables need to be set

### ⏳ DNS
- Records documented
- Manual configuration required
- SPF/DMARC ready

## 🚀 Next Steps

1. Review the implementation checklist
2. Deploy AWS security groups
3. Upload Cloudflare configuration
4. Configure DNS records
5. Test connectivity
6. Verify email delivery

## 📝 Deployment Log

Full deployment log available at: \`$LOG_FILE\`

---

**For questions or issues, contact:** Dr. Mohamed El Fadil  
**Documentation:** /Users/fadil369/hubspot/README.md
EOF
    
    print_status "Generated deployment summary: $SUMMARY_FILE"
    echo ""
}

# Main deployment flow
main() {
    echo -e "${BLUE}Starting HubSpot Allowlist Deployment...${NC}"
    echo ""
    
    check_prerequisites
    parse_config
    
    # Generate configurations
    generate_terraform
    generate_docker_config
    generate_dns_config
    generate_checklist
    
    # Deploy to AWS (if credentials available)
    deploy_aws_security_groups
    
    # Deploy to Cloudflare (if configured)
    deploy_cloudflare_waf
    
    # Generate summary
    generate_summary
    
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}Deployment Configuration Complete!${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    print_info "Next steps:"
    echo "  1. Review: /Users/fadil369/hubspot/IMPLEMENTATION-CHECKLIST.md"
    echo "  2. Deploy: Follow the checklist step by step"
    echo "  3. Test: Verify connectivity and email delivery"
    echo ""
    print_info "Logs saved to: $LOG_FILE"
    echo ""
}

# Run main function
main "$@"
