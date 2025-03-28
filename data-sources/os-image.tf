provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "myimage" {
  owners           = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }
}

resource "aws_instance" "myec2" {
  ami = data.aws_ami.myimage.image_id
  instance_type = "t2.micro"
}

output "ami-id-value" {
  value = data.aws_ami.myimage.image_id
}
