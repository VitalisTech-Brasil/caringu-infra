#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

# Espera rede (porque o cloud-init às vezes começa antes da rede)
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

# Executa o script principal como usuário normal
cd /home/ubuntu/caringu-infra/cloud/public
chmod +x script.sh
sudo -u ubuntu bash ./script.sh