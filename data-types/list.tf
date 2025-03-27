variable "sg" {
  type = list
  default = ["sg-0fae23f3956b239ba","sg-043d71d75ab9ea447"]
}

resource "aws_instance" "my-ec2" {
  ami = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  tags = {
    Name = "myec2"
  }
  vpc_security_group_ids = var.sg
}

output "sg-id" {
  value = aws_instance.my-ec2.vpc_security_group_ids
}
