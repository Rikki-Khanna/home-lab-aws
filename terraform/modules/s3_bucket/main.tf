
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "bucket" {

  bucket = var.use_prefix ? "${substr(md5(data.aws_caller_identity.current.account_id), 0, 6)}-${var.bucket_name}" : var.bucket_name

  force_destroy = var.force_destroy

  object_lock_enabled = var.object_lock_enabled

  tags = var.tags
}

resource "aws_s3_bucket_acl" "s3_acl" {

  bucket = aws_s3_bucket.bucket.id

  acl = var.acl
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = var.bucket_status
  }
}