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
resource "aws_vpc_security_group_ingress_rule" "vpc-ssh_ipv4_another" {
  security_group_id = aws_security_group.vpc-ssh.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.vpc-ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

/*
resource "aws_vpc_security_group_ingress_rule" "vpc-ssh_ipv6" {
  security_group_id = aws_security_group.vpc-ssh.id
  cidr_ipv6         = aws_vpc.main.ipv6_cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.vpc-ssh.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
*/