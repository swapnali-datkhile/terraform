provider "aws" {
  region = "us-east-1"
}
data "terraform_remote_state" "eip" {
  backend = "s3" 
  config = {
    bucket = "s3-backend-4-4"
    key = "infra.tfstate"
    region = "us-east-1"
  }
}

resource "aws_security_group" "my-sg" {
  name = "my-sg"
}
resource "aws_vpc_security_group_ingress_rule" "allow_all" {
  security_group_id = aws_security_group.my-sg.id
  cidr_ipv4         = "${data.terraform_remote_state.eip.outputs.public-ips}/32"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}