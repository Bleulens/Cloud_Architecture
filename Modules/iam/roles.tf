# ================================
# IAM Role with Dynamic Service Assignment
# ================================

resource "aws_iam_role" "service_role" {
  name = var.role_name # Sets the IAM role name.

  # Defines the trust relationship dynamically based on `var.assumed_by_service`
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = var.assumed_by_service } # Now accepts any AWS service dynamically
        Action    = "sts:AssumeRole"
      }
    ]
  })

  tags = var.default_tags
}
