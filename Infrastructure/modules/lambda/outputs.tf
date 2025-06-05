output "lambda_arn" {
  description = "ARN of the created Lambda function"
  value       = aws_lambda_function.lambda.arn
}

output "lambda_name" {
  description = "Name of the created Lambda function"
  value       = aws_lambda_function.lambda.function_name
}


output "log_group_name" {
  value = module.cloudwatch.log_group_name # Uses log group from CloudWatch module
}

output "lambda_role_arn" {
  description = "IAM role assigned to the Lambda function"
  value       = module.iam.role_arn
}

output "lambda_function_url" {
  description = "URL endpoint of the Lambda function"
  value       = aws_lambda_function.lambda.invoke_url
}

output "log_stream_name" {
  value = module.cloudwatch.log_stream_name
}
