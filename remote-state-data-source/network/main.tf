provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "s3-backend-4-4"
    key = "infra.tfstate"
    region = "us-east-1"
  }
}
resource "aws_eip" "elastic-ip" {
  domain = "vpc"
}

output "public-ips" {
  value = aws_eip.elastic-ip.public_ip
}