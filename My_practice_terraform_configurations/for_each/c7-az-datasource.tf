#data "aws_availability_zones" "myaz" {}
data "aws_availability_zones" "available" {
    state = "available"
}