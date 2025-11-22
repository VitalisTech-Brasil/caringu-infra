variable "ami" {
  description = "AMI da instância EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
}

variable "subnet_id" {
  description = "Subnet onde a instância será criada"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Lista de Security Groups associados à instância"
  type        = list(string)
}

variable "associate_public_ip_address" {
  description = "Se a instância deve ter IP público associado"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "Nome do key pair para acesso SSH"
  type        = string
}

variable "root_volume_size" {
  description = "Tamanho do volume raiz (GB)"
  type        = number
}

variable "root_volume_type" {
  description = "Tipo do volume raiz"
  type        = string
}

variable "user_data" {
  description = "Script de inicialização (user_data)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags adicionais para a instância"
  type        = map(string)
  default     = {}
}


