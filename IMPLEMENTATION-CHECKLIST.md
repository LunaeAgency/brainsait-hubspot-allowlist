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

