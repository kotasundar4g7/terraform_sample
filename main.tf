# main.tf

# Specify the AWS provider
provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-sample-bucket-playgound2"  # Replace with your unique bucket name
  acl    = "private"  # Set the access control list (e.g., private, public-read)

  # Enable versioning
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Tagging the bucket
  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}
