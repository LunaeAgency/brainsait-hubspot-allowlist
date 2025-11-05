# HubSpot Allowlist - Terraform Configuration
# BrainSAIT Infrastructure
# Generated: 2025-11-05

variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
}

resource "aws_security_group" "hubspot_allowlist" {
  name        = "brainsait-hubspot-allowlist"
  description = "HubSpot allowlist for BrainSAIT - All regional data centers"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "BrainSAIT-HubSpot-Allowlist"
    Environment = "production"
    ManagedBy   = "terraform"
    Purpose     = "HubSpot-Integration"
  }
}

# Rule 1: 108.179.150.0/27
resource "aws_security_group_rule" "hubspot_https_1" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["108.179.150.0/27"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 108.179.150.0/27"
}

resource "aws_security_group_rule" "hubspot_smtp_587_1" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["108.179.150.0/27"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 108.179.150.0/27"
}

resource "aws_security_group_rule" "hubspot_smtp_25_1" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["108.179.150.0/27"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 108.179.150.0/27"
}

# Rule 2: 108.179.150.64/27
resource "aws_security_group_rule" "hubspot_https_2" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["108.179.150.64/27"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 108.179.150.64/27"
}

resource "aws_security_group_rule" "hubspot_smtp_587_2" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["108.179.150.64/27"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 108.179.150.64/27"
}

resource "aws_security_group_rule" "hubspot_smtp_25_2" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["108.179.150.64/27"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 108.179.150.64/27"
}

# Rule 3: 108.179.153.100/30
resource "aws_security_group_rule" "hubspot_https_3" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["108.179.153.100/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 108.179.153.100/30"
}

resource "aws_security_group_rule" "hubspot_smtp_587_3" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["108.179.153.100/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 108.179.153.100/30"
}

resource "aws_security_group_rule" "hubspot_smtp_25_3" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["108.179.153.100/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 108.179.153.100/30"
}

# Rule 4: 108.179.153.104/29
resource "aws_security_group_rule" "hubspot_https_4" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["108.179.153.104/29"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 108.179.153.104/29"
}

resource "aws_security_group_rule" "hubspot_smtp_587_4" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["108.179.153.104/29"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 108.179.153.104/29"
}

resource "aws_security_group_rule" "hubspot_smtp_25_4" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["108.179.153.104/29"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 108.179.153.104/29"
}

# Rule 5: 108.179.153.112/30
resource "aws_security_group_rule" "hubspot_https_5" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["108.179.153.112/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 108.179.153.112/30"
}

resource "aws_security_group_rule" "hubspot_smtp_587_5" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["108.179.153.112/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 108.179.153.112/30"
}

resource "aws_security_group_rule" "hubspot_smtp_25_5" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["108.179.153.112/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 108.179.153.112/30"
}

# Rule 6: 143.244.82.17/32
resource "aws_security_group_rule" "hubspot_https_6" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.82.17/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.82.17/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_6" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.82.17/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.82.17/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_6" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.82.17/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.82.17/32"
}

# Rule 7: 143.244.82.18/32
resource "aws_security_group_rule" "hubspot_https_7" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.82.18/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.82.18/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_7" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.82.18/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.82.18/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_7" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.82.18/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.82.18/32"
}

# Rule 8: 143.244.82.20/32
resource "aws_security_group_rule" "hubspot_https_8" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.82.20/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.82.20/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_8" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.82.20/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.82.20/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_8" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.82.20/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.82.20/32"
}

# Rule 9: 143.244.83.0/30
resource "aws_security_group_rule" "hubspot_https_9" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.0/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.83.0/30"
}

resource "aws_security_group_rule" "hubspot_smtp_587_9" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.0/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.83.0/30"
}

resource "aws_security_group_rule" "hubspot_smtp_25_9" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.0/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.83.0/30"
}

# Rule 10: 143.244.83.4/32
resource "aws_security_group_rule" "hubspot_https_10" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.4/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.83.4/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_10" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.4/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.83.4/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_10" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.4/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.83.4/32"
}

# Rule 11: 143.244.83.50/31
resource "aws_security_group_rule" "hubspot_https_11" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.50/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.83.50/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_11" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.50/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.83.50/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_11" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.50/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.83.50/31"
}

# Rule 12: 143.244.83.52/30
resource "aws_security_group_rule" "hubspot_https_12" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.52/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.83.52/30"
}

resource "aws_security_group_rule" "hubspot_smtp_587_12" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.52/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.83.52/30"
}

resource "aws_security_group_rule" "hubspot_smtp_25_12" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.52/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.83.52/30"
}

# Rule 13: 143.244.83.56/30
resource "aws_security_group_rule" "hubspot_https_13" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.56/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.83.56/30"
}

resource "aws_security_group_rule" "hubspot_smtp_587_13" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.56/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.83.56/30"
}

resource "aws_security_group_rule" "hubspot_smtp_25_13" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.83.56/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.83.56/30"
}

# Rule 14: 143.244.84.144/29
resource "aws_security_group_rule" "hubspot_https_14" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.144/29"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.84.144/29"
}

resource "aws_security_group_rule" "hubspot_smtp_587_14" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.144/29"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.84.144/29"
}

resource "aws_security_group_rule" "hubspot_smtp_25_14" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.144/29"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.84.144/29"
}

# Rule 15: 143.244.84.200/31
resource "aws_security_group_rule" "hubspot_https_15" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.200/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.84.200/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_15" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.200/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.84.200/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_15" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.200/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.84.200/31"
}

# Rule 16: 143.244.84.204/31
resource "aws_security_group_rule" "hubspot_https_16" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.204/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.84.204/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_16" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.204/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.84.204/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_16" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.204/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.84.204/31"
}

# Rule 17: 143.244.84.208/31
resource "aws_security_group_rule" "hubspot_https_17" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.208/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.84.208/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_17" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.208/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.84.208/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_17" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.208/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.84.208/31"
}

# Rule 18: 143.244.84.212/32
resource "aws_security_group_rule" "hubspot_https_18" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.212/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.84.212/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_18" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.212/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.84.212/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_18" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.212/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.84.212/32"
}

# Rule 19: 143.244.84.216/32
resource "aws_security_group_rule" "hubspot_https_19" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.216/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.84.216/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_19" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.216/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.84.216/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_19" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.216/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.84.216/32"
}

# Rule 20: 143.244.84.218/32
resource "aws_security_group_rule" "hubspot_https_20" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.218/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.84.218/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_20" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.218/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.84.218/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_20" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.218/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.84.218/32"
}

# Rule 21: 143.244.84.220/32
resource "aws_security_group_rule" "hubspot_https_21" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.220/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.84.220/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_21" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.220/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.84.220/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_21" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.84.220/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.84.220/32"
}

# Rule 22: 143.244.91.196/32
resource "aws_security_group_rule" "hubspot_https_22" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.91.196/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.91.196/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_22" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.91.196/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.91.196/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_22" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.91.196/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.91.196/32"
}

# Rule 23: 143.244.92.224/30
resource "aws_security_group_rule" "hubspot_https_23" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.92.224/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.92.224/30"
}

resource "aws_security_group_rule" "hubspot_smtp_587_23" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.92.224/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.92.224/30"
}

resource "aws_security_group_rule" "hubspot_smtp_25_23" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.92.224/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.92.224/30"
}

# Rule 24: 143.244.92.228/31
resource "aws_security_group_rule" "hubspot_https_24" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["143.244.92.228/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 143.244.92.228/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_24" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["143.244.92.228/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 143.244.92.228/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_24" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["143.244.92.228/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 143.244.92.228/31"
}

# Rule 25: 158.247.22.206/31
resource "aws_security_group_rule" "hubspot_https_25" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["158.247.22.206/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 158.247.22.206/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_25" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["158.247.22.206/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 158.247.22.206/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_25" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["158.247.22.206/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 158.247.22.206/31"
}

# Rule 26: 158.247.24.220/32
resource "aws_security_group_rule" "hubspot_https_26" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["158.247.24.220/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 158.247.24.220/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_26" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["158.247.24.220/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 158.247.24.220/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_26" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["158.247.24.220/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 158.247.24.220/32"
}

# Rule 27: 158.247.25.83/32
resource "aws_security_group_rule" "hubspot_https_27" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["158.247.25.83/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 158.247.25.83/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_27" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["158.247.25.83/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 158.247.25.83/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_27" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["158.247.25.83/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 158.247.25.83/32"
}

# Rule 28: 158.247.26.235/32
resource "aws_security_group_rule" "hubspot_https_28" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["158.247.26.235/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 158.247.26.235/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_28" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["158.247.26.235/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 158.247.26.235/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_28" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["158.247.26.235/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 158.247.26.235/32"
}

# Rule 29: 18.208.124.253/32
resource "aws_security_group_rule" "hubspot_https_29" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["18.208.124.253/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 18.208.124.253/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_29" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["18.208.124.253/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 18.208.124.253/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_29" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["18.208.124.253/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 18.208.124.253/32"
}

# Rule 30: 18.208.124.254/32
resource "aws_security_group_rule" "hubspot_https_30" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["18.208.124.254/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 18.208.124.254/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_30" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["18.208.124.254/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 18.208.124.254/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_30" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["18.208.124.254/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 18.208.124.254/32"
}

# Rule 31: 216.139.64.172/30
resource "aws_security_group_rule" "hubspot_https_31" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.172/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.172/30"
}

resource "aws_security_group_rule" "hubspot_smtp_587_31" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.172/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.172/30"
}

resource "aws_security_group_rule" "hubspot_smtp_25_31" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.172/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.172/30"
}

# Rule 32: 216.139.64.196/32
resource "aws_security_group_rule" "hubspot_https_32" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.196/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.196/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_32" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.196/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.196/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_32" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.196/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.196/32"
}

# Rule 33: 216.139.64.197/32
resource "aws_security_group_rule" "hubspot_https_33" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.197/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.197/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_33" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.197/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.197/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_33" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.197/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.197/32"
}

# Rule 34: 216.139.64.198/31
resource "aws_security_group_rule" "hubspot_https_34" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.198/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.198/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_34" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.198/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.198/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_34" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.198/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.198/31"
}

# Rule 35: 216.139.64.200/32
resource "aws_security_group_rule" "hubspot_https_35" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.200/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.200/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_35" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.200/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.200/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_35" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.200/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.200/32"
}

# Rule 36: 216.139.64.205/32
resource "aws_security_group_rule" "hubspot_https_36" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.205/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.205/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_36" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.205/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.205/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_36" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.205/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.205/32"
}

# Rule 37: 216.139.64.206/32
resource "aws_security_group_rule" "hubspot_https_37" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.206/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.206/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_37" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.206/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.206/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_37" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.206/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.206/32"
}

# Rule 38: 216.139.64.209/32
resource "aws_security_group_rule" "hubspot_https_38" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.209/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.209/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_38" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.209/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.209/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_38" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.209/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.209/32"
}

# Rule 39: 216.139.64.210/32
resource "aws_security_group_rule" "hubspot_https_39" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.210/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.210/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_39" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.210/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.210/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_39" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.210/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.210/32"
}

# Rule 40: 216.139.64.213/32
resource "aws_security_group_rule" "hubspot_https_40" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.213/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.213/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_40" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.213/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.213/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_40" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.213/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.213/32"
}

# Rule 41: 216.139.64.214/32
resource "aws_security_group_rule" "hubspot_https_41" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.214/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.214/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_41" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.214/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.214/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_41" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.214/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.214/32"
}

# Rule 42: 216.139.64.217/32
resource "aws_security_group_rule" "hubspot_https_42" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.217/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.217/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_42" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.217/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.217/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_42" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.217/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.217/32"
}

# Rule 43: 216.139.64.219/32
resource "aws_security_group_rule" "hubspot_https_43" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.219/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.64.219/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_43" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.219/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.64.219/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_43" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.64.219/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.64.219/32"
}

# Rule 44: 216.139.80.160/30
resource "aws_security_group_rule" "hubspot_https_44" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.160/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.80.160/30"
}

resource "aws_security_group_rule" "hubspot_smtp_587_44" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.160/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.80.160/30"
}

resource "aws_security_group_rule" "hubspot_smtp_25_44" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.160/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.80.160/30"
}

# Rule 45: 216.139.80.180/32
resource "aws_security_group_rule" "hubspot_https_45" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.180/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.80.180/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_45" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.180/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.80.180/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_45" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.180/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.80.180/32"
}

# Rule 46: 216.139.80.181/32
resource "aws_security_group_rule" "hubspot_https_46" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.181/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.80.181/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_46" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.181/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.80.181/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_46" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.181/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.80.181/32"
}

# Rule 47: 216.139.80.182/31
resource "aws_security_group_rule" "hubspot_https_47" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.182/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.80.182/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_47" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.182/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.80.182/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_47" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.182/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.80.182/31"
}

# Rule 48: 216.139.80.184/32
resource "aws_security_group_rule" "hubspot_https_48" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.184/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.80.184/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_48" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.184/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.80.184/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_48" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.184/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.80.184/32"
}

# Rule 49: 216.139.80.189/32
resource "aws_security_group_rule" "hubspot_https_49" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.189/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.80.189/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_49" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.189/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.80.189/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_49" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.189/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.80.189/32"
}

# Rule 50: 216.139.80.191/32
resource "aws_security_group_rule" "hubspot_https_50" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.191/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.80.191/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_50" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.191/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.80.191/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_50" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.191/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.80.191/32"
}

# Rule 51: 216.139.80.193/32
resource "aws_security_group_rule" "hubspot_https_51" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.193/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.80.193/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_51" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.193/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.80.193/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_51" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.193/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.80.193/32"
}

# Rule 52: 216.139.80.195/32
resource "aws_security_group_rule" "hubspot_https_52" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.195/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.80.195/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_52" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.195/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.80.195/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_52" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.195/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.80.195/32"
}

# Rule 53: 216.139.80.197/32
resource "aws_security_group_rule" "hubspot_https_53" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.197/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.80.197/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_53" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.197/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.80.197/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_53" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.80.197/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.80.197/32"
}

# Rule 54: 216.139.84.160/30
resource "aws_security_group_rule" "hubspot_https_54" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.160/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.84.160/30"
}

resource "aws_security_group_rule" "hubspot_smtp_587_54" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.160/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.84.160/30"
}

resource "aws_security_group_rule" "hubspot_smtp_25_54" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.160/30"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.84.160/30"
}

# Rule 55: 216.139.84.180/32
resource "aws_security_group_rule" "hubspot_https_55" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.180/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.84.180/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_55" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.180/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.84.180/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_55" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.180/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.84.180/32"
}

# Rule 56: 216.139.84.181/32
resource "aws_security_group_rule" "hubspot_https_56" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.181/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.84.181/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_56" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.181/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.84.181/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_56" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.181/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.84.181/32"
}

# Rule 57: 216.139.84.182/31
resource "aws_security_group_rule" "hubspot_https_57" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.182/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.84.182/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_57" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.182/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.84.182/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_57" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.182/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.84.182/31"
}

# Rule 58: 216.139.84.184/32
resource "aws_security_group_rule" "hubspot_https_58" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.184/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.84.184/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_58" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.184/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.84.184/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_58" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.184/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.84.184/32"
}

# Rule 59: 216.139.84.189/32
resource "aws_security_group_rule" "hubspot_https_59" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.189/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.84.189/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_59" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.189/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.84.189/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_59" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.189/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.84.189/32"
}

# Rule 60: 216.139.84.191/32
resource "aws_security_group_rule" "hubspot_https_60" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.191/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.84.191/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_60" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.191/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.84.191/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_60" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.191/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.84.191/32"
}

# Rule 61: 216.139.84.193/32
resource "aws_security_group_rule" "hubspot_https_61" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.193/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.84.193/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_61" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.193/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.84.193/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_61" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.193/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.84.193/32"
}

# Rule 62: 216.139.84.195/32
resource "aws_security_group_rule" "hubspot_https_62" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.195/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.84.195/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_62" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.195/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.84.195/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_62" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.195/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.84.195/32"
}

# Rule 63: 216.139.84.197/32
resource "aws_security_group_rule" "hubspot_https_63" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.197/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 216.139.84.197/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_63" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.197/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 216.139.84.197/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_63" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["216.139.84.197/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 216.139.84.197/32"
}

# Rule 64: 3.93.157.86/31
resource "aws_security_group_rule" "hubspot_https_64" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["3.93.157.86/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 3.93.157.86/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_64" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["3.93.157.86/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 3.93.157.86/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_64" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["3.93.157.86/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 3.93.157.86/31"
}

# Rule 65: 54.174.52.6/31
resource "aws_security_group_rule" "hubspot_https_65" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["54.174.52.6/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 54.174.52.6/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_65" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["54.174.52.6/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 54.174.52.6/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_65" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["54.174.52.6/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 54.174.52.6/31"
}

# Rule 66: 54.174.59.200/32
resource "aws_security_group_rule" "hubspot_https_66" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["54.174.59.200/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 54.174.59.200/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_66" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["54.174.59.200/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 54.174.59.200/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_66" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["54.174.59.200/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 54.174.59.200/32"
}

# Rule 67: 54.174.59.92/31
resource "aws_security_group_rule" "hubspot_https_67" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["54.174.59.92/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 54.174.59.92/31"
}

resource "aws_security_group_rule" "hubspot_smtp_587_67" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["54.174.59.92/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 54.174.59.92/31"
}

resource "aws_security_group_rule" "hubspot_smtp_25_67" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["54.174.59.92/31"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 54.174.59.92/31"
}

# Rule 68: 54.174.61.30/32
resource "aws_security_group_rule" "hubspot_https_68" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["54.174.61.30/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 54.174.61.30/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_68" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["54.174.61.30/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 54.174.61.30/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_68" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["54.174.61.30/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 54.174.61.30/32"
}

# Rule 69: 54.174.61.33/32
resource "aws_security_group_rule" "hubspot_https_69" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["54.174.61.33/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 54.174.61.33/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_69" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["54.174.61.33/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 54.174.61.33/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_69" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["54.174.61.33/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 54.174.61.33/32"
}

# Rule 70: 54.174.61.34/32
resource "aws_security_group_rule" "hubspot_https_70" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["54.174.61.34/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot HTTPS - 54.174.61.34/32"
}

resource "aws_security_group_rule" "hubspot_smtp_587_70" {
  type              = "ingress"
  from_port         = 587
  to_port           = 587
  protocol          = "tcp"
  cidr_blocks       = ["54.174.61.34/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP - 54.174.61.34/32"
}

resource "aws_security_group_rule" "hubspot_smtp_25_70" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["54.174.61.34/32"]
  security_group_id = aws_security_group.hubspot_allowlist.id
  description       = "HubSpot SMTP Alt - 54.174.61.34/32"
}

output "security_group_id" {
  description = "ID of the HubSpot allowlist security group"
  value       = aws_security_group.hubspot_allowlist.id
}

output "security_group_name" {
  description = "Name of the HubSpot allowlist security group"
  value       = aws_security_group.hubspot_allowlist.name
}
