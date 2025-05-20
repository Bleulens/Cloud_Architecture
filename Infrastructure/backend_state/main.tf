# Define the S3 bucket for storing Terraform state.
resource "aws_s3_bucket" "state_storage" {
  bucket = var.bucket_name
  # The name of the S3 bucket. This should be globally unique. It's being
  # set via a variable for flexibility.

  tags = {
    Name = "My bucket"
    # A user-defined tag for the name of the bucket. Note that this tag
    # is different from the actual bucket name.
    Environment = var.environment
    # A tag to identify the environment this bucket belongs to (e.g., dev, prod).
    # This is also set via a variable.
  }
}

# Enable versioning for the state storage S3 bucket. This is crucial for
# tracking changes and preventing accidental data loss.
resource "aws_s3_bucket_versioning" "state_storage_versioning" {
  bucket = aws_s3_bucket.state_storage.id
  # Reference to the ID of the aws_s3_bucket resource named "state_storage".

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Disabled"
    # Conditionally enable or disable versioning based on the value of the
    # 'enable_versioning' variable.
  }
}

# Configure server-side encryption for the state storage S3 bucket to
# protect the state data at rest.
resource "aws_s3_bucket_server_side_encryption_configuration" "state_storage_encryption" {
  bucket = aws_s3_bucket.state_storage.id
  # Reference to the ID of the aws_s3_bucket resource named "state_storage".

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
      # Specify the server-side encryption algorithm to use, in this case, AES256.
    }
  }
}

# Configure public access block settings for the state storage S3 bucket to
# ensure it is not publicly accessible, enhancing security.
resource "aws_s3_bucket_public_access_block" "state_storage_public_block" {
  bucket = aws_s3_bucket.state_storage.id
  # Reference to the ID of the aws_s3_bucket resource named "state_storage".

  block_public_acls = true
  # Prevent setting ACLs that grant public access.
  block_public_policy = true
  # Prevent setting bucket policies that grant public access.
  restrict_public_buckets = true
  # Apply the above restrictions to all current and future buckets.
}
