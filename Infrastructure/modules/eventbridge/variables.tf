# ---------------------------------------
# EventBridge Rule Configuration Variables
# ---------------------------------------

variable "rule_name" {
  description = "Name of the EventBridge rule" # ✅ Defines the rule’s name
  type        = string
}

variable "rule_description" {
  description = "Description of the EventBridge rule" # ✅ Adds clarity to what the rule does
  type        = string
}

variable "event_pattern" {
  description = "Event pattern for triggering the rule" # ✅ Defines the pattern that determines when the rule runs
  type        = map(any)
}

# ---------------------------------------
# EventBridge Target Configuration Variables
# ---------------------------------------

variable "target_arn" {
  description = "ARN of the target service (e.g., Lambda, SQS, SNS)" # ✅ Specifies where EventBridge forwards events
  type        = string
}

# ---------------------------------------
# EventBridge Scheduling Configuration Variables
# ---------------------------------------

variable "enable_schedule" {
  description = "Enable scheduled execution" # ✅ Allows conditional scheduling for the rule
  type        = bool
  default     = false # ✅ Default is disabled; can be overridden in module calls
}

variable "schedule_expression" {
  description = "Schedule expression for EventBridge rule (e.g., cron or rate)" # ✅ Defines the frequency of scheduled execution
  type        = string
  default     = "rate(5 minutes)" # ✅ Default schedule runs every 5 minutes
}

# ---------------------------------------
# IAM Permissions for EventBridge (Optional)
# ---------------------------------------

variable "enable_iam_permissions" {
  description = "Enable IAM permissions for EventBridge targets" # ✅ Determines whether IAM permissions should be applied
  type        = bool
  default     = false # ✅ Defaults to disabled to keep IAM usage optional
}

variable "role_name" {
  description = "IAM Role name for EventBridge" # ✅ Defines the IAM role name if permissions are enabled
  type        = string
  default     = "eventbridge-role"
}

variable "policy_name" {
  description = "IAM Policy name for EventBridge" # ✅ Defines the policy name for granting permissions to EventBridge
  type        = string
  default     = "eventbridge-policy"
}

# ---------------------------------------
# Multi-Target Support (Optional)
# ---------------------------------------

variable "target_arns" {
  description = "ARNs of the EventBridge targets" # ✅ Supports multiple targets dynamically using `for_each`
  type        = list(string)
  default     = [] # ✅ Empty by default; can be populated for multi-target forwarding
}
