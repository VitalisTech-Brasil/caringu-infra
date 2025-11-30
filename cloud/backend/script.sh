#!/bin/bash

# Atualizando os pacotes do sistema:
sudo apt update && sudo apt upgrade -y

# Verificando se o Docker está instalado
if ! [ -x "$(command -v docker)" ]; then
  echo "🐳 Docker não encontrado. Instalando Docker Engine e Compose Plugin..."
  sudo apt install ca-certificates curl gnupg lsb-release -y
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
else
  echo "Docker já instalado. Pulando..."
fi

# Habilitando e iniciando o serviço do Docker:
sudo systemctl enable docker
sudo systemctl start docker

# Verificando se o Docker Compose v2 está disponível
if docker compose version >/dev/null 2>&1; then
  echo "Docker Compose v2 detectado com sucesso!"
else
  echo "Docker Compose v2 não encontrado. Verifique a instalação."
  exit 1
fi

# [+] Criando .env com variáveis de ambiente...
echo "[+] Criando .env com variáveis de ambiente..."
cat <<EOF > .env
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=vitalis
IP_HOST=${MYSQL_PRIVATE_IP}
SPRING_DATASOURCE_URL=jdbc:mysql://${MYSQL_PRIVATE_IP}:3306/vitalis?useSSL=false&serverTimezone=America/Sao_Paulo&allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=UTF-8

SPRING_MAIL_USERNAME=vitalistech06@gmail.com
SPRING_MAIL_PASSWORD=hxky eadu kkng qdui

AWS_S3_BUCKET_NAME=${AWS_S3_BUCKET_NAME:-caringu-imagens}
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN

JWT_SECRET=zXhpc3RlIHVtYSB0ZW9yaWEgcXVlIGRpeiBxdWUsIHNlIHVtIGRpYSBhbGd16W0gZGVzY29icmlyIGV4YXRhbWVudGUgcGFyYSBxdWUgc2VydmUgbyBVbml2ZXJzbyBlIHBvciBxdWUgZWxlIGVzdOEgYXF1aSwgZWxlIGRlc2FwYXJlY2Vy4SBpbnN0YW50YW5lYW1lbnRlIGUgc2Vy4SBzdWJzdGl0de1kbyBwb3IgYWxnbyBhaW5kYSBtYWlzIGVzdHJhbmhvIGUgaW5leHBsaWPhdmVsLiBFeGlzdGUgdW1hIHNlZ3VuZGEgdGVvcmlhIHF1ZSBkaXogcXVlIGlzc28gauEgYWNvbnRlY2V1Li4u
JWT_VALIDITY=10800
GOOGLE_CLIENT_ID=186536025328-cgkr8nqmcbmp7kjkgqm70polq891qipi.apps.googleusercontent.com
GOOGLE_CLIENT_SECRET=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
EOF

# Clonando os repositórios das aplicações Java - Spring, se ainda não existirem
echo "📥 Clonando o repositório da aplicação Java - Spring (Monolito), se ainda não existir..."
if [ ! -d "./caringu-backend" ]; then
  git clone https://github.com/VitalisTech-Brasil/caringu-backend.git
fi

echo "📥 Clonando o repositório da aplicação Java - Spring (Microsserviço), se ainda não existir..."
if [ ! -d "./caringu-notificacao" ]; then
  git clone https://github.com/VitalisTech-Brasil/caringu-notificacao.git
fi

# Aguardando o MySQL ficar disponível
if [ -n "${MYSQL_PRIVATE_IP}" ]; then
  echo "⏳ Aguardando MySQL em ${MYSQL_PRIVATE_IP}:3306..."
  while ! nc -z "${MYSQL_PRIVATE_IP}" 3306; do
    echo "⏳ MySQL ainda não respondeu em ${MYSQL_PRIVATE_IP}:3306, aguardando..."
    sleep 5
  done
  echo "✅ MySQL disponível em ${MYSQL_PRIVATE_IP}:3306!"
fi

# 🔨 Buildando as imagens com Docker Compose
echo "[*] Buildando as imagens com Docker Compose..."
sudo docker compose build

# [*] Subindo os containers com Docker Compose...
echo "[*] Subindo os containers com Docker Compose..."
sudo docker compose up -d

echo "✅ Ambiente de containers de Backend criado com sucesso!"
