provider "aws" {
  region = "us-east-1"
}

variable "sensitive-content" {
  default = "supersecretpassw0rd"
  sensitive = true
}

resource "local_sensitive_file" "credentials" {
  content = "supersecretpassw0rd"
  filename = "password.txt"
}

output "cred-content" {
  value = local_sensitive_file.credentials.content
  sensitive = true
}