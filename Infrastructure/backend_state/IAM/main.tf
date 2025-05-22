# --------------------------------------
# IAM Role for S3 State Management
# --------------------------------------
resource "aws_iam_role" "terraform_role" {
  name = "TerraformS3StateRole" # Defines the IAM role name, used by Terraform to access backend state

  assume_role_policy = file("${path.module}/policies/assume_role_policy.json")
  # Loads the assume role policy from an external JSON file, ensuring clarity and separation of concerns

  tags = merge(var.default_tags, { # Tags help track IAM resources for better organization
    Name = "TerraformBackendRole"  # Clearly identifies this IAM role’s purpose
  })
}

# -------------------------------
# IAM Policy for S3 State Management
# -------------------------------
resource "aws_iam_policy" "terraform_s3_policy" {
  name = "TerraformS3StatePolicy" # Defines the IAM policy name to control state storage access

  policy = file("${path.module}/policies/s3_policy.json")
  # Loads the policy from an external JSON file, keeping permissions modular and easy to update

  tags = merge(var.default_tags, {
    Name      = "TerraformBackendRole" # Ensures policy is linked to Terraform backend operations
    ManagedBy = "Terraform"            # Clearly states Terraform manages this policy
    Purpose   = "State Management"     # Helps identify the role of this policy in backend operations
  })
}

# ------------------------------------------------
# Attach IAM Policy to the Role for S3 State Management
# ------------------------------------------------
resource "aws_iam_role_policy_attachment" "terraform_s3_attach" {
  role       = aws_iam_role.terraform_role.id         # Links the IAM role to the policy
  policy_arn = aws_iam_policy.terraform_s3_policy.arn # Grants Terraform the necessary permissions for S3 state management
}


# --------------------------------------
# IAM Role for DynamoDB locking
# --------------------------------------  
resource "aws_iam_role" "terraform_dynamodb_role" {
  name = "TerraformDynamoDBStateRole" # Defines the IAM role name, used by Terraform to access backend state

  assume_role_policy = file("${path.module}/policies/assume_role_policy.json")
  # Loads the assume role policy from an external JSON file, ensuring clarity and separation of concerns

  tags = merge(var.default_tags, { # Tags help track IAM resources for better organization
    Name = "TerraformBackendRole"  # Clearly identifies this IAM role’s purpose
  })
}

# -------------------------------
# IAM Policy for DynamoDB locking
# -------------------------------
resource "aws_iam_policy" "terraform_dynamodb_lock_policy" {
  name = "TerraformDynamoDBLockPolicy" # Defines the IAM policy name to control state storage access

  policy = file("${path.module}/policies/dynamodb_lock_policy.json")
  # Loads the policy from an external JSON file, keeping permissions modular and easy to update

  tags = merge(var.default_tags, {
    Name      = "TerraformBackendRole" # Ensures policy is linked to Terraform backend operations
    ManagedBy = "Terraform"            # Clearly states Terraform manages this policy
    Purpose   = "State Management"     # Helps identify the role of this policy in backend operations
  })
}

# ------------------------------------------------
# Attach IAM Policy to the Role for DynamoDB locking
# ------------------------------------------------
resource "aws_iam_role_policy_attachment" "terraform_dynamodb_attach" {
  role       = aws_iam_role.terraform_dynamodb_role.id           # Links the IAM role to the policy
  policy_arn = aws_iam_policy.terraform_dynamodb_lock_policy.arn # Grants Terraform the necessary permissions for DynamoDB state locking
}
