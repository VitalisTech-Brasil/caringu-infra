
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

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_pair_name
  public_key = file("caringu.pem.pub")
}

# ==================================
# Gera o nginx.conf dinâmico
# ==================================
data "template_file" "nginx_conf" {
  template = file("../cloud/public/nginx.conf.tpl")

  vars = {
    backend_ip = aws_instance.private_app.private_ip
  }

  depends_on = [aws_instance.private_app]
}

resource "local_file" "nginx_conf_rendered" {
  content  = data.template_file.nginx_conf.rendered
  filename = "../cloud/public/nginx/default.conf"

  depends_on = [aws_instance.private_app, data.template_file.nginx_conf]
}

resource "null_resource" "deploy_nginx_conf" {
  depends_on = [aws_instance.public_app, local_file.nginx_conf_rendered]

  # 1️⃣ Espera o Nginx estar disponível antes de enviar o arquivo
  provisioner "remote-exec" {
    inline = [
      "echo '🕓 Esperando instalação completa do Nginx...'",
      "while ! command -v nginx >/dev/null 2>&1; do echo '⏳ Nginx ainda não instalado'; sleep 5; done",
      "until [ -d /etc/nginx/conf.d ]; do echo '⏳ Pasta conf.d ainda não existe'; sleep 5; done",
      "echo '✅ Nginx detectado! Pronto para receber arquivo.'"
    ]

    connection {
      type        = "ssh"
      host        = aws_instance.public_app.public_ip
      user        = "ubuntu"
      private_key = file("./caringu.pem")
    }
  }

  # 2️⃣ Envia o arquivo renderizado para uma pasta temporária
  provisioner "file" {
    source      = local_file.nginx_conf_rendered.filename
    destination = "/home/ubuntu/default.conf"

    connection {
      type        = "ssh"
      host        = aws_instance.public_app.public_ip
      user        = "ubuntu"
      private_key = file("./caringu.pem")
    }
  }

  # 3️⃣ Move o arquivo com sudo e reinicia o Nginx
  provisioner "remote-exec" {
    inline = [
      "ls -lh /home/ubuntu/default.conf || echo '❌ Arquivo não encontrado após upload!'",
      "sudo mv /home/ubuntu/default.conf /home/ubuntu/caringu-infra/cloud/public/nginx/default.conf",
      "sudo cp /home/ubuntu/caringu-infra/cloud/public/nginx/default.conf /etc/nginx/conf.d/default.conf",
      "sudo chown root:root /etc/nginx/conf.d/default.conf",
      "sudo systemctl restart nginx",
      "echo '🚀 Nginx reiniciado com nova configuração.'"
    ]

    connection {
      type        = "ssh"
      host        = aws_instance.public_app.public_ip
      user        = "ubuntu"
      private_key = file("./caringu.pem")
    }
  }
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
  key_name                    = aws_key_pair.generated_key.id

  ebs_optimized = true

  # Disco raiz 20 GB
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  user_data = file("./scripts-init/setup-public.sh")

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-ec2-public" }
  )

  depends_on = [local_file.nginx_conf_rendered]
}

# =====================================
# EC2 Privada - Java / MySQL / RabbitMQ
# =====================================
resource "aws_instance" "private_app" {
  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name               = aws_key_pair.generated_key.id

  ebs_optimized = true

  # Disco raiz 20 GB
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  user_data = file("./scripts-init/setup-private.sh")

  tags = merge(
    local.common_tags,
    { Name = "${var.project_name}-ec2-private" }
  )

  depends_on = [
    aws_nat_gateway.this,
    aws_route_table_association.private
  ]
}
