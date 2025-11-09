#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

# Espera rede (porque o cloud-init às vezes começa antes da rede)
until ping -c1 github.com &>/dev/null; do
  echo "🌐 Aguardando rede..."
  sleep 3
done

# Instala dependências básicas
apt-get update -y
apt-get install -y git nginx

# Instala o Nginx apenas para ferramentas (não inicia)
sudo systemctl disable nginx || true
sudo systemctl stop nginx || true

# Clona o repositório da infraestrutura
cd /home/ubuntu
if [ ! -d "caringu-infra" ]; then
  echo "📥 Clonando repositório principal..."
  git clone https://github.com/VitalisTech-Brasil/caringu-infra.git
fi

chown -R ubuntu:ubuntu /home/ubuntu/caringu-infra

# Espera o arquivo default.conf ser enviado pelo Terraform
echo "⏳ Aguardando Terraform enviar o default.conf..."
while [ ! -f /home/ubuntu/default.conf ]; do
  echo "⌛ default.conf ainda não existe. esperando..."
  sleep 5
done
echo "✅ default.conf encontrado!"

# Move o arquivo para o projeto e aplica no Nginx
echo "📦 Movendo default.conf para o repositório..."
mkdir -p /home/ubuntu/caringu-infra/cloud/public/nginx
mv /home/ubuntu/default.conf /home/ubuntu/caringu-infra/cloud/public/nginx/default.conf

echo "⚙️ Aplicando configuração do Nginx..."
sudo cp /home/ubuntu/caringu-infra/cloud/public/nginx/default.conf /etc/nginx/conf.d/default.conf
sudo chown root:root /etc/nginx/conf.d/default.conf
echo "✅ Configuração copiada (o Nginx do host não será iniciado, container vai cuidar disso)."

# Executa o script principal como usuário normal
cd /home/ubuntu/caringu-infra/cloud/public
chmod +x script.sh
sudo -u ubuntu bash ./script.sh