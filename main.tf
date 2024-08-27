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
    id     = "new-testing"
    status = "Enabled"

    filter {
      prefix = "output_source/"  # Optional: Specify a prefix if you want to limit this rule to certain objects
    }

    transition {
      days          = 30  # Number of days after object creation when it should transition to Glacier instant retrieval
      storage_class = "GLACIER_IR"
    }
    transition {
      days          = 91  # Number of days after object creation when it should transition to Glacier instant retrieval
      storage_class = "DEEP_ARCHIVE"
    }
  }
}
