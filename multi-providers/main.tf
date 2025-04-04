provider "aws" {
  region = "us-east-1"
}
provider "aws" {
  region = "us-east-1"
  alias = "virginia"
}

provider "aws" {
  region = "ap-south-1"
  alias = "mumbai"
}
resource "aws_security_group" "v-sg" {
  name = "v-sg"
  provider = aws.virginia
}
resource "aws_eip" "eip-v" {
  domain = "vpc"
  provider = aws.virginia
}

resource "aws_eip" "eip-m" {
  domain = "vpc"
  provider = aws.mumbai
}