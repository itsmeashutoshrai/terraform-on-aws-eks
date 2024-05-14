# EC2 Instance Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
#  value = aws_instance.myec2vm[each.key].public_ip
  value       = { for key, instance in aws_instance.myec2vm : key => instance.public_ip }
}

# EC2 Instance Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
#  value = aws_instance.myec2vm[each.key].public_dns
  value       = { for key, instance in aws_instance.myec2vm : key => instance.public_dns }
}