#!/usr/bin/env bash
set -euo pipefail

BUCKET_NAME="${1:-}"

if [[ -z "${BUCKET_NAME}" ]]; then
  echo "❌ Uso: $0 <bucket-name>"
  exit 1
fi

echo "📦 Iniciando upload dos mocks para o bucket S3 '${BUCKET_NAME}'..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

MOCKS_PT_DIR="${PROJECT_ROOT}/mocks/images/personal-trainers"
MOCKS_ALUNOS_DIR="${PROJECT_ROOT}/mocks/images/alunos"

if ! command -v aws >/dev/null 2>&1; then
  echo "❌ AWS CLI não encontrado. Instale o AWS CLI para realizar o upload dos mocks."
  exit 1
fi

if [[ -d "${MOCKS_PT_DIR}" ]]; then
  echo "⬆️  Enviando mocks de personal trainers..."
  aws s3 sync "${MOCKS_PT_DIR}/" "s3://${BUCKET_NAME}/" --delete
else
  echo "ℹ️  Diretório de mocks de personal trainers não encontrado em '${MOCKS_PT_DIR}', pulando..."
fi

if [[ -d "${MOCKS_ALUNOS_DIR}" ]]; then
  echo "⬆️  Enviando mocks de alunos..."
  aws s3 sync "${MOCKS_ALUNOS_DIR}/" "s3://${BUCKET_NAME}/"
else
  echo "ℹ️  Diretório de mocks de alunos não encontrado em '${MOCKS_ALUNOS_DIR}', pulando..."
fi

echo "✅ Upload dos arquivos mocks para o bucket '${BUCKET_NAME}' concluído."


