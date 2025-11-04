# --------------------
# S3 Bucket
# --------------------
resource "aws_s3_bucket" "main" {
  bucket = "${var.name}-${var.environment}"
  tags   = merge(var.tags, { Name = "${var.name}-bucket" })
}

# Versioning
resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Lifecycle rules for logs
resource "aws_s3_bucket_lifecycle_configuration" "logs" {
  bucket = aws_s3_bucket.main.id

  rule {
    id     = "logs"
    status = "Enabled"

    filter {
      prefix = "elb-logs/"
    }

    expiration {
      days = var.log_retention_days
    }
  }
}
