provider "aws" {
  region = "us-east-1"
}

data "local_file" "foo" {
  filename = "${path.module}/demo.txt"
}

output "message" {
  value = data.local_file.foo.content
}
