resource "aws_security_group" "vpc_ssh" {
  name        = "vpc-ssh"
  description = "Allow vpc-ssh traffic"
  vpc_id      = data.aws_vpc.selected.id
  tags = {
    Name = "vpc-ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "vpc_ssh_ipv4" {
  security_group_id = aws_security_group.vpc_ssh.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.vpc_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "vpc_ssh_web" {
  name        = "vpc-ssh-web"
  description = "Allow vpc-ssh traffic"
  vpc_id      = data.aws_vpc.selected.id
  tags = {
    Name = "vpc-ssh-web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "vpc_ssh_ipv4_web" {
  security_group_id = aws_security_group.vpc_ssh_web.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_web" {
  security_group_id = aws_security_group.vpc_ssh_web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
