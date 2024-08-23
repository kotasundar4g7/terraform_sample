# Specify the provider (AWS in this case)
provider "aws" {
  region = "us-east-1" # Set your desired AWS region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-sample-bucket-playgound2" # The bucket name must be globally unique
  acl    = "private"               # Set the bucket's ACL (e.g., private, public-read)

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

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}

# Optional: Set up a bucket policy (replace with your policy)
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.bucket

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.my_bucket.arn}",
        "${aws_s3_bucket.my_bucket.arn}/*"
      ],
      "Principal": "*"
    }
  ]
}
POLICY
}
