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
  default     = "t3.micro"
}

variable "ec2_chave_pem" {
  description = "Nome do par de chaves (key pair) para acesso SSH"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2 para a aplicação"
  type        = string
  default     = "t3.medium"
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

# -----------------------------------------
# --- Variáveis associadas à storage.tf ---
# -----------------------------------------
variable "bucket_name" {
  description = "Nome do bucket S3 para armazenar arquivos ou logs"
  type        = string
}