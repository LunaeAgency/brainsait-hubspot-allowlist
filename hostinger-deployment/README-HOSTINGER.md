# Hostinger VPS Deployment Package

## Quick Start

### 1. Upload to Hostinger VPS
```bash
scp -r hostinger-deployment/ root@YOUR-VPS-IP:/root/
```

### 2. Deploy
```bash
ssh root@YOUR-VPS-IP
cd /root/hostinger-deployment
./deploy-to-hostinger.sh
```

### 3. Access
- Dashboard: http://YOUR-VPS-IP:8080
- Health: http://YOUR-VPS-IP/health

## Package Contents

- `docker-compose.yml` - Docker services configuration
- `nginx.conf` - Nginx proxy with HubSpot allowlist
- `monitor/` - Monitoring service
- `dashboard/` - Health dashboard
- `deploy-to-hostinger.sh` - Automated deployment script
- `HOSTINGER-DEPLOYMENT-GUIDE.md` - Complete guide

## Support

Full documentation: HOSTINGER-DEPLOYMENT-GUIDE.md
