provider "aws" {
  region = var.region
}

#version 1.0.3

data "aws_ssm_parameter" "cathay-ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "cathay-module-example" {
  ami               = data.aws_ssm_parameter.cathay-ami.value
  instance_type     = var.instance-type
  availability_zone = var.instance-az
  count             = var.instance-count
  tags = {
    Name = var.server-name
  }
}