provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "client-sg" {
  name = "client-sg"
}

resource "aws_vpc_security_group_ingress_rule" "allow-all" {
  security_group_id = aws_security_group.client-sg.id
  cidr_ipv4 = var.vpn_ip
  from_port = var.app_port
  to_port = var.app_port
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow-ssh" {
  security_group_id = aws_security_group.client-sg.id
  cidr_ipv4 = var.vpn_ip
  from_port = var.ssh_port
  to_port = var.ssh_port
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow-ftp" {
  security_group_id = aws_security_group.client-sg.id
  cidr_ipv4 = var.vpn_ip
  from_port = var.ftp_port
  to_port = var.ftp_port
  ip_protocol = "tcp"
}
