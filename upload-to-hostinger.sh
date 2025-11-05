#!/bin/bash

# Upload BrainSAIT HubSpot to Hostinger VPS

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Upload to Hostinger VPS${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Get VPS IP
read -p "Enter your Hostinger VPS IP address: " VPS_IP
read -p "Enter SSH username [root]: " SSH_USER
SSH_USER=${SSH_USER:-root}

echo ""
echo -e "${YELLOW}Creating deployment archive...${NC}"
cd /Users/fadil369/hubspot
tar -czf hostinger-deployment.tar.gz hostinger-deployment/

echo -e "${GREEN}✓${NC} Archive created"

echo ""
echo -e "${YELLOW}Uploading to VPS...${NC}"
scp hostinger-deployment.tar.gz ${SSH_USER}@${VPS_IP}:/root/

echo -e "${GREEN}✓${NC} Upload complete"

echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Next Steps:${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo "1. SSH into your VPS:"
echo -e "   ${GREEN}ssh ${SSH_USER}@${VPS_IP}${NC}"
echo ""
echo "2. Extract and deploy:"
echo -e "   ${GREEN}cd /root${NC}"
echo -e "   ${GREEN}tar -xzf hostinger-deployment.tar.gz${NC}"
echo -e "   ${GREEN}cd hostinger-deployment${NC}"
echo -e "   ${GREEN}./deploy-to-hostinger.sh${NC}"
echo ""
echo "3. Access your services:"
echo -e "   Dashboard: ${GREEN}http://${VPS_IP}:8080${NC}"
echo -e "   Health: ${GREEN}http://${VPS_IP}/health${NC}"
echo ""
