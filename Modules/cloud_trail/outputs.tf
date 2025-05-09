# Outputs the CloudTrail trail name
output "trail_name" {
  description = "Name of the CloudTrail trail"
  value       = aws_cloudtrail.main.name
}

# Outputs the CloudTrail log bucket name for reference in other modules
output "s3_bucket_name" {
  description = "S3 bucket where CloudTrail logs are stored"
  value       = var.s3_bucket_name
}

# Outputs the IAM role ARN used by CloudTrail for permissions
output "cloud_watch_logs_role_arn" {
  description = "IAM role ARN for CloudTrail log delivery"
  value       = var.cloud_watch_logs_role_arn
}
