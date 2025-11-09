output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.this.id
}

output "public_subnet_id" {
  description = "ID da subrede pública"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID da subrede privada"
  value       = aws_subnet.private.id
}

output "internet_gateway_id" {
  description = "ID do Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  description = "ID do NAT Gateway"
  value       = aws_nat_gateway.this.id
}

output "public_route_table_id" {
  description = "ID da tabela de rotas pública"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID da tabela de rotas privada"
  value       = aws_route_table.private.id
}

# Outputs do Storage (S3)
output "bucket_id" {
  description = "ID do bucket S3"
  value       = aws_s3_bucket.app_bucket.id
}

output "bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.app_bucket.arn
}

# Outputs do Compute (EC2 Público)
output "public_instance_id" {
  description = "ID da instância EC2 pública"
  value       = aws_instance.public_app.id
}

output "public_instance_ip" {
  description = "IP público da instância EC2 pública"
  value       = aws_instance.public_app.public_ip
}

output "public_instance_private_ip" {
  description = "IP privado da instância EC2 pública"
  value       = aws_instance.public_app.private_ip
}

# Outputs do Compute (EC2 Privado)
output "private_instance_id" {
  description = "ID da instância EC2 privada"
  value       = aws_instance.private_app.id
}

output "private_instance_private_ip" {
  description = "IP privado da instância EC2 privada"
  value       = aws_instance.private_app.private_ip
}

# Outputs dos Security Groups
output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.app_sg.id
}

output "security_group_name" {
  description = "Nome do Security Group"
  value       = aws_security_group.app_sg.name
}