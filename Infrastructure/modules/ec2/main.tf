# Fetch latest Amazon Linux AMI dynamically
data "aws_ssm_parameter" "latest_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# Create EC2 instances dynamically based on instance type and count
resource "aws_instance" "instances" {
  count = var.instance_count # Number of instances per deployment

  ami           = data.aws_ssm_parameter.latest_ami.value                                                                                                                                                                                          # Dynamically pulls latest Amazon Linux AMI
  instance_type = var.instance_type                                                                                                                                                                                                                # Allows projects to define their own instance type
  subnet_id     = var.subnet_type == "private" ? values(module.subnet.private_subnet_ids)[count.index % length(module.subnet.private_subnet_ids)] : values(module.subnet.public_subnet_ids)[count.index % length(module.subnet.public_subnet_ids)] # Assigns instances to private or public subnets based on subnet_type variable

  # Combines the standard tags from var.default_tags with a dynamic Name tag using merge function
  tags = merge(var.default_tags, {
    Name = "EC2-${count.index + 1}" # Generates unique instance names dynamically
  })
}
