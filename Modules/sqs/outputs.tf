output "sqs_queue_arn" {
  description = "ARN of the SQS queue"
  value       = aws_sqs_queue.this.arn
}

output "sqs_queue_url" {
  description = "URL of the SQS queue"
  value       = aws_sqs_queue.this.url
}

output "dlq_arn" {
  description = "ARN of the dead-letter queue"
  value       = var.enable_dlq ? aws_sqs_queue.dlq[0].arn : null
}
