#!/bin/bash
set -e

echo "🚀 Quick Deploy - HubSpot Allowlist"
echo "===================================="
echo ""

# Check if AWS credentials are configured
if ! aws sts get-caller-identity &> /dev/null; then
    echo "❌ AWS credentials not configured"
    exit 1
fi

echo "✓ AWS credentials verified"

# Deploy
echo ""
echo "Deploying configuration..."
./deploy-hubspot-allowlist.sh

# Verify
echo ""
echo "Verifying deployment..."
./verify-deployment.sh

echo ""
echo "✅ Deployment complete!"
echo ""
echo "Next steps:"
echo "  1. Configure DNS records"
echo "  2. Upload Cloudflare configuration"
echo "  3. Test connectivity"
