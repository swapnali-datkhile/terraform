resource "aws_security_group" "payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]
  tags = {
    env = "Dev"
    team = "Devlopers"
    Name = "Payments-app"
  }
}

resource "aws_security_group_rule" "allow-https" {
  security_group_id = aws_security_group.payment_app.id
  type              = "ingress"
  from_port         = var.https-port
  to_port           = var.https-port
  protocol          = var.protocol
  cidr_blocks       = var.egress-cidr
  description = "ingress allows HTTPS  from DEV VPC"
}

resource "aws_security_group_rule" "allow-api-dev" {
  security_group_id = aws_security_group.payment_app.id
  type              = "ingress"
  from_port         = var.http-port
  to_port           = var.http-port
  protocol          = var.protocol
  cidr_blocks       = var.egress-cidr
  description = "ingress allows APIs access from DEV VPC"
}

resource "aws_security_group_rule" "allow-api-prod" {
  security_group_id = aws_security_group.payment_app.id
  type              = "ingress"
  from_port         = var.altr-http-port
  to_port           = var.altr-http-port
  protocol          = var.protocol
  cidr_blocks       = ["${aws_eip.example.public_ip}/32"]
  description = "ingress allows APIs access from Prod App Public IP"
}

resource "aws_security_group_rule" "allow-all-outbound" {
  security_group_id = aws_security_group.payment_app.id
  type              = "egress"
  from_port         = var.splunk
  to_port           = var.splunk
  protocol          = var.protocol
  cidr_blocks       = var.egress-cidr
  description = "Splunk outbound rule"
}


resource "aws_eip" "example" {
  domain = "vpc"
  tags = {
    env = "Dev"
    team = "Devlopers"
    Name = "Payments-app"
  }
}

/*
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"

    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "splunk" {
  default = "8088"
}
resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
    description = "Application Security Group"
  depends_on = [aws_eip.example]

# Below ingress allows HTTPS  from DEV VPC
  ingress {
       from_port        = 443
     to_port          = 443
    protocol         = "tcp"
      cidr_blocks      = ["172.31.0.0/16"]
  }

# Below ingress allows APIs access from DEV VPC

  ingress {
    from_port        = 8080
      to_port          = 8080
    protocol         = "tcp"
       cidr_blocks      = ["172.31.0.0/16"]
  }

# Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port        = 8443
      to_port          = 8443
    protocol         = "tcp"
       cidr_blocks      = ["${aws_eip.example.public_ip}/32"]
  }
}
 egress {
    from_port        = var.splunk
    to_port          = var.splunk
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }



resource "aws_eip" "example" {
   domain = "vpc"
}
*/