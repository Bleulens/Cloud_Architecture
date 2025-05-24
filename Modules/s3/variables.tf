variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning for S3 bucket"
  type        = bool
  default     = false
}

variable "default_tags" {
  description = "Tags for tracking the bucket"
  type        = map(string)
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm for S3 bucket"
  type        = string
  default     = "AES256"
}

variable "enable_bucket_policy" {
  description = "Enable the bucket policy (true/false)"
  type        = bool
  default     = false
}
