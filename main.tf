resource "aws_instance" "public" {
  ami           = "ami-01edba92f9036f76e" #find the AMI ID of Amazon Linux 2023 - EC2 / Images/ AMI catalog
  instance_type = "t2.micro"
  subnet_id     = "subnet-07fe08d5909e677db" #select the subnet ID of the public subnet in your VPC
  associate_public_ip_address = true #associate a public IP address with the instance
  key_name     = "jeffery-key-pair-20260719" #
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "jeffery-ec2-instance-2"
  }
}

resource aws_security_group "allow_ssh" {
  name        = "jeffery-terraform-security-group"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"  
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

output "instance_public_ip" {
  value = aws_instance.public.public_ip
}

output "instance_public_dns" {
  value = aws_instance.public.public_dns
}

output "instance_id" {
  value = aws_instance.public.id
}

output "instance_ami" {
  value = aws_instance.public.ami
}

output "security_group_id" {
  value = aws_security_group.allow_ssh.id
}

output "vpc_id" {
  value = aws_security_group.allow_ssh.vpc_id
}


