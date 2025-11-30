#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

echo "🚀 Iniciando configuração da instância de Backend..."

apt-get update -y
apt-get install -y git

cd /home/ubuntu
if [ ! -d "caringu-infra" ]; then
  echo "📥 Clonando repositório principal..."
  git clone https://github.com/VitalisTech-Brasil/caringu-infra.git
fi

chown -R ubuntu:ubuntu /home/ubuntu/caringu-infra

cd /home/ubuntu/caringu-infra/cloud/backend
if [ -f "script.sh" ]; then
  chmod +x script.sh
  sudo -u ubuntu \
    MYSQL_PRIVATE_IP="${mysql_private_ip}" \
    AWS_S3_BUCKET_NAME="${bucket_name}" \
    AWS_ACCESS_KEY_ID="${aws_access_key_id}" \
    AWS_SECRET_ACCESS_KEY="${aws_secret_access_key}" \
    AWS_SESSION_TOKEN="${aws_session_token}" \
    bash ./script.sh
fi

echo "✅ Setup da instância de Backend concluído."


