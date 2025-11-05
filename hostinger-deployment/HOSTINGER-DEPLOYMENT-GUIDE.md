# 🚀 Hostinger VPS Deployment Guide

## BrainSAIT HubSpot Integration on Hostinger VPS

---

## 📋 Prerequisites

### Hostinger VPS Requirements
- **VPS Plan:** Any Hostinger VPS plan
- **OS:** Ubuntu 20.04 or 22.04
- **RAM:** Minimum 1GB (2GB recommended)
- **Storage:** Minimum 10GB free space
- **Access:** SSH root or sudo access

### Local Requirements
- SSH client
- File transfer tool (SCP/SFTP)
- Your Hostinger VPS IP address

---

## 🎯 Quick Deployment (5 Minutes)

### Step 1: Connect to Your VPS

```bash
# SSH into your Hostinger VPS
ssh root@YOUR-VPS-IP

# Or with username
ssh username@YOUR-VPS-IP
```

### Step 2: Upload Deployment Package

**From your local machine:**

```bash
# Navigate to hubspot directory
cd /Users/fadil369/hubspot

# Create deployment archive
tar -czf hostinger-deployment.tar.gz hostinger-deployment/

# Upload to VPS
scp hostinger-deployment.tar.gz root@YOUR-VPS-IP:/root/

# Or use SFTP
sftp root@YOUR-VPS-IP
put hostinger-deployment.tar.gz
bye
```

### Step 3: Deploy on VPS

**On your Hostinger VPS:**

```bash
# Extract package
cd /root
tar -xzf hostinger-deployment.tar.gz
cd hostinger-deployment

# Run deployment
chmod +x deploy-to-hostinger.sh
./deploy-to-hostinger.sh
```

### Step 4: Verify Deployment

```bash
# Check services
docker-compose ps

# View logs
docker-compose logs -f

# Test health endpoint
curl http://localhost/health
```

---

## 🌐 Access Your Services

### Health Dashboard
```
http://YOUR-VPS-IP:8080
```

### HubSpot Proxy
```
http://YOUR-VPS-IP
```

### Monitor Logs
```bash
docker-compose logs -f hubspot-monitor
```

---

## 🔧 Detailed Setup Instructions

### 1. Install Docker (If Not Installed)

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add user to docker group
sudo usermod -aG docker $USER

# Verify installation
docker --version
```

### 2. Install Docker Compose

```bash
# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make executable
sudo chmod +x /usr/local/bin/docker-compose

# Verify
docker-compose --version
```

### 3. Configure Firewall

```bash
# Allow HTTP and HTTPS
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 8080/tcp

# Enable firewall (if not enabled)
sudo ufw enable

# Check status
sudo ufw status
```

### 4. Deploy Services

```bash
cd hostinger-deployment

# Start services
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f
```

---

## 🔐 SSL/TLS Configuration (Optional)

### Using Let's Encrypt (Free SSL)

```bash
# Install Certbot
sudo apt install certbot python3-certbot-nginx -y

# Get SSL certificate
sudo certbot certonly --standalone -d your-domain.com

# Certificates will be at:
# /etc/letsencrypt/live/your-domain.com/fullchain.pem
# /etc/letsencrypt/live/your-domain.com/privkey.pem

# Copy to ssl directory
sudo cp /etc/letsencrypt/live/your-domain.com/fullchain.pem ./ssl/
sudo cp /etc/letsencrypt/live/your-domain.com/privkey.pem ./ssl/

# Restart nginx
docker-compose restart hubspot-proxy
```

### Update nginx.conf for SSL

Uncomment the HTTPS server block in `nginx.conf` and update with your domain.

---

## 📊 Monitoring & Maintenance

### View Service Status

```bash
# All services
docker-compose ps

# Specific service
docker-compose ps hubspot-proxy

# Service logs
docker-compose logs hubspot-proxy

# Follow logs
docker-compose logs -f hubspot-monitor
```

### Resource Usage

```bash
# Docker stats
docker stats

# Disk usage
docker system df

# Clean up unused resources
docker system prune -a
```

### Restart Services

```bash
# Restart all
docker-compose restart

# Restart specific service
docker-compose restart hubspot-proxy

# Stop all
docker-compose stop

# Start all
docker-compose start
```

---

## 🐛 Troubleshooting

### Issue: Port Already in Use

```bash
# Check what's using port 80
sudo netstat -tulpn | grep :80

# Stop the service
sudo systemctl stop apache2
# or
sudo systemctl stop nginx

# Try deployment again
docker-compose up -d
```

### Issue: Docker Permission Denied

```bash
# Add user to docker group
sudo usermod -aG docker $USER

# Logout and login again
exit
ssh root@YOUR-VPS-IP
```

### Issue: Services Not Starting

```bash
# Check logs
docker-compose logs

# Remove and recreate
docker-compose down
docker-compose up -d

# Check Docker daemon
sudo systemctl status docker
```

### Issue: Out of Disk Space

```bash
# Check disk usage
df -h

# Clean Docker
docker system prune -a --volumes

# Remove old images
docker image prune -a
```

---

## 🔄 Updates & Maintenance

### Update Configuration

```bash
# Edit configuration
nano nginx.conf

# Or docker-compose.yml
nano docker-compose.yml

# Apply changes
docker-compose down
docker-compose up -d
```

### Update Docker Images

```bash
# Pull latest images
docker-compose pull

# Recreate containers
docker-compose up -d --force-recreate
```

### Backup Configuration

```bash
# Create backup
tar -czf hubspot-backup-$(date +%Y%m%d).tar.gz \
    docker-compose.yml \
    nginx.conf \
    monitor/ \
    dashboard/

# Download backup to local machine
scp root@YOUR-VPS-IP:/root/hubspot-backup-*.tar.gz ./
```

---

## 📈 Performance Optimization

### Increase Resources

Edit `docker-compose.yml` to set resource limits:

```yaml
services:
  hubspot-proxy:
    deploy:
      resources:
        limits:
          cpus: '0.5'
          memory: 512M
```

### Enable Log Rotation

```bash
# Configure Docker log rotation
cat > /etc/docker/daemon.json << EOF
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
EOF

# Restart Docker
sudo systemctl restart docker
```

---

## 🔗 Integration with BrainSAIT Platform

### Environment Variables

Create `.env` file:

```bash
# BrainSAIT Configuration
BRAINSAIT_API_URL=https://api.brainsait.com
BRAINSAIT_API_KEY=your-api-key-here

# HubSpot Configuration
HUBSPOT_API_KEY=your-hubspot-key
HUBSPOT_PORTAL_ID=your-portal-id

# Monitoring
ALERT_EMAIL=admin@brainsait.com
CHECK_INTERVAL=300
```

Load in docker-compose:

```yaml
services:
  hubspot-proxy:
    env_file: .env
```

---

## 🆘 Support

### Check Service Health

```bash
# Health check
curl http://localhost/health

# Dashboard status
curl http://localhost:8080

# Monitor logs
tail -f monitor/logs/monitor.log
```

### Get Help

- **Documentation:** `/root/hostinger-deployment/`
- **Logs:** `docker-compose logs`
- **Contact:** support@brainsait.com

---

## ✅ Post-Deployment Checklist

- [ ] Services running successfully
- [ ] Health dashboard accessible
- [ ] Firewall configured
- [ ] SSL certificate installed (if using HTTPS)
- [ ] Monitor service active
- [ ] Logs being written
- [ ] Backup created
- [ ] DNS configured (if using domain)
- [ ] Tested HubSpot connectivity

---

## 📝 Quick Reference

### Service URLs
- **Proxy:** http://YOUR-VPS-IP
- **Dashboard:** http://YOUR-VPS-IP:8080
- **Health:** http://YOUR-VPS-IP/health

### Common Commands
```bash
# Status
docker-compose ps

# Logs
docker-compose logs -f

# Restart
docker-compose restart

# Stop
docker-compose stop

# Start
docker-compose start

# Update
docker-compose pull && docker-compose up -d
```

---

**Deployment Date:** 2025-11-05  
**Version:** 1.0.0  
**Platform:** Hostinger VPS + Ubuntu + Docker  
**Organization:** BrainSAIT LTD

