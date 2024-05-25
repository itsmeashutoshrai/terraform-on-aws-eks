#resource block
/*
resource "aws_instance" "myec2vm" {
    for_each = var.environments
    ami = data.aws_ami.test-ubuntu_free_tier.id
    key_name= var.test-key
    instance_type = each.value.size
    # availability_zone = data.aws_availability_zones.myaz.names[0]
    availability_zone = element(data.aws_availability_zones.available.names, each.value.az_index)
    user_data = file("${path.module}/app1-install.sh")
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
    tags = {
        "Name" = "ec2-${each.key}"
        # "tag" = "${each.value}"
    }
}
*/
resource "aws_instance" "env_server" {
  for_each      = var.environments
  ami           = data.aws_ami.test-ubuntu_free_tier.id
  key_name= var.test-key
  instance_type = each.value.size
  availability_zone = element(data.aws_availability_zones.available.names, each.value.az_index)
  user_data = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  tags = merge(
    {
      "Name" = "Server-${each.key}-${each.value}"
    },
    var.instance_tags[each.key]
  )
}

resource "aws_ebs_volume" "env_server_volume" {
  for_each = var.environments
  availability_zone = "ap-south-1a"
  size = 1
}

resource "aws_volume_attachment" "env_server_volumes" {
  for_each       = aws_instance.env_server
  device_name    = "/dev/sdh"
  volume_id      = aws_ebs_volume.env_server_volume[each.key].id
  instance_id    = each.value.id
}