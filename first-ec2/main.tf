provider "aws" {
    region = "us-east-1"
    # access_key = ""
    # secret_key = ""
    # authenctication credentials are configured via aws cli
}

resource "aws_instance" "demo_instance" {
    ami = "ami-08b5b3a93ed654d19"
    instance_type = "t2.micro"

    tags = {
        Name = "my-ec2"
    }
}
