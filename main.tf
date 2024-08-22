# Configure the AWS provider
provider "aws" {
  region = "us-west-2"  # Specify the AWS region
}

# Manage an existing S3 bucket and add a lifecycle rule
resource "aws_s3_bucket" "existing_bucket" {
  bucket = "dev-sireesha-working"  # Replace with your existing bucket name

  # Define lifecycle rules
  lifecycle_rule {
    id      = "transition-to-standard-ia"  # Identifier for the rule
    enabled = true

    # Apply the rule to all objects in the bucket
    prefix = "input_source/"  # Leave empty to apply to all objects

    # Transition objects to Standard-IA after 30 days
    transition {
      days          = 30               # Number of days after creation
      storage_class = "STANDARD_IA"    # Storage class to transition to
    }

    # Optional: Add additional transitions or expiration rules
    # Transition objects to Glacier after 90 days
    # transition {
    #   days          = 90
    #   storage_class = "GLACIER"
    # }

    # Expire (delete) objects after 365 days
    # expiration {
    #   days = 365
    # }
  }

  # Ensure Terraform does not attempt to recreate the bucket
  lifecycle {
    ignore_changes = [
      # Ignore changes to properties that might cause a recreation
      # e.g., versioning configuration, logging, etc.
    ]
  }
}

# Optional: Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.existing_bucket.bucket
}
