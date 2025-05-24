output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.this.arn
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.this.id
}

output "s3_bucket_domain" {
  description = "Domain name of the bucket"
  value       = aws_s3_bucket.this.bucket_domain_name
}
