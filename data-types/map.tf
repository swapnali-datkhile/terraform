variable "ec2-tags" {
  type = map(string)
  default = {
    Name = "myec2"
    Environment = "Prod"
    Team = "DevOps"
  }
}

resource "aws_instance" "myec2" {
  ami = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  tags = var.ec2-tags
}

output "all-tags" {
  value = aws_instance.myec2.tags_all
}
