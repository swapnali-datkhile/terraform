provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
  ami = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  count = 3

  tags = {
    Name = "user-${var.username[count.index]}"
  }

}

#resource "aws_iam_user" "name" {
#  name = "payments-user-${count.index}"
#  count = 3
#}

variable "username" {
  type = list
  default = ["Alice","Bob","John"]
}

resource "aws_iam_user" "users" {
  name = var.username[count.index]
  count = 3
}
