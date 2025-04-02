provider "aws" {
    region = "us-east-1"
}

locals {
  instance_type = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "t2.small"
  }
}

resource "aws_instance" "my-ec2" {
  ami = "ami-08b5b3a93ed654d19"
  instance_type = local.instance_type[terraform.workspace]
}

