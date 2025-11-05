# Terraform Usage Guide

## Initialize Terraform

```bash
cd /Users/fadil369/hubspot
terraform init
```

## Plan Deployment

```bash
# Create execution plan
terraform plan -out=hubspot.tfplan

# Review plan
terraform show hubspot.tfplan
```

## Apply Configuration

```bash
# Apply with approval
terraform apply

# Or auto-approve
terraform apply -auto-approve
```

## Variables

Create `terraform.tfvars`:
```hcl
vpc_id = "vpc-YOUR-VPC-ID"
```

## Module Usage

```hcl
module "hubspot" {
  source = "./hubspot"
  vpc_id = var.vpc_id
}

output "security_group_id" {
  value = module.hubspot.security_group_id
}
```
