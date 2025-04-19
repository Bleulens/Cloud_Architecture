resource "aws_iam_role_policy" "assume_role_policy" {
  name = "TerraformAssumeRolePolicy"
  role = aws_iam_role.terraform_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = aws_iam_role.terraform_role.arn
      }
      Action = "sts:AssumeRole"
    }]
  })
}
