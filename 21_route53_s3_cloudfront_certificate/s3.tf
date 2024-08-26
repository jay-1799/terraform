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

resource "aws_s3_bucket_policy" "demo_bucket_policy" {
  bucket = aws_s3_bucket.demo.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          CanonicalUser = aws_cloudfront_origin_access_identity.demo_origin_access_identity.s3_canonical_user_id
        }
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.demo.arn}/*"
      }
    ]
  })
}


resource "null_resource" "upload_files" {
  depends_on = [aws_s3_bucket.demo]

  provisioner "local-exec" {
    command = <<EOT
      aws s3 sync ./v2 s3://demo.jaypatel.link --exclude "*.tmp"
    EOT
  }
}



