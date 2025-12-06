#!/usr/bin/env bash
set -euo pipefail

# Gera nginx/default.conf a partir do template HTTP,
# substituindo variáveis de ambiente (${frontend_1_ip}, etc) se existirem.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="${SCRIPT_DIR%/scripts}"
NGINX_DIR="${ROOT_DIR}/nginx"

# Usar o template ORIGINAL que você já tinha criado: nginx.conf.tpl
TEMPLATE_HTTP="${ROOT_DIR}/nginx.conf.tpl"
OUTPUT_CONF="${NGINX_DIR}/default.conf"

echo "[generate-nginx-conf] Diretório raiz: ${ROOT_DIR}"

if [[ ! -f "${TEMPLATE_HTTP}" ]]; then
  echo "[generate-nginx-conf] ERRO: Template ${TEMPLATE_HTTP} não encontrado."
  exit 1
fi

if command -v envsubst >/dev/null 2>&1; then
  echo "[generate-nginx-conf] Gerando default.conf com envsubst (variáveis de ambiente serão aplicadas)..."
  envsubst < "${TEMPLATE_HTTP}" > "${OUTPUT_CONF}"
else
  echo "[generate-nginx-conf] AVISO: envsubst não encontrado. Copiando template bruto para default.conf."
  cp "${TEMPLATE_HTTP}" "${OUTPUT_CONF}"
fi

echo "[generate-nginx-conf] nginx/default.conf gerado com sucesso."


