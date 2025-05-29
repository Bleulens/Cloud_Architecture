locals {
  created_at = formatdate("YYYY-MM-DD", timestamp()) # Dynamic timestamp
}

locals {
  default_tags = {
    Environment = var.environment
    Owner       = "Marvin"
    CreatedAt   = local.created_at # Reference the timestamp
  }
}
