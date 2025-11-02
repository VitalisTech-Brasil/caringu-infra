#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

echo "🚀 Iniciando configuração da instância privada..."

# Aguarda rede (se tiver NAT Gateway, garante tempo pro roteamento subir)
until ping -c1 github.com &>/dev/null; do
  echo "🌐 Aguardando rede..."
  sleep 3
done

# Instala git (mínimo necessário)
apt-get update -y
apt-get install -y git

# Clona o repositório da infraestrutura
cd /home/ubuntu
if [ ! -d "caringu-infra" ]; then
  echo "📥 Clonando repositório principal..."
  git clone https://github.com/VitalisTech-Brasil/caringu-infra.git
fi

chown -R ubuntu:ubuntu /home/ubuntu/caringu-infra

# Executa o script principal da parte privada
cd /home/ubuntu/caringu-infra/cloud/private
chmod +x script.sh
sudo -u ubuntu bash ./script.sh

echo "✅ Setup da instância privada concluído com sucesso!"