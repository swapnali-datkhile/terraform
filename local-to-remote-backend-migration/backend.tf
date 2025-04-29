terraform {
  backend "s3" {
    bucket = "my-bucket-29-4-25"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}