provider "aws" {
  region = "ap-south-1"  # Replace with your region
}

# The S3 bucket resource is removed/commented out since the bucket already exists
# resource "aws_s3_bucket" "example" {
#   bucket = "your-existing-bucket-name"
# }

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = "my-sample-bucket-playgound3"

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
