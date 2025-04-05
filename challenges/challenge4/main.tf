data "aws_caller_identity" "current" {}
data "aws_iam_users" "all-users" {}

locals {
  account-id = data.aws_caller_identity.current.account_id
}

resource "aws_iam_user" "admin" {
  name = "admin-user-${local.account-id}"
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "users" {
  value = data.aws_iam_users.all-users.names
}

output "users-count" {
  value = length(data.aws_iam_users.all-users.names)
}
