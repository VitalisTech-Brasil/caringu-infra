# -----------------------------------------------------------------------
# Variáveis associadas a configuração geral do provedor AWS e tags comuns
# -----------------------------------------------------------------------
variable "region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Ambiente de implantação (dev, staging, prod)"
  type        = string
  default     = "prod"
}

variable "project_name" {
  description = "Nome do projeto para compor nomes de recursos"
  type        = string
  default     = "caringu"
}

variable "availability_zone" {
  description = "Zona de disponibilidade onde os recursos serão implantados"
  type        = string
  default     = "us-east-1a"
}

# -----------------------------------------
# --- Variáveis associadas à network.tf ---
# -----------------------------------------
variable "vpc_cidr" {
  description = "Bloco CIDR para a VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Bloco CIDR para a sub-rede pública"
  type        = string
}

variable "private_subnet_cidr" {
  description = "Bloco CIDR para a sub-rede privada"
  type        = string
  default     = ""
}


# -----------------------------------------
# --- Variáveis associadas à compute.tf ---
# -----------------------------------------
variable "ec2_ami_id" {
  description = "AMI ID da instância EC2"
  type        = string
  default     = "ami-0360c520857e3138f" # Ubuntu 24.04
}

variable "ec2_instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t3.large"
}

variable "key_pair_name" {
  type        = string
  default     = "caringu"
  description = "Nome do par de chaves (key pair) para acesso SSH"
}

variable "instance_type" {
  description = "Tipo da instância EC2 para a aplicação"
  type        = string
  default     = "t3.large"
}

variable "volume_size" {
  description = "Tamanho do volume para a instância EC2 (em GB)"
  type        = number
  default     = 20
}

variable "volume_type" {
  description = "Tipo do volume EBS para a instância EC2"
  type        = string
  default     = "gp3"
}

variable "ssh_allowed_cidr" {
  description = "CIDR que pode acessar SSH na instância Proxy"
  type        = string
  default     = "0.0.0.0/0"
}

# -----------------------------------------
# --- Variáveis para repasse de credenciais AWS ---
# -----------------------------------------

variable "aws_access_key_id" {
  description = "AWS Access Key ID a ser repassada para as instâncias (via user_data)"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key a ser repassada para as instâncias (via user_data)"
  type        = string
}

variable "aws_session_token" {
  description = "AWS Session Token a ser repassado para as instâncias (via user_data)"
  type        = string
}

# -----------------------------------------
# --- Variáveis associadas à storage.tf ---
# -----------------------------------------
#
# IMPORTANTE:
# O Terraform pergunta as variáveis em ordem alfabética.
# Por isso, usamos "bucket_create" antes de "bucket_name"
# para garantir que a pergunta de criar ou não o bucket
# apareça primeiro no prompt interativo.
variable "bucket_create" {
  description = "Define se o Terraform deve criar o bucket S3 (digite 'true') ou reutilizar um existente (digite 'false')"
  type        = bool
}

variable "bucket_name" {
  description = "Nome do bucket S3 usado para armazenar arquivos de mock e outros assets (novo OU já existente)"
  type        = string
}

# -----------------------------------------
# --- Variáveis associadas aos Frontends ---
# -----------------------------------------

variable "frontend_server_ids" {
  description = "Lista de identificadores usados no header X-Server-Id para cada instância de frontend"
  type        = list(string)
  default     = ["EC2-1", "EC2-2"]
}


