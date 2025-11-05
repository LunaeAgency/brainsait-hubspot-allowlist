# AWS Integration Guide

## Attach Security Group to EC2 Instances

```bash
# List your instances
aws ec2 describe-instances \
    --query "Reservations[*].Instances[*].[InstanceId,Tags[?Key=='Name'].Value|[0],State.Name]" \
    --output table

# Attach security group (replace YOUR-INSTANCE-ID)
aws ec2 modify-instance-attribute \
    --instance-id i-YOUR-INSTANCE-ID \
    --groups sg-0600dec29dafc0f82 sg-YOUR-EXISTING-GROUP
```

## Integrate with Load Balancer

```bash
# Attach to ALB security group
aws ec2 authorize-security-group-ingress \
    --group-id sg-YOUR-ALB-GROUP \
    --protocol tcp \
    --port 443 \
    --source-group sg-0600dec29dafc0f82
```

## CloudFormation Integration

```yaml
Resources:
  HubSpotAllowlistSG:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupName: brainsait-hubspot-allowlist
      GroupDescription: HubSpot allowlist for BrainSAIT
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 443
          ToPort: 443
          CidrIp: 54.174.61.34/32
        # Add all CIDR ranges...
```
