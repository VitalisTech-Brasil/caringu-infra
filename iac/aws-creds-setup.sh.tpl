#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔧 Configurando variáveis de ambiente AWS para execução do Terraform..."

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN

# Também repassa as credenciais para o Terraform via TF_VAR_*
export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY_ID
export TF_VAR_aws_secret_access_key=$AWS_SECRET_ACCESS_KEY
export TF_VAR_aws_session_token=$AWS_SESSION_TOKEN

echo "🔐 Validando credenciais AWS dentro do script auxiliar..."
if ! aws sts get-caller-identity >/dev/null 2>&1; then
  echo "❌ Credenciais AWS inválidas ou expiradas dentro do script auxiliar."
  exit 1
fi

echo "🚀 Iniciando Terraform (init + apply)..."
cd "${SCRIPT_DIR}"

terraform init
terraform apply -auto-approve "$@"

echo "✅ Terraform concluído com sucesso."



