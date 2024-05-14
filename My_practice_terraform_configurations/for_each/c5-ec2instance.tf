#resource block
resource "aws_instance" "myec2vm" {
    for_each = var.environments
    ami = data.aws_ami.test-ubuntu_free_tier.id
    key_name= var.test-key
    instance_type = each.value.size
    # availability_zone = data.aws_availability_zones.myaz.names
    availability_zone = element(data.aws_availability_zones.available.names, each.value.az_index)
    user_data = file("${path.module}/app1-install.sh")
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
    tags = {
        "Name" = "ec2-${each.key}"
        # "tag" = "${each.value}"
    }
}