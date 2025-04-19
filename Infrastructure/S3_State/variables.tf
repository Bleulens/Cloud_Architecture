variable "bucket_name" {
  description = "The name of the S3 bucket used for Terraform state storage. This should be globally unique."
  type        = string
  default     = "martin-tf-state-storage-us-east-1"
  # The default value for the bucket name. It includes a potential username,
  # a general purpose ('tf-state-storage'), and the AWS region for uniqueness.
  # You should replace 'martin' with your own unique identifier for production use.
}

variable "environment" {
  description = "The environment where this bucket is used (e.g., Dev, Staging, Prod)."
  type        = string
  default     = "Dev"
  # The default environment tag for the bucket. This helps in organizing and
  # categorizing resources.
}

variable "enable_versioning" {
  description = "A boolean flag to enable or disable versioning for the S3 bucket."
  type        = bool
  default     = true
  # The default setting for bucket versioning is 'true', which is highly
  # recommended for Terraform state buckets to prevent data loss.
}
