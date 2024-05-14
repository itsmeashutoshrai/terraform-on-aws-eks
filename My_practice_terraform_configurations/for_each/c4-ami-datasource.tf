data "aws_ami" "test-ubuntu_free_tier" {
    most_recent = true
    owners = ["amazon"]
    filter = {
        name = "Root device type"
        values = ["ebs"]
    }
    filter = {
        name = "Virtualization-myprac"
        values = ["hvm"]
    }
    filter = {
        name = "name-myprac"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240423"]
    }
    filter {
      name   = "architecture-myprac"
      values = ["x86_64"]
  }
}