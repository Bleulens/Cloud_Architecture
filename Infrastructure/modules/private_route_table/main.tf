# Creates a dedicated private route table.
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  tags = merge(var.default_tags, {
    Name = "PrivateRouteTable"
  })
}

# Define routes for private subnets.
resource "aws_route" "private_route" {
  count                  = var.nat_gateway_id != null && var.nat_gateway_id != "" ? 1 : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_id
}

# Associate private subnets with the private route table
resource "aws_route_table_association" "private_subnet_assoc" {
  for_each       = var.private_subnet_configs
  subnet_id      = var.private_subnet_ids[each.key]
  route_table_id = aws_route_table.private.id
}
