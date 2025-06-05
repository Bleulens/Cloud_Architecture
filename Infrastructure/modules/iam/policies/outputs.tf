# Outputs IAM Policy ARN
output "policy_arn" {
  description = "ARN of the IAM policy"
  value       = aws_iam_policy.dynamic_policy.arn
}

# Outputs IAM Policy Name
output "policy_name" {
  description = "Name of the IAM policy"
  value       = aws_iam_policy.dynamic_policy.name
}

# Outputs policy actions
output "policy_actions" {
  description = "Actions that the IAM policy allows"
  value       = aws_iam_policy.dynamic_policy.policy
}
