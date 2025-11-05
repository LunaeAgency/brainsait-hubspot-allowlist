# HubSpot Allowlist Configuration

> **Purpose**: Configure firewall/security systems to allow seamless login and communication with HubSpot services across all regional data centers.

---

## 📋 Implementation Checklist

- [ ] Add all SMTP domains to email allowlist
- [ ] Add all CIDR ranges to firewall allowlist
- [ ] Configure DNS to resolve HubSpot domains
- [ ] Test connectivity to each regional endpoint
- [ ] Verify email delivery from HubSpot domains
- [ ] Document changes in security configuration

---

## 🌍 Collective (All Regional Data Centers)

### System Services

**Tools/Features:**
- Conversations Free
- Conversations Paid
- Opt-in Confirmations
- Service Hub Main
- Test/Preview

#### SMTP Domains (All Regions)
```
bf.hubspot-inbox.com
bf.hs-inbox.com
optin.hubspotemail.net
bf01a.hubspotservicehub.com
bftest.hubspotemail.net
bf.eu1.r.hubspot-inbox.com
bf.eu1.r.hs-inbox.com
optin.eu1.hubspotemail.net
bf01.eu1.hubspotservicehub.com
bftest.eu1.hubspotemail.net
bf.ap1.r.hubspot-inbox.com
bf.ap1.r.hs-inbox.com
optin.ap1.hubspotemail.net
bf01.ap1.hubspotservicehub.com
bftest.ap1.hubspotemail.net
bf.na2.r.hubspot-inbox.com
bf.na2.r.hs-inbox.com
optin.na2.hubspotemail.net
bf01.na2.hubspotservicehub.com
bftest.na2.hubspotemail.net
```

#### CIDR Ranges (System Services)
```
54.174.61.34/32
54.174.61.33/32
143.244.84.208/31
216.139.84.191/32
216.139.64.210/32
216.139.64.209/32
216.139.80.191/32
54.174.61.30/32
143.244.84.204/31
216.139.84.193/32
216.139.64.214/32
216.139.64.213/32
216.139.80.193/32
54.174.52.6/31
143.244.84.216/32
216.139.84.197/32
216.139.64.219/32
216.139.80.197/32
54.174.59.92/31
158.247.22.206/31
143.244.91.196/32
143.244.84.200/31
216.139.84.189/32
216.139.64.206/32
216.139.64.205/32
216.139.80.189/32
54.174.59.200/32
143.244.84.212/32
216.139.84.195/32
216.139.64.217/32
216.139.80.195/32
```

### Notifications

**Tools/Features:**
- Content Memberships
- Notifications
- Service Hub Ticket Notifications

#### SMTP Domains (Notifications - All Regions)
```
notify.hubspotemail.net
notifybf1.hubspot.com
tickets.hubspotservicehub.com
notify.eu1.hubspotemail.net
notifybf1.eu1.hubspot.com
tickets.eu1.hubspotservicehub.com
notify.ap1.hubspotemail.net
notifybf1.ap1.hubspot.com
tickets.ap1.hubspotservicehub.com
notify.na2.hubspotemail.net
notifybf1.na2.hubspot.com
tickets.na2.hubspotservicehub.com
notify.na3.hubspotemail.net
notifybf1.na3.hubspot.com
tickets.na3.hubspotservicehub.com
```

#### CIDR Ranges (Notifications)
```
158.247.24.220/32
158.247.26.235/32
158.247.25.83/32
143.244.84.220/32
216.139.84.180/32
216.139.64.196/32
216.139.80.180/32
108.179.150.64/27
108.179.153.100/30
108.179.150.0/27
108.179.153.104/29
143.244.92.224/30
143.244.92.228/31
3.93.157.86/31
108.179.153.112/30
143.244.84.144/29
143.244.82.20/32
143.244.83.0/30
143.244.83.52/30
143.244.82.18/32
143.244.83.56/30
143.244.82.17/32
143.244.83.4/32
143.244.83.50/31
216.139.84.160/30
216.139.64.172/30
216.139.80.160/30
18.208.124.253/32
18.208.124.254/32
143.244.84.218/32
216.139.84.184/32
216.139.84.181/32
216.139.84.182/31
216.139.64.200/32
216.139.64.197/32
216.139.64.198/31
216.139.80.182/31
216.139.80.184/32
216.139.80.181/32
```

---

## 🇺🇸 NA1 (North America Region 1)

### System Services

**SMTP Domains:**
```
bf.hubspot-inbox.com
bf.hs-inbox.com
optin.hubspotemail.net
bf01a.hubspotservicehub.com
bftest.hubspotemail.net
```

**CIDR Ranges:**
```
54.174.61.34/32
54.174.61.33/32
54.174.61.30/32
54.174.52.6/31
54.174.59.92/31
158.247.22.206/31
143.244.91.196/32
54.174.59.200/32
```

### Notifications

**SMTP Domains:**
```
notify.hubspotemail.net
notifybf1.hubspot.com
tickets.hubspotservicehub.com
```

**CIDR Ranges:**
```
158.247.24.220/32
158.247.26.235/32
158.247.25.83/32
108.179.150.64/27
108.179.153.100/30
108.179.150.0/27
108.179.153.104/29
143.244.92.224/30
143.244.92.228/31
3.93.157.86/31
108.179.153.112/30
18.208.124.253/32
18.208.124.254/32
```

---

## 🇪🇺 EU1 (Europe Region 1)

### System Services

**SMTP Domains:**
```
bf.eu1.r.hubspot-inbox.com
bf.eu1.r.hs-inbox.com
optin.eu1.hubspotemail.net
bf01.eu1.hubspotservicehub.com
bftest.eu1.hubspotemail.net
```

**CIDR Ranges:**
```
143.244.84.208/31
143.244.84.204/31
143.244.84.216/32
143.244.84.200/31
143.244.84.212/32
```

### Notifications

**SMTP Domains:**
```
notify.eu1.hubspotemail.net
notifybf1.eu1.hubspot.com
tickets.eu1.hubspotservicehub.com
```

**CIDR Ranges:**
```
143.244.84.220/32
143.244.84.144/29
143.244.82.20/32
143.244.83.0/30
143.244.83.52/30
143.244.82.18/32
143.244.83.56/30
143.244.82.17/32
143.244.83.4/32
143.244.83.50/31
143.244.84.218/32
```

---

## 🌏 AP1 (Asia Pacific Region 1)

### System Services

**SMTP Domains:**
```
bf.ap1.r.hubspot-inbox.com
bf.ap1.r.hs-inbox.com
optin.ap1.hubspotemail.net
bf01.ap1.hubspotservicehub.com
bftest.ap1.hubspotemail.net
```

**CIDR Ranges:**
```
216.139.84.191/32
216.139.84.193/32
216.139.84.197/32
216.139.84.189/32
216.139.84.195/32
```

### Notifications

**SMTP Domains:**
```
notify.ap1.hubspotemail.net
notifybf1.ap1.hubspot.com
tickets.ap1.hubspotservicehub.com
```

**CIDR Ranges:**
```
216.139.84.180/32
216.139.84.160/30
216.139.84.184/32
216.139.84.181/32
216.139.84.182/31
```

---

## 🇺🇸 NA2 (North America Region 2)

### System Services

**SMTP Domains:**
```
bf.na2.r.hubspot-inbox.com
bf.na2.r.hs-inbox.com
optin.na2.hubspotemail.net
bf01.na2.hubspotservicehub.com
bftest.na2.hubspotemail.net
```

**CIDR Ranges:**
```
216.139.64.210/32
216.139.64.209/32
216.139.64.214/32
216.139.64.213/32
216.139.64.219/32
216.139.64.206/32
216.139.64.205/32
216.139.64.217/32
```

### Notifications

**SMTP Domains:**
```
notify.na2.hubspotemail.net
notifybf1.na2.hubspot.com
tickets.na2.hubspotservicehub.com
```

**CIDR Ranges:**
```
216.139.64.196/32
216.139.64.172/30
216.139.64.200/32
216.139.64.197/32
216.139.64.198/31
```

---

## 🇺🇸 NA3 (North America Region 3)

### System Services

**SMTP Domains:**
```
bf.na3.r.hubspot-inbox.com
bf.na3.r.hs-inbox.com
optin.na3.hubspotemail.net
bf01.na3.hubspotservicehub.com
bftest.na3.hubspotemail.net
```

**CIDR Ranges:**
```
216.139.80.191/32
216.139.80.193/32
216.139.80.197/32
216.139.80.189/32
216.139.80.195/32
```

### Notifications

**SMTP Domains:**
```
notify.na3.hubspotemail.net
notifybf1.na3.hubspot.com
tickets.na3.hubspotservicehub.com
```

**CIDR Ranges:**
```
216.139.80.180/32
216.139.80.160/30
216.139.80.182/31
216.139.80.184/32
216.139.80.181/32
```

---

## 🔧 Implementation Instructions

### For Firewall Configuration

1. **Add IP Allowlist Rules:**
   ```bash
   # Example for iptables (Linux)
   # Add each CIDR range to INPUT and OUTPUT chains
   iptables -A INPUT -s 54.174.61.34/32 -j ACCEPT
   iptables -A OUTPUT -d 54.174.61.34/32 -j ACCEPT
   ```

2. **Cloud Security Groups (AWS/Azure/GCP):**
   - Create security group rule for each CIDR range
   - Allow inbound/outbound on ports: 443 (HTTPS), 587 (SMTP), 25 (SMTP)

### For Email Server Configuration

1. **SMTP Relay Allowlist:**
   ```
   # Postfix example (/etc/postfix/access)
   bf.hubspot-inbox.com OK
   bf.hs-inbox.com OK
   ```

2. **SPF Record Verification:**
   - Ensure HubSpot domains are in your SPF record
   - Add: `include:hubspotemail.net`

### For DNS Configuration

1. **Verify DNS Resolution:**
   ```bash
   # Test each domain resolves correctly
   nslookup bf.hubspot-inbox.com
   nslookup notify.hubspotemail.net
   ```

### For Proxy/WAF Configuration

1. **Allowlist Domains in WAF:**
   - Add all SMTP domains to bypass rules
   - Whitelist all CIDR ranges for HubSpot services

2. **Proxy Bypass Rules:**
   - Configure proxy to allow direct connection to HubSpot IPs
   - Disable SSL inspection for HubSpot domains

---

## 🧪 Testing Connectivity

### Test SMTP Connectivity
```bash
# Test port 587 (SMTP)
telnet bf.hubspot-inbox.com 587

# Test port 25 (SMTP)
telnet bf.hubspot-inbox.com 25
```

### Test HTTPS Connectivity
```bash
# Test each regional endpoint
curl -I https://bf.hubspot-inbox.com
curl -I https://bf.eu1.r.hubspot-inbox.com
curl -I https://bf.ap1.r.hubspot-inbox.com
```

### Verify IP Reachability
```bash
# Ping test (if ICMP allowed)
ping -c 4 54.174.61.34
ping -c 4 143.244.84.208
ping -c 4 216.139.84.191
```

---

## 📝 Quick Copy Lists

### All Unique SMTP Domains
```
bf.hubspot-inbox.com
bf.hs-inbox.com
optin.hubspotemail.net
bf01a.hubspotservicehub.com
bftest.hubspotemail.net
bf.eu1.r.hubspot-inbox.com
bf.eu1.r.hs-inbox.com
optin.eu1.hubspotemail.net
bf01.eu1.hubspotservicehub.com
bftest.eu1.hubspotemail.net
bf.ap1.r.hubspot-inbox.com
bf.ap1.r.hs-inbox.com
optin.ap1.hubspotemail.net
bf01.ap1.hubspotservicehub.com
bftest.ap1.hubspotemail.net
bf.na2.r.hubspot-inbox.com
bf.na2.r.hs-inbox.com
optin.na2.hubspotemail.net
bf01.na2.hubspotservicehub.com
bftest.na2.hubspotemail.net
bf.na3.r.hubspot-inbox.com
bf.na3.r.hs-inbox.com
optin.na3.hubspotemail.net
bf01.na3.hubspotservicehub.com
bftest.na3.hubspotemail.net
notify.hubspotemail.net
notifybf1.hubspot.com
tickets.hubspotservicehub.com
notify.eu1.hubspotemail.net
notifybf1.eu1.hubspot.com
tickets.eu1.hubspotservicehub.com
notify.ap1.hubspotemail.net
notifybf1.ap1.hubspot.com
tickets.ap1.hubspotservicehub.com
notify.na2.hubspotemail.net
notifybf1.na2.hubspot.com
tickets.na2.hubspotservicehub.com
notify.na3.hubspotemail.net
notifybf1.na3.hubspot.com
tickets.na3.hubspotservicehub.com
```

---

## 📚 Additional Resources

- [HubSpot Knowledge Base: Email Sending IPs](https://knowledge.hubspot.com/reports/what-are-hubspot-s-email-sending-ip-addresses)
- [HubSpot Developer Docs](https://developers.hubspot.com/)
- Contact HubSpot Support for region-specific requirements

---

**Last Updated:** 2025-11-05
**Maintenance:** Review quarterly for IP/domain updates from HubSpot
