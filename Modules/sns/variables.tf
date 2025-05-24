variable "topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "fifo_topic" {
  description = "Enable FIFO topic"
  type        = bool
  default     = false
}

variable "enable_subscription" {
  description = "Enable SNS subscription"
  type        = bool
  default     = false
}

variable "subscription_protocol" {
  description = "Protocol for SNS subscription (e.g., email, sqs, lambda)"
  type        = string
  default     = "sqs"
}

variable "subscription_endpoint" {
  description = "Endpoint for SNS subscription"
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "KMS key for encryption"
  type        = string
  default     = null
}

variable "default_tags" {
  description = "Tags for tracking the SNS topic"
  type        = map(string)
}
