#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

echo "🚀 Iniciando configuração da instância de Proxy..."

apt-get update -y
apt-get install -y git

cd /home/ubuntu
if [ ! -d "caringu-infra" ]; then
  echo "📥 Clonando repositório principal..."
  git clone https://github.com/VitalisTech-Brasil/caringu-infra.git
fi

chown -R ubuntu:ubuntu /home/ubuntu/caringu-infra

# Aguardar o Terraform enviar o arquivo de configuração do Nginx
echo "⏳ Aguardando Terraform enviar o arquivo de configuração do Nginx (caringu-proxy-default.conf)..."
while [ ! -f /home/ubuntu/caringu-proxy-default.conf ]; do
  echo "⌛ Arquivo /home/ubuntu/caringu-proxy-default.conf ainda não existe. Aguardando..."
  sleep 5
done
echo "✅ Arquivo de configuração da Proxy recebido."

# Mover o arquivo para dentro do repositório
echo "📦 Movendo default.conf para o repositório..."
mkdir -p /home/ubuntu/caringu-infra/cloud/proxy/nginx
mv /home/ubuntu/caringu-proxy-default.conf /home/ubuntu/caringu-infra/cloud/proxy/nginx/default.conf

cd /home/ubuntu/caringu-infra/cloud/proxy
if [ -f "script.sh" ]; then
  chmod +x script.sh
  sudo -u ubuntu bash ./script.sh
fi

echo "✅ Setup da instância de Proxy concluído (Docker/compose serão tratados pelo script da pasta cloud/proxy)."


