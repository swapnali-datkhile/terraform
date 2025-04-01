provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
  ami = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> server-ip.txt"
  }
}
