#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

echo "🚀 Iniciando configuração da instância privada..."

echo "🌐 Testando conectividade com a Internet..."
for i in {1..20}; do
  if ping -c1 github.com &>/dev/null; then
    echo "✅ Internet disponível!"
    break
  fi
  echo "⌛ Tentativa $i/20 - aguardando rede NAT..."
  sleep 5
done

if ! ping -c1 github.com &>/dev/null; then
  echo "⚠️  Sem resposta da Internet após 20 tentativas. Continuando mesmo assim..."
fi

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