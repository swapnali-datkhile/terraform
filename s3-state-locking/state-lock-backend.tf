terraform {
  backend "s3" {
    bucket = "s3-backend-4-4-2025"
    key    = "infra.tfstate"
    region = "us-east-1"
    dynamodb_table = "state-lock-4-4"
  }
}

resource "time_sleep" "wait_150_seconds" {

  create_duration = "150s"
}