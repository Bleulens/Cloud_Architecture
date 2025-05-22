output "state_storage_arn" {
  value       = aws_s3_bucket.state_storage.arn
  description = "The ARN (Amazon Resource Name) of the Terraform state bucket. This uniquely identifies the bucket within AWS."
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.state_storage.id
  description = "The name of the Terraform state bucket. This is the user-defined name you specified."
}

output "s3_bucket_region" {
  value       = aws_s3_bucket.state_storage.region
  description = "The AWS region where the Terraform state bucket is located. This indicates the geographical location of the resource."
}
