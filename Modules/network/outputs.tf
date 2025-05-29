# Outputs the VPC ID.
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

# Outputs IDs for public subnets.
output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = [for subnet in aws_subnet.dynamic_subnets : subnet.id if subnet.tags["Type"] == "Public"]
}

# Outputs IDs for private subnets.
output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = [for subnet in aws_subnet.dynamic_subnets : subnet.id if subnet.tags["Type"] == "Private"]
}

# Outputs the Internet Gateway ID (if created).
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = var.create_internet_gateway ? aws_internet_gateway.igw[0].id : null
}

# Outputs the NAT Gateway ID (if created).
output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = var.create_nat_gateway ? aws_nat_gateway.ngw[0].id : null
}

