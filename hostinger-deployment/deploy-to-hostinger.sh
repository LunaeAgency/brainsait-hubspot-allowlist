#!/bin/bash

# BrainSAIT HubSpot - Hostinger VPS Deployment
# Ubuntu + Docker on Hostinger

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}BrainSAIT HubSpot - Hostinger Deployment${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if running on Ubuntu
if [ ! -f /etc/lsb-release ]; then
    echo -e "${RED}Error: This script must run on Ubuntu${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Running on Ubuntu"

# Check Docker
if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}Installing Docker...${NC}"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    echo -e "${GREEN}✓${NC} Docker installed"
else
    echo -e "${GREEN}✓${NC} Docker already installed"
fi

# Check Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo -e "${YELLOW}Installing Docker Compose...${NC}"
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo -e "${GREEN}✓${NC} Docker Compose installed"
else
    echo -e "${GREEN}✓${NC} Docker Compose already installed"
fi

# Create necessary directories
mkdir -p logs monitor/logs ssl

echo -e "${GREEN}✓${NC} Directories created"

# Pull Docker images
echo ""
echo -e "${BLUE}Pulling Docker images...${NC}"
docker-compose pull

# Build custom images
echo -e "${BLUE}Building custom images...${NC}"
docker-compose build

# Start services
echo ""
echo -e "${BLUE}Starting services...${NC}"
docker-compose up -d

# Wait for services to start
echo -e "${YELLOW}Waiting for services to start...${NC}"
sleep 10

# Check service status
echo ""
echo -e "${BLUE}Service Status:${NC}"
docker-compose ps

# Test connectivity
echo ""
echo -e "${BLUE}Testing connectivity...${NC}"
if curl -s http://localhost/health > /dev/null; then
    echo -e "${GREEN}✓${NC} Proxy service is healthy"
else
    echo -e "${RED}✗${NC} Proxy service check failed"
fi

# Show logs
echo ""
echo -e "${BLUE}Recent logs:${NC}"
docker-compose logs --tail=20

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Deployment Complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${BLUE}Services Running:${NC}"
echo "  • HubSpot Proxy: http://YOUR-SERVER-IP"
echo "  • Health Dashboard: http://YOUR-SERVER-IP:8080"
echo ""
echo -e "${BLUE}Useful Commands:${NC}"
echo "  • View logs: docker-compose logs -f"
echo "  • Stop services: docker-compose stop"
echo "  • Restart services: docker-compose restart"
echo "  • Remove services: docker-compose down"
echo ""
