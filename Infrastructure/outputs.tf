# Output AWS region for verification
output "aws_region" {
  description = "AWS region where resources are deployed"
  value       = var.aws_region
}

# Output VPC ID from the network module
output "vpc_id" {
  description = "VPC ID created by the network module"
  value       = module.vpc.vpc_id
}

# Output IDs of public subnets for use by other modules (e.g., compute, security)
output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.public_subnets.public_subnet_ids
}

# Output IDs of private subnets for internal resources
output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.private_subnets.private_subnet_ids
}

# Output Internet Gateway ID for reference in routing configurations
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.igw.internet_gateway_id
}

output "web_sg_id" {
  description = "ID of the web security group"
  value       = module.web_sg.security_group_id
}
