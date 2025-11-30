#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AWS_CREDS_TEMPLATE="${SCRIPT_DIR}/iac/aws-creds-setup.sh.tpl"
AWS_CREDS_SCRIPT="${SCRIPT_DIR}/iac/aws-creds-setup.sh"

echo "🚀 Iniciando fluxo de infraestrutura com validação de credenciais AWS..."

# Função para verificar se um comando existe
require_cmd() {
  local cmd="$1"
  if ! command -v "${cmd}" >/dev/null 2>&1; then
    echo "❌ Dependência obrigatória não encontrada: '${cmd}'."
    echo "   Instale e tente novamente."
    exit 1
  fi
}

# Garantir dependências mínimas
require_cmd "aws"
require_cmd "terraform"
require_cmd "envsubst"

# Função para carregar credenciais AWS do arquivo ~/.aws/credentials (perfil [default])
load_aws_creds_from_file() {
  local creds_file="${HOME}/.aws/credentials"

  # Se o arquivo não existir, sai da função 
  if [[ ! -f "${creds_file}" ]]; then
    return 0
  fi

  echo ""
  echo "🔍 Tentando carregar credenciais AWS do arquivo '${creds_file}' (perfil [default])..."

  local in_default_section=0
  while IFS= read -r line || [[ -n "${line}" ]]; do
    # Remove espaços nas extremidades
    line="${line#"${line%%[![:space:]]*}"}"
    line="${line%"${line##*[![:space:]]}"}"

    # Ignora linhas vazias ou comentários
    if [[ -z "${line}" ]] || [[ "${line}" == \#* ]]; then
      continue
    fi

    # Detecta início de seção
    if [[ "${line}" =~ ^\[(.*)\]$ ]]; then
      local section="${BASH_REMATCH[1]}"
      if [[ "${section}" == "default" ]]; then
        in_default_section=1
      else
        # Saímos da seção [default] se já estávamos nela
        if [[ ${in_default_section} -eq 1 ]]; then
          break
        fi
        in_default_section=0
      fi
      continue
    fi

    # Se estamos na seção [default], ler chaves
    if [[ ${in_default_section} -eq 1 ]]; then
      if [[ "${line}" =~ ^aws_access_key_id[[:space:]]*=[[:space:]]*(.*)$ ]]; then
        export AWS_ACCESS_KEY_ID="${BASH_REMATCH[1]}"
      elif [[ "${line}" =~ ^aws_secret_access_key[[:space:]]*=[[:space:]]*(.*)$ ]]; then
        export AWS_SECRET_ACCESS_KEY="${BASH_REMATCH[1]}"
      elif [[ "${line}" =~ ^aws_session_token[[:space:]]*=[[:space:]]*(.*)$ ]]; then
        export AWS_SESSION_TOKEN="${BASH_REMATCH[1]}"
      fi
    fi
  done < "${creds_file}"
}

validate_aws_credentials() {
  echo "🔐 Validando credenciais AWS com 'aws sts get-caller-identity'..."
  if aws sts get-caller-identity >/dev/null 2>&1; then
    echo "✅ Credenciais AWS válidas."
    return 0
  else
    echo "⚠️  Falha ao validar credenciais AWS."
    echo ""
    return 1
  fi
}

prompt_for_aws_credentials() {
  echo "📝 Informe suas credenciais AWS (elas NÃO serão salvas em arquivo)."
  read -r -p "AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
  read -r -s -p "AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
  echo ""
  read -r -p "AWS_SESSION_TOKEN: " AWS_SESSION_TOKEN

  export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
}

# 1) Tenta carregar do arquivo ~/.aws/credentials (perfil [default]), se variáveis ainda não estiverem setadas
if [[ -z "${AWS_ACCESS_KEY_ID:-}" || -z "${AWS_SECRET_ACCESS_KEY:-}" ]]; then
  load_aws_creds_from_file
fi

# 2) Valida as credenciais atuais (se existirem)
if [[ -n "${AWS_ACCESS_KEY_ID:-}" && -n "${AWS_SECRET_ACCESS_KEY:-}" ]]; then
  if ! validate_aws_credentials; then
    echo "🔁 Tentando novamente solicitando credenciais manualmente..."
    prompt_for_aws_credentials
    if ! validate_aws_credentials; then
      echo ""
      echo "❌ Não foi possível validar as credenciais AWS fornecidas."
      echo "   Verifique se os dados estão corretos e tente novamente."
      exit 1
    fi
  fi
else
  echo "⚠️  Nenhuma credencial AWS encontrada em variáveis de ambiente ou em '~/.aws/credentials'."
  prompt_for_aws_credentials
  if ! validate_aws_credentials; then
    echo "❌ Não foi possível validar as credenciais AWS fornecidas."
    echo "   Verifique se os dados estão corretos e tente novamente."
    exit 1
  fi
fi

echo "✅ Fluxo de credenciais AWS pronto. Gerando script auxiliar via template na pasta 'iac'..."

if [[ ! -f "${AWS_CREDS_TEMPLATE}" ]]; then
  echo "❌ Template '${AWS_CREDS_TEMPLATE}' não encontrado."
  echo "   Certifique-se de que o arquivo existe dentro da pasta 'iac'."
  exit 1
fi

# 3) Gera script final a partir do template, injetando as credenciais
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:-}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:-}"
AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN:-}"

export AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN

envsubst '$AWS_ACCESS_KEY_ID$AWS_SECRET_ACCESS_KEY$AWS_SESSION_TOKEN' < "${AWS_CREDS_TEMPLATE}" > "${AWS_CREDS_SCRIPT}"
chmod +x "${AWS_CREDS_SCRIPT}"

echo "▶️  Executando Terraform via script gerado..."

cd "${SCRIPT_DIR}"
bash "${AWS_CREDS_SCRIPT}" "$@"

echo "🏁 Execução finalizada."


