# Specify the provider (AWS in this case)
provider "aws" {
  region = "ap-south-1" #  Set your desired AWS region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-sample-bucket-playgound3" # The bucket name must be globally unique
  acl    = "private"               # Set the bucket's ACL (e.g., private, public-read)

  # Enable versioning


  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.bucket

  rule {
    id     = "Transition to Intelligent-Tiering"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "INTELLIGENT_TIERING"
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "INTELLIGENT_TIERING"
    }

    expiration {
      expired_object_delete_marker = true
    }
  }
}

