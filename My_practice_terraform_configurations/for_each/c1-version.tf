#terraform block
terraform {
    required_providers = {
        aws = {
            source = "hashicorp/aws"
            version = "~>= 5.31"
        }
    }
    required_version = "~> 1.8.0"
}
provider "aws" {
    region = var.aws_region
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
