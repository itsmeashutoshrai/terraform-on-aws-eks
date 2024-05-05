# Input Variables
# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "ap-south-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instnace Type"
  type = string
  default = "t2.micro"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
  default = "test-key-pair"
}

# AWS VPC_Creation Self for referencing test
variable "test_vpc_cidr_input" {
  description = "Provide the cidr block information for referencing test for aws_vpc"
  type = string
}

# AWS subet cidr block for referencing test
variable "test_vpc_subnet" {
  description = "Provide the cidr block information for referencing test for aws_subnet"
  type = string
}


