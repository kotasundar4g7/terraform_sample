

# Reference the existing S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-sample-bucket-playgound3"
  acl    = "private"

  # You can add additional bucket configurations here if needed
}

# Add lifecycle configuration for Intelligent-Tiering
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
