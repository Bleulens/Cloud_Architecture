resource "aws_sns_topic" "this" {
  name                        = var.topic_name
  fifo_topic                  = var.fifo_topic
  content_based_deduplication = var.fifo_topic ? true : false
  kms_master_key_id           = var.kms_key_id
  tags                        = var.default_tags
}

resource "aws_sns_topic_subscription" "this" {
  count     = var.enable_subscription ? 1 : 0 # ✅ Creates subscription only if enabled
  topic_arn = aws_sns_topic.this.arn
  protocol  = var.subscription_protocol
  endpoint  = var.subscription_endpoint
}
