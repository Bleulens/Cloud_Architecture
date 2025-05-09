# ================================
# Route Tables & Public Route Configuration
# ================================

# Creates a route table for public subnets, allowing internet access.
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  # Attaches a default route pointing to the internet gateway.
  route {
    cidr_block = "0.0.0.0/0" # Allows traffic from any IP address.
    gateway_id = aws_internet_gateway.igw[0].id
  }

  tags = merge(var.default_tags, {
    Name = "PublicRouteTable"
  })
}

# Associates public subnets with the public route table.
resource "aws_route_table_association" "public_rt_assoc" {
  for_each       = { for subnet in aws_subnet.dynamic_subnets : subnet.id => subnet if subnet.tags["Type"] == "Public" }
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
}
