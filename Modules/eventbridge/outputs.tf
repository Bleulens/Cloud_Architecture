# ---------------------------------------
# EventBridge Rule Output
# ---------------------------------------
output "event_rule_arn" {
  description = "ARN of the EventBridge rule"      # ✅ Exposes the ARN of the created EventBridge rule
  value       = aws_cloudwatch_event_rule.this.arn # ✅ References the specific EventBridge rule defined in `main.tf`
}

# ---------------------------------------
# EventBridge Target Output
# ---------------------------------------
output "event_target_arn" {
  description = "ARN of the EventBridge target"      # ✅ Exposes the ARN of the configured target service (Lambda, SQS, SNS)
  value       = aws_cloudwatch_event_target.this.arn # ✅ Ensures other modules can reference the target dynamically
}
