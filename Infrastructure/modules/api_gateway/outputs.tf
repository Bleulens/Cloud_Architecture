# Outputs the API Gateway ID.
output "api_gateway_id" {
  value       = aws_api_gateway_rest_api.default.id
  description = "The ID of the created API Gateway."
}

# Outputs the API Gateway root URL.
output "api_gateway_url" {
  value       = aws_api_gateway_rest_api.default.execution_arn
  description = "The execution ARN for the API Gateway."
}
