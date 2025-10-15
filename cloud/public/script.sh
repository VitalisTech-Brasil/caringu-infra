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

# Clonando o repositório da aplicação Python, se ainda não existir
echo "📥 Clonando o repositório da aplicação Python, se ainda não existir..."
if [ ! -d "./caringu-python" ]; then
  git clone https://github.com/VitalisTech-Brasil/caringu-python.git
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