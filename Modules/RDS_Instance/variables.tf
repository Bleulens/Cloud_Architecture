# Boolean flag to control whether an RDS instance should be created.
# Setting this to `false` means the module won't provision an RDS instance.
variable "create_rds" {
  type    = bool
  default = false
}

# Name of the database instance.
# This identifier helps distinguish multiple RDS instances within your infrastructure.
variable "db_name" {
  type    = string
  default = "my_database"
}

# Database username for authentication.
# This should be provided securely, ideally using a secrets management system.
variable "db_user" {
  type = string
}

# Database password for authentication.
# Like `db_user`, this should be stored securely and not hardcoded.
variable "db_password" {
  type = string
}

# Defines the database engine type (e.g., PostgreSQL, MySQL, etc.).
# You can override this if your project requires a different DB engine.
variable "engine" {
  type    = string
  default = "postgres"
}

# Defines the instance type for RDS.
# Determines compute resources and performance capabilities.
variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

# Specifies allocated storage size (in GB).
# Adjust this based on database usage and growth expectations.
variable "allocated_storage" {
  type    = number
  default = 20
}

# List of security group IDs associated with the RDS instance.
# Ensures that only authorized resources can connect to the database.
variable "security_group_ids" {
  type = list(string)
}

# Specifies the name of the subnet group.
# Determines which subnets the RDS instance can reside in for better availability.
variable "subnet_group" {
  type = string
}

# Defines a standard set of tags to be applied across all Terraform-managed resources.
# This variable allows consistent tagging for better organization, cost tracking, and automation.
variable "default_tags" {
  description = "Standard tags passed from root module"
  type        = map(string)
}
