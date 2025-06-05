# Outputs IAM Role Name
output "role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.service_role.name
}

# Outputs IAM Role ARN
output "role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.service_role.arn
}
