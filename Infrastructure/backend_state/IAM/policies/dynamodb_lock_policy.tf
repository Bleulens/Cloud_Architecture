resource "aws_iam_policy" "terraform_dynamodb_locking" {
  name        = "TerraformDynamoDBLocking"
  description = "IAM policy for Terraform state locking using DynamoDB."

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem"
        ]
        Resource = "arn:aws:dynamodb:${var.aws_region}:${var.aws_account_id}:table/${var.dynamodb_table_name}"
      }
    ]
  })
}
