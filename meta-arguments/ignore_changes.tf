provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "myec2" {
    instance_type = "t2.micro"
    ami = "ami-084568db4383264d4"

    tags = {
      Name = "myec2"
    }

    lifecycle {
      ignore_changes = [ tags ]
    }

}
