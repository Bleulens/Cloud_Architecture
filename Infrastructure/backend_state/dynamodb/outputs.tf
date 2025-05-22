output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.terraform_state_lock.arn
  description = "The ARN (Amazon Resource Name) of the DynamoDB table used for Terraform state locking. This uniquely identifies the table within AWS."
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_state_lock.name
  description = "The name of the DynamoDB table used for Terraform state locking."
}

output "dynamodb_table_region" {
  value       = aws_dynamodb_table.terraform_state_lock.region
  description = "The AWS region where the DynamoDB table for Terraform state locking is located."
}
