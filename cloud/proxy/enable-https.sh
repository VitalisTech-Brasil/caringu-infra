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
SKIP_CERTBOT="false"

echo "🚀 Iniciando habilitação de HTTPS para domínio: ${DOMAIN}"

cd "$(dirname "$0")"

echo "📁 Diretório atual: $(pwd)"

echo "📦 Criando diretórios para certificados e webroot do Certbot..."
sudo mkdir -p /etc/letsencrypt
sudo mkdir -p /var/www/certbot

CERT_PATH="/etc/letsencrypt/live/${DOMAIN}/fullchain.pem"

echo "🔎 Verificando se já existe certificado em ${CERT_PATH}..."
if sudo test -f "${CERT_PATH}"; then
  SUBJECT="$(sudo openssl x509 -in "${CERT_PATH}" -noout -subject 2>/dev/null || echo "")"
  if echo "${SUBJECT}" | grep -q "CN=localhost"; then
    echo "🧹 Certificado dummy anterior detectado para ${DOMAIN}. Limpando para reemitir..."
    sudo rm -rf "/etc/letsencrypt/live/${DOMAIN}" "/etc/letsencrypt/archive/${DOMAIN}" "/etc/letsencrypt/renewal/${DOMAIN}.conf"
  else
    echo "✅ Certificado existente encontrado para ${DOMAIN} (não é dummy). Pulando geração de dummy e emissão com Certbot."
    SKIP_CERTBOT="true"
  fi
fi

echo "👤 Ajustando permissões (ubuntu deve conseguir ler/escrever)..."
if id ubuntu &>/dev/null; then
  sudo chown -R ubuntu:ubuntu /etc/letsencrypt /var/www/certbot
fi

echo "🛑 Derrubando containers atuais (HTTP/HTTPS)..."
sudo docker compose down || true

if [ "${SKIP_CERTBOT}" = "false" ]; then
  echo "🔐 Gerando certificado DUMMY (autoassinado) para o Nginx subir..."
  sudo docker compose run --rm --entrypoint "" certbot \
    sh -c "mkdir -p /etc/letsencrypt/live/${DOMAIN} && \
           openssl req -x509 -nodes -newkey rsa:2048 -days 1 \
             -keyout /etc/letsencrypt/live/${DOMAIN}/privkey.pem \
             -out /etc/letsencrypt/live/${DOMAIN}/fullchain.pem \
             -subj '/CN=localhost'"
else
  echo "⏭️ Pulando geração de certificado dummy (já existe certificado real)."
fi

echo "📝 Preparando configuração HTTPS do Nginx (preservando upstreams)..."

if [ ! -f nginx/default.conf ]; then
  echo "❌ Arquivo nginx/default.conf não encontrado. Verifique se o Terraform já rodou e o proxy está configurado."
  exit 1
fi

sudo cp nginx/default.conf nginx/default-http.conf.bak

echo "✂️ Extraindo apenas os blocos de upstream (sem o server HTTP atual)..."
awk '
  BEGIN { in_server=0 }
  /^server[[:space:]]*\{/ && !in_server { in_server=1; next }
  in_server && /^}/ { in_server=0; next }
  !in_server { print }
' nginx/default-http.conf.bak > nginx/default.conf

echo "➕ Anexando blocos de servidor HTTP→HTTPS e HTTPS com certificados..."
cat nginx-https.conf >> nginx/default.conf

echo "🐳 Subindo containers com configuração HTTPS..."
sudo docker compose up -d

if [ "${SKIP_CERTBOT}" = "false" ]; then
  echo "✅ Nginx deve estar de pé com certificado temporário. Gerando certificado REAL..."
  sudo docker compose run --rm --entrypoint "" certbot \
    certbot certonly \
      --non-interactive \
      --keep-until-expiring \
      --webroot \
      --webroot-path /var/www/certbot \
      -d "${DOMAIN}" \
      --email "${EMAIL}" \
      --agree-tos \
      --no-eff-email \
      --break-my-certs
else
  echo "⏭️ Pulando etapa de emissão com Certbot (já existe certificado para ${DOMAIN})."
fi

echo "🔎 Conferindo arquivos de certificado dentro do host..."
sudo ls -l /etc/letsencrypt/live/"${DOMAIN}" || true

echo "🧪 Testando configuração do Nginx dentro do container..."
sudo docker exec -it caringu-proxy nginx -t

echo "🔄 Recarregando Nginx com certificados válidos..."
sudo docker exec -it caringu-proxy nginx -s reload

echo "🎉 HTTPS habilitado para ${DOMAIN}!"


