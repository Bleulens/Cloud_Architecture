# ---------------------------------------
# EventBridge Rule Configuration
# ---------------------------------------
resource "aws_cloudwatch_event_rule" "this" {
  name                = var.rule_name                                        # ✅ Name of the EventBridge rule
  description         = var.rule_description                                 # ✅ Description for clarity
  event_pattern       = jsonencode(var.event_pattern)                        # ✅ Defines the event pattern for triggering
  schedule_expression = var.enable_schedule ? var.schedule_expression : null # ✅ Conditionally enables scheduled execution
}

# ---------------------------------------
# EventBridge Target Configuration
# ---------------------------------------
resource "aws_cloudwatch_event_target" "this" {
  rule = aws_cloudwatch_event_rule.this.name # ✅ Links the target to the EventBridge rule
  arn  = var.target_arn                      # ✅ Defines the target service (Lambda, SQS, SNS, etc.)
}

# ---------------------------------------
# IAM Role for EventBridge (Optional)
# ---------------------------------------
resource "aws_iam_role" "eventbridge_role" {
  count = var.enable_iam_permissions ? 1 : 0 # ✅ Creates IAM role only if permissions are enabled
  name  = var.role_name                      # ✅ Name of the IAM role

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "events.amazonaws.com" }, # ✅ Grants EventBridge permission to assume the role
      Action    = "sts:AssumeRole"
    }]
  })
}

# ---------------------------------------
# IAM Policy for EventBridge (Optional)
# ---------------------------------------
resource "aws_iam_policy" "eventbridge_policy" {
  count = var.enable_iam_permissions ? 1 : 0 # ✅ Creates policy only if IAM permissions are enabled
  name  = var.policy_name                    # ✅ Name of the IAM policy

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["lambda:InvokeFunction", "sqs:SendMessage", "sns:Publish"], # ✅ Defines allowed AWS actions
      Resource = var.target_arns                                              # ✅ Targets defined dynamically
    }]
  })
}

# ---------------------------------------
# IAM Role Policy Attachment (Optional)
# ---------------------------------------
resource "aws_iam_role_policy_attachment" "attach_policy" {
  count      = var.enable_iam_permissions ? 1 : 0       # ✅ Attaches IAM policy only if enabled
  role       = aws_iam_role.eventbridge_role[0].name    # ✅ Attaches the policy to the IAM role
  policy_arn = aws_iam_policy.eventbridge_policy[0].arn # ✅ Links the policy ARN
}

# ---------------------------------------
# Multi-Target EventBridge Configuration
# ---------------------------------------
resource "aws_cloudwatch_event_target" "targets" {
  for_each = { for idx, arn in var.target_arns : idx => arn }                         # ✅ Maps multiple target ARNs dynamically
  rule     = aws_cloudwatch_event_rule.this.name                                      # ✅ Applies the rule to each target
  arn      = each.value                                                               # ✅ Assigns target ARN dynamically
  role_arn = var.enable_iam_permissions ? aws_iam_role.eventbridge_role[0].arn : null # ✅ Conditionally applies IAM permissions if enabled
}
