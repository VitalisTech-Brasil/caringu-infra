#!/usr/bin/env bash
set -euo pipefail

DOMAIN="caringu.hopto.org"
EMAIL="gustavokohatsu@hotmail.com"
COMPOSE_CMD="docker compose"

echo "[enable-https] Iniciando processo de habilitação de HTTPS para ${DOMAIN}..."

cd "$(dirname "$0")"

# 1. Verificar se está rodando em uma EC2 (heurística simples pelo /sys/hypervisor ou /sys/devices/virtual/dmi)
if [[ -f /sys/hypervisor/uuid ]] || grep -qi "amazon" /sys/devices/virtual/dmi/id/* 2>/dev/null; then
  echo "[enable-https] Ambiente aparenta ser uma instância EC2 (OK)."
else
  echo "[enable-https] AVISO: não foi possível confirmar que é uma EC2. Continuando mesmo assim..."
fi

# 2. Garantir que diretórios de volumes existem no host
sudo mkdir -p /etc/letsencrypt
sudo mkdir -p /var/www/certbot

echo "[enable-https] Rodando Certbot (webroot) para emitir certificado inicial..."
docker run --rm \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -v /var/www/certbot:/var/www/certbot \
  certbot/certbot certonly --webroot \
  -w /var/www/certbot \
  -d "${DOMAIN}" \
  --email "${EMAIL}" \
  --agree-tos \
  --no-eff-email

# 3. Validar existência dos arquivos de certificado
FULLCHAIN="/etc/letsencrypt/live/${DOMAIN}/fullchain.pem"
PRIVKEY="/etc/letsencrypt/live/${DOMAIN}/privkey.pem"

if [[ ! -f "${FULLCHAIN}" || ! -f "${PRIVKEY}" ]]; then
  echo "[enable-https] ERRO: Certificados não encontrados em:"
  echo "  ${FULLCHAIN}"
  echo "  ${PRIVKEY}"
  echo "Verifique a saída do Certbot acima."
  exit 1
fi

echo "[enable-https] Certificados encontrados com sucesso."

# 4. Copiar template HTTPS para default.conf
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NGINX_DIR="${SCRIPT_DIR}/nginx"

if [[ ! -f "${NGINX_DIR}/default-https.conf.tpl" ]]; then
  echo "[enable-https] ERRO: Template ${NGINX_DIR}/default-https.conf.tpl não encontrado."
  exit 1
fi

cp "${NGINX_DIR}/default-https.conf.tpl" "${NGINX_DIR}/default.conf"
echo "[enable-https] Arquivo nginx/default.conf atualizado para versão HTTPS."

# 5. Reiniciar o container nginx-proxy de forma limpa
echo "[enable-https] Reiniciando serviço nginx-proxy via docker compose..."
${COMPOSE_CMD} restart nginx-proxy

echo "[enable-https] HTTPS habilitado com sucesso para ${DOMAIN}."
echo "[enable-https] Opcional: subir o contêiner de renovação automática com:"
echo "  ${COMPOSE_CMD} up -d certbot"

