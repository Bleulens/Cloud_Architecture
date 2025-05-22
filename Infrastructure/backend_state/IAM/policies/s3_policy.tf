# --------------------------------------------------------
# IAM Policy for Terraform Backend S3 State Management
# --------------------------------------------------------
resource "aws_iam_policy" "terraform_s3_policy" {
  name        = "TerraformS3StatePolicy" # Defines policy name for managing Terraform state in S3
  description = "IAM policy for Terraform S3 state management"

  policy = jsonencode({
    Version = "2012-10-17", # Specifies IAM policy version for compatibility with AWS services
    Statement = [
      {
        # ------------------------------------------------------
        # Grants Terraform permissions to access the backend S3 bucket
        # ------------------------------------------------------
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_role.terraform_role.arn # Links permissions to the Terraform IAM role
        }
        Action = ["s3:GetObject", "s3:PutObject", "s3:ListBucket"] # Allows Terraform to manage state files
        Resource = [
          aws_s3_bucket.state_storage.arn,       # Grants access to the bucket itself
          "${aws_s3_bucket.state_storage.arn}/*" # Extends access to all objects within the bucket
        ]
      },
      {
        # ------------------------------------------------------
        # Security Enhancement: Enforces encrypted transport
        # ------------------------------------------------------
        Effect    = "Deny"
        Principal = "*"    # Applies restriction to all users
        Action    = "s3:*" # Denies all S3 actions unless encrypted transport is used
        Resource = [
          aws_s3_bucket.state_storage.arn,       # Applies the restriction to the state bucket
          "${aws_s3_bucket.state_storage.arn}/*" # Ensures encryption is required for all stored objects
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false" # Denies access to any requests using unencrypted HTTP
          }
        }
      }
    ]
  })
}
