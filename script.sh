#!/bin/bash

# Atualizando os pacotes do sistema:
sudo apt update && sudo apt upgrade -y

# Instalando o Docker (caso não tenha sido instalado ainda):
sudo apt install git docker.io -y

# Instalando o Docker Compose (caso não tenha sido instalado ainda):
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Habilitando e iniciando o serviço do Docker:
sudo systemctl enable docker
sudo systemctl start docker

# [+] Criando .env com variáveis de ambiente...
echo "[+] Criando .env com variáveis de ambiente..."
cat <<EOF > .env
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=vitalis
EOF

# [*] Subindo os containers com Docker Compose...
echo "[*] Subindo os containers com Docker Compose..."
sudo docker-compose up -d