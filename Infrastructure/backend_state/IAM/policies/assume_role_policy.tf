# -------------------------------------------------------
# IAM Role for Terraform Execution & GitHub OIDC
# -------------------------------------------------------
resource "aws_iam_role" "terraform_role" {
  name        = "TerraformExecutionRole" # Defines the IAM role name
  description = "IAM Role for Terraform execution with GitHub OIDC support"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17", # Specifies IAM policy version
    "Statement" : [
      {
        # ------------------------------------------------------
        # Grants permission for a specific IAM user to assume this role
        # ------------------------------------------------------
        "Effect" : "Allow",
        "Principal" : {
          AWS = data.aws_iam_user.current.arn # Dynamically fetches IAM user ARN
        },
        "Action" : "sts:AssumeRole" # Allows this user to assume the Terraform role
      },
      {
        # -------------------------------------------------------
        # Allows GitHub Actions to assume the role via OpenID Connect (OIDC)
        # -------------------------------------------------------
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:aws:iam::${var.aws_account_id}:oidc-provider/token.actions.githubusercontent.com"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity", # Enables assumption via OIDC authentication
        "Condition" : {
          "StringEquals" : {
            # Ensures GitHub Actions is authenticated via AWS STS (Security Token Service)
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com",
            # Restricts access to a specific repository and branch to prevent unauthorized use
            "token.actions.githubusercontent.com:sub" : "repo:${var.github_org}/${var.github_repo}:ref:refs/heads/dev"
          }
        }
      }
    ]
  })
}
