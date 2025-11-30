#!/bin/bash
set -euo pipefail

###############################################################################
# enable-https.sh
#
# Habilita HTTPS na instância de Proxy usando Let's Encrypt (Certbot),
# mantendo a arquitetura atual de proxy reverso e load balancer.
#
# USO:
#   ./enable-https.sh exemplo.ddns.net seu.email@sptech.school
#
# Se não passar parâmetros, usa defaults seguros para você editar no código.
###############################################################################

DOMAIN="${1:-caringu.ddns.net}"
EMAIL="${2:-vitalistech06@gmail.com}" # troque por um e-mail seu válido

echo "🚀 Iniciando habilitação de HTTPS para domínio: ${DOMAIN}"

cd "$(dirname "$0")"

echo "📁 Diretório atual: $(pwd)"

echo "📦 Criando diretórios para certificados e webroot do Certbot..."
sudo mkdir -p /etc/letsencrypt/live/"${DOMAIN}"
sudo mkdir -p /var/www/certbot

echo "👤 Ajustando permissões (ubuntu deve conseguir ler/escrever)..."
if id ubuntu &>/dev/null; then
  sudo chown -R ubuntu:ubuntu /etc/letsencrypt /var/www/certbot
fi

echo "🛑 Derrubando containers atuais (HTTP)..."
sudo docker compose down || true

echo "🔐 Gerando certificado DUMMY (autoassinado) para o Nginx subir..."
sudo docker compose run --rm --entrypoint "" certbot \
  sh -c "mkdir -p /etc/letsencrypt/live/${DOMAIN} && \
         openssl req -x509 -nodes -newkey rsa:2048 -days 1 \
           -keyout /etc/letsencrypt/live/${DOMAIN}/privkey.pem \
           -out /etc/letsencrypt/live/${DOMAIN}/fullchain.pem \
           -subj '/CN=localhost'"

echo "📝 Preparando configuração HTTPS do Nginx (preservando upstreams)..."

if [ ! -f nginx/default.conf ]; then
  echo "❌ Arquivo nginx/default.conf não encontrado. Verifique se o Terraform já rodou e o proxy está configurado."
  exit 1
fi

cp nginx/default.conf nginx/default-http.conf.bak

echo "✂️ Extraindo apenas os blocos de upstream (sem o server HTTP atual)..."
awk '
  BEGIN { in_server=0 }
  /^server[[:space:]]*\{/ && !in_server { in_server=1; next }
  in_server && /^}/ { in_server=0; next }
  !in_server { print }
' nginx/default-http.conf.bak > nginx/default.conf

echo "➕ Anexando blocos de servidor HTTP→HTTPS e HTTPS com certificados..."
cat nginx-https.conf >> nginx/default.conf

echo "🐳 Subindo containers com configuração HTTPS (usando certificado dummy)..."
sudo docker compose up -d

echo "✅ Nginx deve estar de pé com certificado temporário. Gerando certificado REAL..."
sudo docker compose run --rm --entrypoint "" certbot \
  certbot certonly \
    --webroot \
    --webroot-path /var/www/certbot \
    -d "${DOMAIN}" \
    --email "${EMAIL}" \
    --agree-tos \
    --no-eff-email \
    --break-my-certs

echo "🔎 Conferindo arquivos de certificado dentro do host..."
sudo ls -l /etc/letsencrypt/live/"${DOMAIN}" || true

echo "🧪 Testando configuração do Nginx dentro do container..."
sudo docker exec -it caringu-proxy nginx -t

echo "🔄 Recarregando Nginx com certificados válidos..."
sudo docker exec -it caringu-proxy nginx -s reload

echo "🎉 HTTPS habilitado para ${DOMAIN}!"


