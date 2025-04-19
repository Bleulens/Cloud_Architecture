resource "aws_iam_policy" "terraform_s3_policy" {
  name        = "TerraformS3StatePolicy"
  description = "IAM policy for Terraform S3 state management"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_role.terraform_role.arn
        }
        Action = ["s3:GetObject", "s3:PutObject", "s3:ListBucket"]
        Resource = [
          aws_s3_bucket.state_storage.arn,
          "${aws_s3_bucket.state_storage.arn}/*"
        ]
      },
      {
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.state_storage.arn,
          "${aws_s3_bucket.state_storage.arn}/*"

        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}
