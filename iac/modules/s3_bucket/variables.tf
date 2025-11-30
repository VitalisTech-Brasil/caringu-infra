variable "bucket_name" {
  description = "Nome do bucket S3 que será criado"
  type        = string
}

variable "environment" {
  description = "Ambiente (dev, staging, prod) usado para tags e nomenclatura"
  type        = string
}

variable "tags" {
  description = "Mapa de tags padrão a serem aplicadas ao bucket"
  type        = map(string)
  default     = {}
}


