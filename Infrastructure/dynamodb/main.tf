# Define the DynamoDB table used for Terraform state locking. This prevents
# concurrent modifications to the state file, ensuring consistency.
resource "aws_dynamodb_table" "terraform_state_lock" {
  name = var.dynamodb_table_name
  # The name of the DynamoDB table. This should be unique within your AWS account
  # in the chosen region. It's set via a variable for flexibility.

  billing_mode = var.billing_mode
  # The billing mode for the DynamoDB table. Can be either "PROVISIONED" or
  # "PAY_PER_REQUEST". This is controlled by a variable.

  hash_key = "LockID"
  # The name of the hash key attribute for the DynamoDB table. Terraform uses
  # "LockID" for state locking.

  attribute {
    name = "LockID"
    type = "S"
    # Define the "LockID" attribute. It's of type "S" (String).
  }

  # Conditionally define provisioned throughput settings if the billing mode is "PROVISIONED".
  dynamic "provisioned_throughput" {
    for_each = var.billing_mode == "PROVISIONED" ? [1] : []
    content {
      read_capacity_units = var.read_capacity
      # The number of read capacity units to provision for the table. This is
      # only applicable when billing_mode is "PROVISIONED" and is set by a variable.

      write_capacity_units = var.write_capacity
      # The number of write capacity units to provision for the table. This is
      # only applicable when billing_mode is "PROVISIONED" and is set by a variable.
    }
  }

  tags = {
    Name = var.dynamodb_table_name
    # A tag for the name of the DynamoDB table, usually the same as the table's actual name.
    Environment = var.environment
    # A tag to identify the environment this table belongs to (e.g., dev, prod).
    # This is set via a variable.
  }
}
