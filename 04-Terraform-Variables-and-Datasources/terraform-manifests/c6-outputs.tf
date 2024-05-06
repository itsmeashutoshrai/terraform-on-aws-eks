# Terraform Output Values

# EC2 Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.myec2vm.public_ip
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.myec2vm.public_dns
}
# output for default cidr block

output "default_cidr_block" {
  description = "The default CIDR block of the VPC"
  value       = data.aws_vpc.selected.cidr_block
}

# Output the created subnets' IDs and CIDR blocks
output "created_subnets" {
  value = { for subnet_id, subnet in aws_subnet.mytestsubnet : subnet_id => subnet.cidr_block }
}