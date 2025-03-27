provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
  ami = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  count = 3

  tags = {
    Name = "payments-system-${count.index}"
  }

}

resource "aws_iam_user" "name" {
  name = "payments-user-${count.index}"
  count = 3
}
