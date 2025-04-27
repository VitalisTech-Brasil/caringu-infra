#!/bin/bash

# Este script foi criado para reiniciar a infraestrutura do zero.
# Ele derruba todos os containers Docker, remove todas as imagens, 
# limpa o repositório atual e clona novamente a versão mais recente 
# do repositório de infraestrutura, garantindo que tudo seja configurado 
# e iniciado do início, sem resquícios de containers ou imagens antigos.

echo "🔴 Derrubando containers..."
sudo docker compose down -v

echo "🗑️ Removendo todas as imagens..."
sudo docker rmi $(sudo docker images -q)

echo "🧹 Limpando repositório antigo..."
rm -rf caringu-infra

echo "📥 Clonando repositório novamente..."
git clone https://github.com/VitalisTech-Brasil/caringu-infra.git

cd caringu-infra

echo "🔓 Dando permissão de execução pro setup..."
chmod +x script.sh

echo "🚀 Rodando setup.sh..."
bash script.sh

echo "✅ Tudo feito! 🍀"