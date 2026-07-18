resource "aws_instance" "public" {
  ami           = "ami-01edba92f9036f76e" #ami-01edba92f9036f76e
  instance_type = "t2.micro"
  subnet_id     = "subnet-07fe08d5909e677db"
  associate_public_ip_address = true
  key_name     = "jeffery-key-pair"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "jeffery-ec2-instance"
  }
}

resource aws_security_group "allow_ssh" {
  name        = "jeffery-terraform-security-group"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-071dc429d54e64259" #vpc-071dc429d54e64259
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id
  cidr_ipv4         = "0.0.0.0/0"  
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

