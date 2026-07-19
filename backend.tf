terraform {
  backend "s3" {
    bucket = "sctp-tfstate-ce13"
    key    = "jeffery-terraform-ec2-infra2/terraform.tfstate"
    region = "us-east-1"
  }
}
