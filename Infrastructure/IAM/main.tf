resource "aws_iam_role" "terraform_role" {
  name = "TerraformS3StateRole"

  assume_role_policy = file("${path.module}/policies/assume_role_policy.json") # External policy file for clarity
}

resource "aws_iam_policy" "terraform_s3_policy" {
  name = "TerraformS3StatePolicy"

  policy = file("${path.module}/policies/s3_policy.json") # External policy file for clarity
}

resource "aws_iam_role_policy_attachment" "terraform_s3_attach" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = aws_iam_policy.terraform_s3_policy.arn
}
