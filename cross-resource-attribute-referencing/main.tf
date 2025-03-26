provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "static-ip" {
  domain = "vpc"
}

resource "aws_security_group" "client-sg" {
  name = "client-sg"
}

resource "aws_vpc_security_group_ingress_rule" "allow-all" {
  security_group_id = aws_security_group.client-sg.id
  cidr_ipv4 = "${aws_eip.static-ip.public_ip}/32"
  from_port = 80
  to_port = 80
  ip_protocol = "tcp"
}
