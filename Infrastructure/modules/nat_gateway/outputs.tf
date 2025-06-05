# Outputs the NAT Gateway ID (if created).
output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = var.create_nat_gateway ? aws_nat_gateway.nat[0].id : null
}

