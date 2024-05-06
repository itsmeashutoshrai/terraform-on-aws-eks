# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "ubuntu_free_tier" {
  most_recent      = true
  owners           = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240423"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
# datasource for default vpc
data "aws_vpc" "selected" {
  default = true
}