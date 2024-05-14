#resource block
resource "aws_instance" "myec2vm" {
    for_each = var.environments
    ami = data.aws_ami.test-ubuntu_free_tier.id
    key_name= var.test-key
    instance_type = each.value.size
    availability_zone = each.value.region
    user_data = file("${path.module}/app1-install.sh")
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
    tags = {
        "Name" = "ec2-$(each.key)"
        # "tag" = "$(each.value)"
    }
}