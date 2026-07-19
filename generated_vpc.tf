# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_vpc" "copied_vpc" {
  cidr_block           = "10.13.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    Name = "jeffery-sctp-vpc-ce13-copy" # <--- This is the new name!
  }
}
