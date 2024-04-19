#resource block
resource "aws_ec2_instance" "myawsce2instace" {
    ami = " "
    instance_type = "t2.micro"
    user_data = file("${path.module}/app1-install.sh")
}