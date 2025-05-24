resource "aws_sqs_queue" "this" {
  name                       = var.queue_name
  visibility_timeout_seconds = var.visibility_timeout
  message_retention_seconds  = var.message_retention
  delay_seconds              = var.delay_seconds
  fifo_queue                 = var.fifo_queue
  kms_master_key_id          = var.kms_key_id
  redrive_policy = var.enable_dlq ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
    maxReceiveCount     = var.max_receive_count
  }) : null
  tags = var.default_tags
}

resource "aws_sqs_queue" "dlq" {
  count = var.enable_dlq ? 1 : 0 # ✅ Creates DLQ only if enabled
  name  = "${var.queue_name}-dlq"
}
