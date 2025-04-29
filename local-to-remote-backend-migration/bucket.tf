resource "aws_s3_bucket" "example" {
  bucket = "my-bucket-29-4-25"

  tags = {
    Name        = "my-bucket-29-4-25"
  }
}