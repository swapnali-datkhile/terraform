provider "aws" {
    region = "us-east-1"
}

variable "user-name" {
  type = set(string)
  default = [ "Meta", "bob", "Alice" ]
}
resource "aws_iam_user" "this" {
    for_each = var.user-name
    name = each.value
}
