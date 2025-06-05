# Creates a dedicated public route table.
resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  tags = merge(var.default_tags, {
    Name = "PublicRouteTable"
  })
}

# Define routes for public subnets.
resource "aws_route" "public_route" {
  count                  = var.igw_id != null && var.igw_id != "" ? 1 : 0
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id # Still using the IGW ID variable
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_subnet_assoc" {
  for_each       = var.public_subnet_configs       # Still using this to drive the loop
  subnet_id      = var.public_subnet_ids[each.key] # Changed to use the new variable
  route_table_id = aws_route_table.main.id
}
