# Get List of Availability Zones in a Specific Region
# Region is set in c1-versions.tf in Provider Block

# Check if that respective Instance Type is supported in that Specific Region in list of availability Zones
# Get the List of Availability Zones in a Particular region where that respective Instance Type is supported
# Datasource-2


data "aws_ec2_instance_type_offerings" "my_ins_type" {
  filter {
    name   = "location"
    values = ["ap-south-1a"]
  }
}
output "output_of_data_source" {
  value = [for t in data.aws_ec2_instance_type_offerings.my_ins_type: t.instance_types]
}

