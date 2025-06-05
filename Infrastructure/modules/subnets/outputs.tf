output "public_subnet_ids" {
  description = "A map of public subnet IDs created by this module."
  value       = { for k, v in aws_subnet.public_subnets : k => v.id }
}

output "private_subnet_ids" {
  description = "A map of private subnet IDs created by this module."
  value       = { for k, v in aws_subnet.private_subnets : k => v.id }
}

output "public_subnet_cidr" {
  description = "A list of public subnet CIDR blocks created by this module."
  value       = [for k, v in aws_subnet.public_subnets : v.cidr_block]
}

output "private_subnet_cidr" {
  description = "A list of private subnet CIDR blocks created by this module."
  value       = [for k, v in aws_subnet.private_subnets : v.cidr_block]
}
