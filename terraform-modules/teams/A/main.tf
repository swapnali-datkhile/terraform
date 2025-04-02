provider "aws" {
  region = "ap-south-1"
}

module "ec2" {
  source = "../../modules/ec2"
  instance-type = "t2.small"
  ami = "ami-08b5b3a93ed654d19"
}

resource "aws_eip" "elastic-ip" {
  domain = "vpc"
  instance = module.ec2.instance-id
}
