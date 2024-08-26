resource "aws_s3_bucket" "demo" {
  bucket = var.b1
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.demo.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.demo.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.demo.arn}/*"
      }
    ]
  })
}
resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.demo.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "null_resource" "upload_files" {
  depends_on = [aws_s3_bucket.demo]

  provisioner "local-exec" {
    command = <<EOT
      aws s3 sync ./v2 s3://demo.jaypatel.link --exclude "*.tmp"
    EOT
  }
}



# Output for the S3 website URL
# output "website_url" {
#   value = aws_s3_bucket.demo.website_endpoint
# }


