provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "elastic-ip" {
  domain = "vpc"
}
