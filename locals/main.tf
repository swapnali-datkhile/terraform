provider "aws" {
  region = "us-east-1"
}

variable "team" {
  type = map
  default = {
  Team = "security-team"
  }
}

locals {
  default = {
  Team = "security-teams"
  CreationDate = "date-${formatdate("DDMMYYYY", timestamp())}"
  }
}

resource "aws_security_group" "sg" {
  name = "security-firewall"
  tags = local.default
}
