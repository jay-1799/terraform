module "s3_bucket_data" {
#   source                   = "https://github.com/cloudposse/terraform-aws-s3-bucket.git"
source = "cloudposse/s3-bucket/aws"
  enabled                  = true
  user_enabled             = true
  versioning_enabled       = false
  allowed_bucket_actions   = ["s3:*"]
  name                     = "backup-bucket"
  stage                    = "dev"
  namespace                = "data"

}

data "aws_s3_bucket" "data-backup-bucket" {
  bucket = module.s3_bucket_data.bucket_id
}

module "data-backup-bucket-user" {
#   source    = "https://github.com/cloudposse/terraform-aws-iam-s3-user.git?ref=master"
  source = "cloudposse/iam-s3-user/aws"
  namespace = "data"
  stage     = "dev"
  name      = "backup-bucket-readonly-user"
  s3_actions = [
    "s3:GetObject",
    "s3:ListBucket",
    "s3:GetBucketLocation"
  ]
  s3_resources = [
    "${data.aws_s3_bucket.data-backup-bucket.arn}/*",
    data.aws_s3_bucket.data-backup-bucket.arn
  ]
}

output "aws-developer-data-access-key" {
  value = module.data-backup-bucket-user.access_key_id
  sensitive = true
}

output "aws-developer-data-secret-key" {
  value = module.data-backup-bucket-user.secret_access_key
  sensitive = true
}

output "aws-s3-data-bucket-url" {
  value = module.s3_bucket_data.bucket_domain_name
}

output "aws-admin-data-access-key" {
  value = module.s3_bucket_data.access_key_id
  sensitive = true
}

output "aws-admin-data-secret-key" {
  value = module.s3_bucket_data.secret_access_key
  sensitive = true
}