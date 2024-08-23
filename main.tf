provider "aws" {
  region = "ap-south-1"  # Replace with your region
}

resource "aws_s3_bucket" "example" {
  bucket = "my-sample-bucket-playgound3"
}

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.example.bucket

  rule {
    id     = "log"
    status = "Enabled"

    filter {
      prefix = "logs/"
    }

    expiration {
      days = 30
    }
  }
}
