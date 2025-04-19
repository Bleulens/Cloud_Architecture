variable "bucket_name" {
  description = "The name of the S3 bucket storing Terraform state."
  type        = string
}

variable "iam_role_name" {
  description = "The IAM role for Terraform backend access."
  default     = "TerraformS3StateRole"
}
