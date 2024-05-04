# Adding the availabilty zone and fetching the datasource value for az "ap-south-1a" by default it was craetaing an instance at 
#ap-south-1b but changed here to az "ap-south-1a".
resource "aws_instance" "myec2vm" {
  ami                    = data.aws_ami.ubuntu_free_tier.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  availability_zone = data.aws_availability_zones.myaz.names[0]
  vpc_security_group_ids = [aws_security_group.vpc-sshh.id, aws_security_group.vpc-webb.id]
  tags = {
    "Name" = "EC2 Demo 2"
  }
}
