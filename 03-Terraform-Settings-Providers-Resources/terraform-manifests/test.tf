#resource block for ec2 instance
resource "aws_instance" "myec2vm" {
  ami = " "
  instance_type = "t2.micro"
  tags = {
    Name = "
  }

}