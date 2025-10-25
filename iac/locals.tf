locals {
  common_tags = {
    Project     = "Caringu"
    ManagedBy   = "Terraform"
    Environment = var.environment
  }
}