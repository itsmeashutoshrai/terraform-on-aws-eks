#variables used for Provisioning Instances for Different Environments
#key pair name as in aws
variable "test-key" {
    description = "provide the test-key-pair"
    type = string
    default = "test-key-pair"
}

# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "ap-south-1"
}

# Default size
variable "test_instance_type" {
    description = "t2.micro or t3.micro....etc"
    type = string
    default = "t2.micro"
}

variable "environments" {
  type = map(number)
  default = {
    dev  = 1
    prod = 2
  }
}

variable "instance_tags" {
  type = map(map(string))
  default = {
    dev  = {
      Environment = "development"
      Project     = "my-project-for-development"
    }
    prod = {
      Environment = "production"
      Project     = "my-project-for-production"
    }
  }
}



