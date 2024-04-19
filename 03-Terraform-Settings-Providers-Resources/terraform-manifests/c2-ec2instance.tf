# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"
  user_data = file("${path.module}/app1-install.sh") #${}variable expansion
  tags = {
    "Name" = "EC2 Demo"
  }
}