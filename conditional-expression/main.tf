provider "aws" {
  region = "us-east-1"
}

variable "region" {
  default = "us-east-1"
}

variable "environment"{
  default = "production"
}
resource "aws_instance" "myec2" {
  ami = "ami-08b5b3a93ed654d19"
  instance_type = var.environment == "development" && var.region == "us-east-1" ? "t2.micro" : "m5.large"
}
