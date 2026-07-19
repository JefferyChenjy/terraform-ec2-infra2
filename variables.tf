variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The ID of the VPC where the resources will be created"
  default     = "vpc-071dc429d54e64259"
}
