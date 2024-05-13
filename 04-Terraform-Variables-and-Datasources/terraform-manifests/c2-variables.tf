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
/*
# Variables for private subnet test
variable "private_subnets" {
  type = map(number)
  default = {
    "subnet-0" = 0
    "subnet-1" = 1
    "subnet-2" = 2
  }
}
*/
/*
variable "add_tag_using_for_each" {
  type = map(string)
  default = {
    "env" = "prod"
    "team" = "backend"
  }
}
*/

