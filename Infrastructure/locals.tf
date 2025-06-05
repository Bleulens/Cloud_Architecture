locals {
  created_at = formatdate("YYYY-MM-DD", timestamp()) # Dynamic timestamp

  default_tags = merge(var.default_tags, { CreatedAt = local.created_at })
}
