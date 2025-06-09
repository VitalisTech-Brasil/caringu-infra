#!/bin/bash

# Atualizando os pacotes do sistema:
sudo apt update && sudo apt upgrade -y

# Verificando se o Docker está instalado
if ! [ -x "$(command -v docker)" ]; then
  echo "Docker não encontrado. Instalando Docker..."
  sudo apt install docker.io -y
else
  echo "Docker já instalado. Pulando..."
fi

# Verificando se o Docker Compose está instalado
if ! [ -x "$(command -v docker-compose)" ]; then
  echo "Docker Compose não encontrado. Instalando Docker Compose..."
  sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
else
  echo "Docker Compose já instalado. Pulando..."
fi

# Habilitando e iniciando o serviço do Docker:
sudo systemctl enable docker
sudo systemctl start docker

# Solicitando as variáveis ao usuário
read -p "Digite a CONNECTION_STRING: " CONNECTION_STRING
echo
read -p "Digite o CONTAINER_NAME: " CONTAINER_NAME

if [ -z "$CONNECTION_STRING" ]; then
  echo "❌ CONNECTION_STRING não pode estar vazia!"
  exit 1
fi

if [ -z "$CONTAINER_NAME" ]; then
  echo "❌ CONTAINER_NAME não pode estar vazia!"
  exit 1
fi

# [+] Criando .env com variáveis de ambiente...
echo "[+] Criando .env com variáveis de ambiente..."
cat <<EOF > .env
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=vitalis

SPRING_MAIL_USERNAME=vitalistech06@gmail.com
SPRING_MAIL_PASSWORD=hxky eadu kkng qdui

JWT_SECRET=zXhpc3RlIHVtYSB0ZW9yaWEgcXVlIGRpeiBxdWUsIHNlIHVtIGRpYSBhbGd16W0gZGVzY29icmlyIGV4YXRhbWVudGUgcGFyYSBxdWUgc2VydmUgbyBVbml2ZXJzbyBlIHBvciBxdWUgZWxlIGVzdOEgYXF1aSwgZWxlIGRlc2FwYXJlY2Vy4SBpbnN0YW50YW5lYW1lbnRlIGUgc2Vy4SBzdWJzdGl0de1kbyBwb3IgYWxnbyBhaW5kYSBtYWlzIGVzdHJhbmhvIGUgaW5leHBsaWPhdmVsLiBFeGlzdGUgdW1hIHNlZ3VuZGEgdGVvcmlhIHF1ZSBkaXogcXVlIGlzc28gauEgYWNvbnRlY2V1Li4u
JWT_VALIDITY=10800
CONNECTION_STRING=$CONNECTION_STRING
CONTAINER_NAME=$CONTAINER_NAME
CLIENTE_ID=186536025328-cgkr8nqmcbmp7kjkgqm70polq891qipi.apps.googleusercontent.com
CLIENTE_SECRET=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
EOF

# Clonando o repositório da aplicação Python, se ainda não existir
echo "📥 Clonando o repositório da aplicação Python, se ainda não existir..."
if [ ! -d "./caringu-python" ]; then
  git clone https://github.com/VitalisTech-Brasil/caringu-python.git
fi

# Clonando o repositório da aplicação Java - Spring, se ainda não existir
echo "📥 Clonando o repositório da aplicação Java - Spring, se ainda não existir..."
if [ ! -d "./caringu-backend" ]; then
  git clone https://github.com/VitalisTech-Brasil/caringu-backend.git
fi

# Clonando o repositório da aplicação Front-end, se ainda não existir
echo "📥 Clonando o repositório da aplicação Front-end, se ainda não existir..."
if [ ! -d "./caringu-frontend" ]; then
  git clone https://github.com/VitalisTech-Brasil/caringu-frontend.git
fi

# 🔨 Buildando as imagens com Docker Compose
echo "[*] Buildando as imagens com Docker Compose..."
sudo docker compose build

# [*] Subindo os containers com Docker Compose...
echo "[*] Subindo os containers com Docker Compose..."
sudo docker compose up -d

echo "✅ Ambiente de containers criado com sucesso!"