#variables used for Provisioning Instances for Different Environments
#key pair name as in aws
variable "test-key" {
    description = "provide the test-key-pair"
    type = string
    default = "test-key-pair"
}
# Default size
variable "test_instance_type" {
    description = "t2.micro or t3.micro....etc"
    type = string
    default = "t2.micro"
}

variable "environments" {
    type = map(object(
        {
            region = string
            size = string
        }
    ))
    default = {
        "dev" = {
            region = "us-west-1"
            size   = "t2.micro"
            },
        "prod" = {
            region = "ap-south-1"
            size   = "t2.micro"
            }
    }  

    }
}


