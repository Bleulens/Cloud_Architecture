# This resource defines an AWS RDS database instance.
# The instance will only be created if "create_rds" is set to "true".
resource "aws_db_instance" "default" {
  count = var.create_rds ? 1 : 0 # Conditional deployment (creates 1 instance if enabled, 0 otherwise).

  # Specifies the database engine (e.g., PostgreSQL, MySQL).
  engine = var.engine

  # Defines the instance type, determining compute power and performance.
  instance_class = var.instance_class

  # Allocates a fixed amount of storage (in GB) for the database.
  allocated_storage = var.allocated_storage

  # Sets the unique identifier for the RDS instance (database name).
  identifier = var.db_name

  # Provides username credentials for database access.
  username = var.db_user

  # Provides password credentials for database access.
  password = var.db_password

  # Associates the RDS instance with security groups to control access.
  vpc_security_group_ids = var.vpc_security_group_ids

  # Defines which subnet group the RDS instance will reside in.
  db_subnet_group_name = var.subnet_group_name

  # Merges global tags with an additional "Name" tag specific to the RDS instance.
  # Tags are useful for identifying resources, cost tracking, and organization.
  tags = merge(var.default_tags, { "Name" = var.db_name })
}
