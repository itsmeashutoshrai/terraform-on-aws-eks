# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [ module.ec2_public, module.vpc ]  # Ensures the EIP is created after the EC2 instance and VPC modules are created
  instance   = module.ec2_public.id              # Associates the EIP with the instance ID from the ec2_public module
  domain     = "vpc"   # Specifies that the EIP is for use in a VPC  
  # vpc      = true                        
  tags       = local.common_tags                 # Applies common tags defined in local variables
}

