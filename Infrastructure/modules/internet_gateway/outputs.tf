# Outputs the Internet Gateway ID (if created).
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = var.create_internet_gateway ? aws_internet_gateway.igw[0].id : null
}
