# Outputs the endpoint of the RDS database instance.
# The endpoint is the address used to connect to the database.
# This is critical for applications that need to establish connections to the database.
output "rds_endpoint" {
  value       = aws_db_instance.default[0].endpoint
  description = "The endpoint for the RDS database"
}

# Outputs the Amazon Resource Name (ARN) of the RDS instance.
# The ARN is a unique identifier used for managing resources in AWS.
# It's useful for IAM policies, monitoring, and integrations with other AWS services.
output "rds_arn" {
  value       = aws_db_instance.default[0].arn
  description = "The ARN of the RDS instance"
}
