# Define the AWS region dynamically
aws_region = "us-east-1"

# Set the VPC CIDR block
vpc_cidr_block = "10.0.0.0/16"

# Define the subnet configurations (supports dynamic subnets)
subnet_configs = {
  subnet1 = {
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    is_public         = true
  }
  subnet2 = {
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    is_public         = false
  }
  subnet3 = {
    cidr_block        = "10.0.3.0/24"
    availability_zone = "us-east-1c"
    is_public         = true
  }
}

# Override default tags for this specific deployment
# default_tags = {
#   Environment   = "staging"                             #  Override environment
#   Application   = "serviceB"                            #  Customize application name
#   Owner         = "Marvin"                              #  Keep owner tracking
#   CreatedAt     = formatdate("YYYY-MM-DD", timestamp()) #  Auto-generate timestamp
#   ModuleVersion = "v2.2"                                #  Update module version dynamically
# }

# Control which modules are deployed
deploy_application = false
deploy_compute     = false
deploy_database    = false
deploy_storage     = false
