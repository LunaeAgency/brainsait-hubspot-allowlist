# Cloudflare Integration Guide

## Upload WAF Rules

1. Login to Cloudflare Dashboard
2. Select your domain (brainsait.com)
3. Navigate to: **Security** → **WAF** → **Firewall Rules**
4. Click **"Create a Firewall Rule"**
5. Click **"Import from JSON"**
6. Upload: `cloudflare-hubspot-allowlist.json`
7. Click **"Deploy"**

## Verify Configuration

```bash
# Test WAF rule
curl -I https://app.brainsait.com \
    -H "X-Forwarded-For: 54.174.61.34"

# Should return 200 OK
```

## Custom Rules

Add custom domain-specific rules:
```
(http.host eq "app.brainsait.com" and ip.src in {54.174.61.34 ...})
```
