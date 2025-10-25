############################################
# STORAGE - S3 / EBS / Snapshot
############################################

resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name

  tags = merge(
    local.common_tags,
    { Name = "${var.environment}-bucket" }
  )
}

# Habilita bloqueio total de acesso público (boa prática)
resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

# Habilita criptografia padrão do lado do servidor (SSE) usando KMS
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = "alias/aws/s3" # Ou o ID/ARN de uma KMS Key personalizada
      sse_algorithm     = "aws:kms"
    }

    bucket_key_enabled = true
  }
}