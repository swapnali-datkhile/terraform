provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
  ami = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  key_name = "terraform-key"
  vpc_security_group_ids = ["sg-098458011a23fd795"]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./terraform-key.pem")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nginx",
      "sudo systemctl start nginx ",
    ]
  }
}
