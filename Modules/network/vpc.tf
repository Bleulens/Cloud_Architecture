# ================================
# AWS VPC Module: Network Creation
# ================================

# Creates a VPC (Virtual Private Cloud)
# This serves as the primary network environment where AWS resources will be deployed.
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block # Defines the overall IP range of the VPC.

  # Tags help with organizing and identifying resources across AWS.
  tags = merge(var.default_tags, {
    Name = "VPC-${var.vpc_cidr_block}" # Dynamically names the VPC based on its CIDR block.
  })
}
