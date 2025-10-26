#!/bin/bash

# Clonando o repositório da aplicação de infraestrutura, se ainda não existir...
echo "📥 Clonando o repositório da aplicação de infraestrutura, se ainda não existir..."
if [ ! -d "./caringu-infra" ]; then
  git clone https://github.com/VitalisTech-Brasil/caringu-infra.git
fi

# Navegando até o diretório cloud/private
echo "[+] Navegando até o diretório cloud/private..."
cd caringu-infra/cloud/private

# Tornando o script executável
echo "[+] Tornando o script executável..."
chmod +x script.sh

# Executando o script de configuração do ambiente público
echo "[+] Executando o script de configuração do ambiente público..."
bash ./script.sh