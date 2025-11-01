
############################################
# COMPUTE - EC2 / Instâncias / Roles
############################################

# Security Group - Único (para ambas EC2s)
resource "aws_security_group" "app_sg" {
  name   = "${var.project_name}-app-sg"
  vpc_id = aws_vpc.this.id

  # Ingress TCP: 22, 80, 443, 3000, 8080
  ingress {
    description = "Acesso SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Acesso HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Acesso HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Acesso Node/React"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Acesso Backend/Java"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress para todo o tráfego
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-app-sg" }
  )
}

# ==================================
# EC2 Publica - Node(React) / Python
# ==================================
resource "aws_instance" "public_app" {
  ami                         = var.ec2_ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.app_sg.id]
  associate_public_ip_address = true
  key_name                    = var.ec2_chave_pem

  ebs_optimized = true

  # Disco raiz 20 GB
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  user_data = file("./scripts-init/setup-public.sh") # <== script que instala Docker + sobe containers

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-ec2-public" }
  )
}

# =====================================
# EC2 Privada - Java / MySQL / RabbitMQ
# =====================================
resource "aws_instance" "private_app" {
  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name               = var.ec2_chave_pem

  ebs_optimized = true

  # Disco raiz 20 GB
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  user_data = file("./scripts-init/setup-private.sh") # <== script que instala Docker + sobe containers

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-ec2-private" }
  )
}