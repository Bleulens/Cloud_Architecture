output "terraform_role_arn" {
  description = "The ARN of the Terraform IAM role."
  value       = aws_iam_role.terraform_role.arn
}

output "terraform_s3_policy_arn" {
  description = "The ARN of the policy attached to the role."
  value       = aws_iam_policy.terraform_s3_policy.arn
}
