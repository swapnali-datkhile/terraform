data "aws_iam_access_keys" "example" {
  user = "terraform"
}

output "data" {
  value = data.aws_iam_access_keys.example.access_keys
}
