# ================================
# NAT Gateway for Private Subnets
# ================================

# ⚠ AWS Free Tier DOES NOT cover NAT Gateway usage, so keep disabled unless necessary!
resource "aws_nat_gateway" "nat" {
  count = var.create_nat_gateway ? 1 : 0 # NAT Gateway is optional (disabled in Free Tier).

  allocation_id = aws_eip.nat_eip[0].id
  subnet_id     = aws_subnet.dynamic_subnets[var.nat_subnet_id].id

  tags = merge(var.default_tags, {
    Name = "NAT Gateway"
  })
}

# Allocates a static Elastic IP for NAT Gateway.
resource "aws_eip" "nat_eip" {
  count = var.create_nat_gateway ? 1 : 0 # Avoid costs unless explicitly enabled.
}
