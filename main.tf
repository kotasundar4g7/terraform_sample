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
