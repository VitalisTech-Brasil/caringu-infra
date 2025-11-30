############################################
# STORAGE - S3 / Upload de mocks
############################################

# Criação opcional do bucket S3 via módulo.
# O módulo já aplica:
# - force_destroy = true
# - bloqueio total de acesso público (aws_s3_bucket_public_access_block)
# - criptografia padrão SSE com KMS (aws_s3_bucket_server_side_encryption_configuration)
module "app_bucket" {
  source = "./modules/s3_bucket"
  count  = var.create_bucket ? 1 : 0

  bucket_name = var.bucket_name
  environment = var.environment
  tags        = local.common_tags
}

# Upload dos arquivos de mock para o bucket (apenas quando create_bucket = true)
resource "null_resource" "upload_mocks_to_s3" {
  count = var.create_bucket ? 1 : 0

  # Garante que o upload só acontece depois do bucket existir
  triggers = {
    bucket_name = module.app_bucket[0].bucket_name
  }

  provisioner "local-exec" {
    working_dir = path.module
    command     = "bash ./scripts-init/upload-mocks-to-s3.sh ${var.bucket_name}"
  }
}


