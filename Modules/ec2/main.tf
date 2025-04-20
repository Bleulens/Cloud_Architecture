data "aws_ssm_parameter" "latest_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "instances" {
  count = var.instance_count

  ami           = data.aws_ssm_parameter.latest_ami.value # Dynamically retrieves the latest AMI
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  tags = {
    Name = "EC2-${count.index}"
  }
}
