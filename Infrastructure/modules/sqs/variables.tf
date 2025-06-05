variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
}

variable "visibility_timeout" {
  description = "Visibility timeout for messages (seconds)"
  type        = number
  default     = 30
}

variable "message_retention" {
  description = "Retention period for messages (seconds)"
  type        = number
  default     = 86400
}

variable "delay_seconds" {
  description = "Delay for message delivery (seconds)"
  type        = number
  default     = 0
}

variable "fifo_queue" {
  description = "Enable FIFO queue"
  type        = bool
  default     = false
}

variable "enable_dlq" {
  description = "Enable dead-letter queue"
  type        = bool
  default     = false
}

variable "max_receive_count" {
  description = "Max number of times a message can be received before moving to DLQ"
  type        = number
  default     = 5
}

variable "kms_key_id" {
  description = "KMS key for encryption"
  type        = string
  default     = null
}

variable "default_tags" {
  description = "Tags for tracking the queue"
  type        = map(string)
}
