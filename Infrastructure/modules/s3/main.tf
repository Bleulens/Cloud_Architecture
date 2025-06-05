resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.default_tags
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = var.bucket_name # ✅ Uses variable directly for modularity
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended" # ✅ Dynamic toggle
  }
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = var.bucket_name # ✅ Uses variable directly
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = var.bucket_name # ✅ Uses variable directly
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm # ✅ Allows dynamic encryption selection
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  count  = var.enable_bucket_policy ? 1 : 0
  bucket = aws_s3_bucket.this.id
  policy = module.iam.policy_actions
}
