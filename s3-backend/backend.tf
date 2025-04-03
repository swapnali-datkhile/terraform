terraform {
  backend "s3" {
    bucket = "my-s3-bucket-4-4-2025"
    key = "network/terraform.tfstate"
    region = "us-east-1"
  }
}