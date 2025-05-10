# ================================
# IAM Policies: Configurable Permissions with Optional Deny Rules
# ================================

# This policy dynamically assigns IAM permissions based on variables.
# - Allows flexibility in defining actions and resources without modifying code.
# - Supports optional deny statements for enhanced security.

resource "aws_iam_policy" "dynamic_policy" {
  name        = var.policy_name # Sets the IAM policy name.
  description = "Dynamically assigned permissions based on variables"

  # Defines the IAM policy document dynamically.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = concat(
      [
        # Grant permissions based on input variables.
        {
          Effect   = "Allow"
          Action   = var.policy_actions   # Dynamically assigns actions based on user input.
          Resource = var.policy_resources # Dynamically applies resource constraints.
        }
      ],
      # Optionally add deny statements if `enable_deny` is set to true.
      var.enable_deny ? [
        {
          Effect   = "Deny"
          Action   = var.deny_actions   # Defines actions explicitly denied.
          Resource = var.deny_resources # Specifies resources affected by deny rules.
        }
      ] : [] # If disabled, no deny statements are added.
    )
  })

  tags = var.default_tags # Standard tagging for IAM policy tracking.
}
