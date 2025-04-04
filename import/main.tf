provider "aws" {
  region = "us-east-1"
}

import {
  to = aws_security_group.terraform-sg
  id = "sg-0d6698429bb06d0c0"
}