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

cd /home/ubuntu/caringu-infra/cloud/proxy
if [ -f "script.sh" ]; then
  chmod +x script.sh
  sudo -u ubuntu bash ./script.sh
fi

echo "✅ Setup da instância de Proxy concluído (Docker/compose serão tratados pelo script da pasta cloud/proxy)."


