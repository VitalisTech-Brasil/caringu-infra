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
/* output "bucket_id" {
  description = "ID do bucket S3"
  value       = aws_s3_bucket.app_bucket.id
}

output "bucket_arn" {
  description = "ARN do bucket S3"
  value       = aws_s3_bucket.app_bucket.arn
}
 */
############################################
# Outputs do Compute (novas instâncias)
############################################

output "proxy_public_ip" {
  description = "IP público da instância de Proxy"
  value       = module.proxy.public_ip
}

output "proxy_private_ip" {
  description = "IP privado da instância de Proxy"
  value       = module.proxy.private_ip
}

output "frontend_private_ips" {
  description = "IPs privados das instâncias de Frontend"
  value       = [for f in module.frontend : f.private_ip]
}

output "frontend_public_ips" {
  description = "IPs públicos das instâncias de Frontend"
  value       = [for f in module.frontend : f.public_ip]
}

output "backend_private_ips" {
  description = "IPs privados das instâncias de Backend"
  value       = [for b in module.backend : b.private_ip]
}

output "mysql_private_ip" {
  description = "IP privado da instância de MySQL"
  value       = module.mysql.private_ip
}

############################################
# Outputs dos Security Groups
############################################

output "proxy_security_group_id" {
  description = "ID do Security Group da instância de Proxy"
  value       = aws_security_group.proxy_sg.id
}

output "frontend_security_group_id" {
  description = "ID do Security Group das instâncias de Frontend"
  value       = aws_security_group.frontend_sg.id
}

output "backend_security_group_id" {
  description = "ID do Security Group das instâncias de Backend"
  value       = aws_security_group.backend_sg.id
}

output "mysql_security_group_id" {
  description = "ID do Security Group da instância de MySQL"
  value       = aws_security_group.mysql_sg.id
}