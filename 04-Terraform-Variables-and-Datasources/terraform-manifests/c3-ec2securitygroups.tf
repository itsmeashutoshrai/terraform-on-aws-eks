resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "Allow vpc-ssh traffic"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "vpc-ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "vpc-ssh_ipv4" {
  security_group_id = aws_security_group.vpc-ssh.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.vpc-ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "vpc-ssh-web" {
  name        = "vpc-ssh-web"
  description = "Allow vpc-ssh traffic"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "vpc-ssh"
  }
}
resource "aws_vpc_security_group_ingress_rule" "vpc-ssh_ipv4_web" {
  security_group_id = aws_security_group.vpc-ssh-web.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_web" {
  security_group_id = aws_security_group.vpc-ssh.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
