
############################################
# COMPUTE - EC2 / Instancias / Roles
############################################

############################################
# Security Groups
############################################

# SG do Proxy (público)
resource "aws_security_group" "proxy_sg" {
  name   = "${var.project_name}-proxy-sg"
  vpc_id = aws_vpc.this.id

  # SSH restrito
  ingress {
    description = "Acesso SSH a partir do CIDR permitido"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_allowed_cidr]
  }

  # HTTP
  ingress {
    description = "Acesso HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS
  ingress {
    description = "Acesso HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress para todo o trafego
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-proxy-sg" }
  )
}

# SG dos Frontends (publicos)
resource "aws_security_group" "frontend_sg" {
  name   = "${var.project_name}-frontend-sg"
  vpc_id = aws_vpc.this.id

  # HTTP vindo apenas da Proxy
  ingress {
    description     = "HTTP a partir da instancia de Proxy"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_sg.id]
  }

  # React/Vite (5173) vindo apenas da Proxy
  ingress {
    description     = "React/Vite (porta 5173) a partir da instancia de Proxy"
    from_port       = 5173
    to_port         = 5173
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_sg.id]
  }

  # FastAPI (8000) vindo apenas da Proxy
  ingress {
    description     = "FastAPI (porta 8000) a partir da instancia de Proxy"
    from_port       = 8000
    to_port         = 8000
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_sg.id]
  }

  # SSH apenas vindo da Proxy (bastion)
  ingress {
    description     = "SSH a partir da instancia de Proxy"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_sg.id]
  }

  # Egress para todo o trafego
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-frontend-sg" }
  )
}

# SG dos Backends (privados)
resource "aws_security_group" "backend_sg" {
  name   = "${var.project_name}-backend-sg"
  vpc_id = aws_vpc.this.id

  # HTTP / API vindo da Proxy
  ingress {
    description     = "Trafego HTTP da instancia de Proxy (rota /api)"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_sg.id]
  }

  # SSH apenas vindo da Proxy
  ingress {
    description     = "SSH a partir da instancia de Proxy"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_sg.id]
  }

  # Spring Boot (8081) vindo da Proxy
  ingress {
    description     = "Spring Boot default port"
    from_port       = 8081
    to_port         = 8081
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_sg.id]
  }

  # Egress para todo o trafego
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-backend-sg" }
  )
}

# SG do MySQL (privado)
resource "aws_security_group" "mysql_sg" {
  name   = "${var.project_name}-mysql-sg"
  vpc_id = aws_vpc.this.id

  # MySQL acessível apenas a partir dos backends
  ingress {
    description     = "Acesso MySQL a partir das instancias de backend"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.backend_sg.id]
  }

  # SSH apenas vindo da Proxy (como bastion)
  ingress {
    description     = "SSH a partir da instancia de Proxy"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_sg.id]
  }

  # Egress para todo o trafego
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-mysql-sg" }
  )
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_pair_name
  public_key = file("caringu.pem.pub")
}

############################################
# Instancias EC2 via módulo genérico
############################################

locals {
  frontend_count = 2
  backend_count  = 2
}

# EC2 Proxy (pública) - Nginx / LB / Reverse Proxy
module "proxy" {
  source = "./modules/ec2_instance"

  ami                         = var.ec2_ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.proxy_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.generated_key.id

  root_volume_size = var.volume_size
  root_volume_type = var.volume_type

  user_data = file("${path.module}/scripts-init/setup-proxy.sh")

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-ec2-proxy" }
  )
}

# ==================================
# Geração do nginx.conf da Proxy
# ==================================

data "template_file" "proxy_nginx_conf" {
  template = file("../cloud/proxy/nginx.conf.tpl")

  vars = {
    frontend_1_ip = module.frontend[0].private_ip
    frontend_2_ip = module.frontend[1].private_ip
    backend_1_ip  = module.backend[0].private_ip
    backend_2_ip  = module.backend[1].private_ip
  }
}

resource "local_file" "proxy_nginx_conf_rendered" {
  content  = data.template_file.proxy_nginx_conf.rendered
  filename = "../cloud/proxy/nginx/default.conf"
}

resource "null_resource" "deploy_proxy_nginx_conf" {
  depends_on = [
    module.proxy,
    local_file.proxy_nginx_conf_rendered
  ]

  # Garante que a instância de Proxy está acessível via SSH
  provisioner "remote-exec" {
    inline = [
      "echo '🕓 Aguardando instância de Proxy ficar disponível via SSH...'",
      "until command -v cloud-init >/dev/null 2>&1; do echo '⏳ Aguardando cloud-init...'; sleep 5; done",
      "echo '✅ Instância de Proxy acessível via SSH.'"
    ]

    connection {
      type        = "ssh"
      host        = module.proxy.public_ip
      user        = "ubuntu"
      private_key = file("./caringu.pem")
    }
  }

  # Envia o arquivo gerado para a home do usuário ubuntu
  provisioner "file" {
    source      = local_file.proxy_nginx_conf_rendered.filename
    destination = "/home/ubuntu/caringu-proxy-default.conf"

    connection {
      type        = "ssh"
      host        = module.proxy.public_ip
      user        = "ubuntu"
      private_key = file("./caringu.pem")
    }
  }
}

# EC2s de Frontend (públicas) - React + Python
module "frontend" {
  source = "./modules/ec2_instance"
  count  = local.frontend_count

  ami                         = var.ec2_ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.generated_key.id

  root_volume_size = var.volume_size
  root_volume_type = var.volume_type

  # user_data gerado via template, com X-Server-Id único por instância
  user_data = templatefile("${path.module}/scripts-init/setup-public.sh.tpl", {

    nginx_conf = templatefile("../cloud/public/nginx/default.conf.tpl", {
      server_id = var.frontend_server_ids[count.index]
    })

  })

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-ec2-frontend-${count.index + 1}" }
  )
}

# EC2s de Backend (privadas) - Monólito + Microsserviço + RabbitMQ + Redis
module "backend" {
  source = "./modules/ec2_instance"
  count  = local.backend_count

  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  key_name               = aws_key_pair.generated_key.id

  root_volume_size = var.volume_size
  root_volume_type = var.volume_type

  # Template de user_data com o IP privado do MySQL, credenciais AWS e bucket S3 injetados
  user_data = templatefile("${path.module}/scripts-init/setup-backend.sh.tpl", {
    mysql_private_ip      = module.mysql.private_ip
    aws_access_key_id     = var.aws_access_key_id
    aws_secret_access_key = var.aws_secret_access_key
    aws_session_token     = var.aws_session_token
    bucket_name           = var.bucket_name
  })

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-ec2-backend-${count.index + 1}" }
  )

  depends_on = [
    aws_nat_gateway.this,
    aws_route_table_association.private
  ]
}

# EC2 do MySQL (privada)
module "mysql" {
  source = "./modules/ec2_instance"

  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]
  key_name               = aws_key_pair.generated_key.id

  root_volume_size = var.volume_size
  root_volume_type = var.volume_type

  user_data = file("${path.module}/scripts-init/setup-mysql.sh")

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-ec2-mysql" }
  )

  depends_on = [
    aws_nat_gateway.this,
    aws_route_table_association.private
  ]
}

