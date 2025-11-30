#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive

echo "🚀 Iniciando configuração da instância de Frontend..."

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

# Gera o arquivo default.conf a partir do conteúdo já renderizado pelo Terraform
echo "📝 Gerando arquivo de configuração do Nginx..."
mkdir -p /home/ubuntu/caringu-infra/cloud/public/nginx
cat >/home/ubuntu/caringu-infra/cloud/public/nginx/default.conf <<'EOF'
${nginx_conf}
EOF

echo "✅ Arquivo /home/ubuntu/caringu-infra/cloud/public/nginx/default.conf criado."

# (Opcional) Copia também para o Nginx do host, caso seja útil para debug
echo "⚙️ Aplicando configuração do Nginx do host (apenas referência)..."
sudo cp /home/ubuntu/caringu-infra/cloud/public/nginx/default.conf /etc/nginx/conf.d/default.conf
sudo chown root:root /etc/nginx/conf.d/default.conf
echo "✅ Configuração copiada (o Nginx do host não será iniciado, container vai cuidar disso)."

# Executa o script principal como usuário normal
cd /home/ubuntu/caringu-infra/cloud/public
chmod +x script.sh
sudo -u ubuntu bash ./script.sh


