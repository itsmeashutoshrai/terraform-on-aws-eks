data "aws_ami" "test-ubuntu_free_tier" {
    most_recent = true
    owners = ["amazon"]
    filter  {
        name = "Root device type"
        values = ["ebs"]
    }
    filter  {
        name = "Virtualization"
        values = ["hvm"]
    }
    filter  {
        name = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240423"]
    }
    filter {
      name   = "architecture"
      values = ["x86_64"]
  }
}