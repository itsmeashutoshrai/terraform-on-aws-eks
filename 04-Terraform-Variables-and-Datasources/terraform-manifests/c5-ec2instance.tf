# Adding the availabilty zone and fetching the datasource value for az "ap-south-1a" by default it was craetaing an instance at 
#ap-south-1b but changed here to az "ap-south-1a".
resource "aws_instance" "myec2vm" {
  ami                    = data.aws_ami.ubuntu_free_tier.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  availability_zone = data.aws_availability_zones.myaz.names[0]
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "EC2 Demo 2"
  }
}
/*
resource "aws_vpc" "my_vpc" {
#  cidr_block = "172.16.0.0/16"
   cidr_block = var.test_vpc_cidr_input

  tags = {
    Name = "tf-example-aws-vpc-$(var.test_vpc_cidr_input)"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  # cidr_block        = "172.16.10.0/24"
  cidr_block        = var.test_vpc_subnet

  tags = {
    Name = "tf-example-aws-subnet-$(var.test_vpc_subnet)"
  }
}
*/
# Deploy the private subnets
resource aws_subnet "mytestsubnet" {
  for_each = var.private_subnets
  cidr_block = cidrsubnet(data.aws_vpc.selected.cidr_block,8,each.value)
  vpc_id = data.aws_vpc.selected.id
}

