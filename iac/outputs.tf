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

# output "nat_gateway_id" {
#   description = "ID do NAT Gateway"
#   value       = aws_nat_gateway.this.id
# }

output "public_route_table_id" {
  description = "ID da tabela de rotas pública"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID da tabela de rotas privada"
  value       = aws_route_table.private.id
}