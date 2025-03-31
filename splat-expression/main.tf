provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "this" {
  name = "iamuser-${count.index}"
  count = 3
}

output "list-arn" {
  value = aws_iam_user.this[*].arn
}

/*
A splat expression provides a more concise way to express a common operation that could otherwise be performed with a for expression.

If var.list is a list of objects that all have an attribute id, then a list of the ids could be produced with the following for expression:

  [for o in var.list : o.id]

This is equivalent to the following splat expression:

  var.list[*].id

The special [*] symbol iterates over all of the elements of the list given to its left and accesses from each one the attribute name given on its right
*/
