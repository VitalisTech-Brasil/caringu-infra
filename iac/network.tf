# ======================
# VPC
# ======================
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = false

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-vpc" }
  )
}

# ======================
# Internet Gateway (para subnet pública)
# ======================
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-igw" }
  )
}

# ======================
# Public Subnet
# ======================
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-public-subnet" }
  )
}

# ======================
# Route Table - Public
# ======================
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-public-rt" }
  )
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# ======================
# Private Subnet
# ======================
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-private-subnet" }
  )
}

# ======================
# NAT Gateway (opcional/temporário)
# ======================
# resource "aws_eip" "nat" {
#   domain = "vpc"
# }

# resource "aws_nat_gateway" "this" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.public.id
#   depends_on    = [aws_internet_gateway.this]

#    tags = merge(
#      local.common_tags,
#      { Name = "${var.project_name}-nat-gateway" }
#    )

# ======================
# Route Table - Private
# ======================
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  # route {
  #   cidr_block     = "0.0.0.0/0"
  #   nat_gateway_id = aws_nat_gateway.this.id
  # }

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-private-rt" }
  )
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

# ======================
# Network ACL - Pública
# ======================
resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.this.id

  subnet_ids = [aws_subnet.public.id]

  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-public-nacl" }
  )
}

# ======================
# Network ACL - Privada
# ======================
resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.this.id

  subnet_ids = [aws_subnet.private.id]

  # Permite todo o tráfego interno da VPC
  ingress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = var.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  # Permite tráfego de retorno
  egress {
    rule_no    = 100
    protocol   = "-1"
    action     = "allow"
    cidr_block = var.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-private-nacl" }
  )
}