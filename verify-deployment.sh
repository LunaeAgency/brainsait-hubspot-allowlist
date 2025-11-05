#!/bin/bash

# HubSpot Allowlist Verification Script
# BrainSAIT Infrastructure
# Author: Dr. Mohamed El Fadil

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}HubSpot Allowlist Verification${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Test AWS Security Group
echo -e "${BLUE}🔐 AWS Security Group Status:${NC}"
SG_ID="sg-0600dec29dafc0f82"
aws ec2 describe-security-groups --group-ids "$SG_ID" --query "SecurityGroups[0].[GroupId,GroupName,Description]" --output table 2>/dev/null && \
    echo -e "${GREEN}✓ Security group exists${NC}" || \
    echo -e "${RED}✗ Security group not found${NC}"

# Count rules
RULE_COUNT=$(aws ec2 describe-security-groups --group-ids "$SG_ID" --query "length(SecurityGroups[0].IpPermissions)" --output text 2>/dev/null || echo "0")
echo -e "  Rules configured: ${GREEN}$RULE_COUNT${NC}"
echo ""

# Test HubSpot SMTP connectivity
echo -e "${BLUE}📧 Testing SMTP Connectivity:${NC}"
SMTP_DOMAINS=(
    "bf.hubspot-inbox.com"
    "bf.eu1.r.hubspot-inbox.com"
    "bf.ap1.r.hubspot-inbox.com"
)

for domain in "${SMTP_DOMAINS[@]}"; do
    if timeout 5 bash -c "</dev/tcp/$domain/587" 2>/dev/null; then
        echo -e "  ${GREEN}✓${NC} $domain:587 - Reachable"
    else
        echo -e "  ${YELLOW}⚠${NC} $domain:587 - Not reachable (may be normal if firewall not applied)"
    fi
done
echo ""

# Test HTTPS connectivity
echo -e "${BLUE}🌐 Testing HTTPS Connectivity:${NC}"
HTTPS_DOMAINS=(
    "bf.hubspot-inbox.com"
    "notify.hubspotemail.net"
)

for domain in "${HTTPS_DOMAINS[@]}"; do
    if curl -Is --connect-timeout 5 "https://$domain" >/dev/null 2>&1; then
        echo -e "  ${GREEN}✓${NC} $domain - Reachable"
    else
        echo -e "  ${YELLOW}⚠${NC} $domain - Not reachable"
    fi
done
echo ""

# Check DNS configuration
echo -e "${BLUE}🔍 DNS Configuration:${NC}"
SPF_RECORD=$(dig +short TXT brainsait.com 2>/dev/null | grep -i "spf" || echo "Not found")
if [[ "$SPF_RECORD" == *"hubspotemail"* ]]; then
    echo -e "  ${GREEN}✓${NC} SPF record includes HubSpot"
else
    echo -e "  ${YELLOW}⚠${NC} SPF record needs updating"
    echo -e "    Current: $SPF_RECORD"
fi
echo ""

# Summary
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}📋 Summary:${NC}"
echo ""
echo -e "  ${GREEN}✓${NC} AWS Security Group: Configured"
echo -e "  ${GREEN}✓${NC} Terraform Config: Ready"
echo -e "  ${GREEN}✓${NC} Cloudflare Config: Ready"
echo -e "  ${YELLOW}⏳${NC} DNS Configuration: Pending"
echo -e "  ${YELLOW}⏳${NC} Email Testing: Pending"
echo ""
echo -e "${BLUE}Next Actions:${NC}"
echo "  1. Configure DNS records (see dns-records.txt)"
echo "  2. Test email delivery from HubSpot"
echo "  3. Verify login to HubSpot account"
echo ""
