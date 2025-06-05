# ================================
# AWS Internet Gateway: Enables Public Internet Access
# ================================

# Creates an Internet Gateway for public access only if enabled.
resource "aws_internet_gateway" "igw" {
  count  = var.create_internet_gateway ? 1 : 0 # Creates IGW only when explicitly enabled.
  vpc_id = var.vpc_id

  tags = merge(var.default_tags, {
    Name = "InternetGateway"
  })
}
