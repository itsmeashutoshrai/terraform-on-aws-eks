terraform {
#after commenting out remote or cloud backend and running apply will asks terraform init -migrate-state
  /*
  cloud {
    organization = "Trials-App"

    workspaces {
      name = "my-test-workspace"
    }
  }
  */
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.31"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
  }

# Create Security Group - SSH Traffic
resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "Dev VPC SSH"
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all ip and ports outbound"    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-ssh"
  }
}

# Create Security Group - Web Traffic
resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "Dev VPC Web"
  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
  egress {
    description = "Allow all ip and ports outbound"    
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-web"
  }
}

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}
/*
resource "aws_key_pair" "ashu_keypair" {
  key_name   = "ashu-key"
  public_key = file("~/.ssh/id_rsa.pub")
}
*/

resource  "aws_instance" "my_instance" {
  ami = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"
  key_name = "test-key-pair"
  availability_zone = data.aws_availability_zones.available.names[0]
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    Name = "my-server"
   }
  }
output "public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "instance_id" {
  value = aws_instance.my_instance.id
}
