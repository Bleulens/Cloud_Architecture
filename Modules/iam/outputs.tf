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

# Outputs IAM Policy ARN
output "policy_arn" {
  description = "ARN of the IAM policy"
  value       = aws_iam_policy.dynamic_policy.arn
}
