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
    id     = "intelligent-tiering"
    status = "Enabled"

    filter {
      prefix = "your-prefix/"  # Optional: Specify a prefix if you want to limit this rule to certain objects
    }

    transition {
      days          = 1  # Number of days after object creation when it should transition to Intelligent-Tiering
      storage_class = "INTELLIGENT_TIERING"
    }
  }
}
