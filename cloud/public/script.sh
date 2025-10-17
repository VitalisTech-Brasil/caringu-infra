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

# 🔨 Buildando as imagens com Docker Compose v2
echo "[*] Buildando as imagens com Docker Compose..."
sudo docker compose build

# [*] Subindo os containers com Docker Compose...
echo "[*] Subindo os containers com Docker Compose..."
sudo docker compose up -d

echo "✅ Ambiente de containers criado com sucesso!"