#!/bin/bash
set -e

# =========================
# CONFIGURAÇÕES DO DOMÍNIO
# =========================
DOMAIN="caringu.ddns.net"
EMAIL="vitalistech06@gmail.com"

echo "🔧 [1/15] Atualizando pacotes do sistema e instalando OpenSSL..."
sudo apt update && sudo apt install openssl -y


echo "🛑 [2/15] Parando containers existentes (docker compose down)..."
sudo docker compose down


echo "📜 [3/15] Gerando certificado SELF-SIGNED temporário (1 dia)..."
sudo docker compose run --rm --entrypoint sh certbot -c "
mkdir -p /etc/letsencrypt/live/$DOMAIN &&
openssl req -x509 -nodes -newkey rsa:2048 -days 1 \
  -keyout /etc/letsencrypt/live/$DOMAIN/privkey.pem \
  -out /etc/letsencrypt/live/$DOMAIN/fullchain.pem \
  -subj '/CN=$DOMAIN'
"


echo "📦 [4/15] Verificando containers após certificado temporário..."
sudo docker ps -a


echo "🧹 [5/15] Limpando certificados antigos ($DOMAIN)..."
sudo rm -rf /etc/letsencrypt/live/$DOMAIN
sudo rm -rf /etc/letsencrypt/archive/$DOMAIN
sudo rm -rf /etc/letsencrypt/renewal/$DOMAIN.conf


echo "🔐 [6/15] Solicitando certificado REAL do Let's Encrypt..."
sudo docker run --rm \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -v /var/www/certbot:/var/www/certbot \
  certbot/certbot certonly \
    --webroot \
    --webroot-path /var/www/certbot \
    -d $DOMAIN \
    --email $EMAIL \
    --agree-tos \
    --no-eff-email


echo "📁 [7/15] Listando conteúdo atualizado do /etc/letsencrypt..."
sudo ls -l /etc/letsencrypt/


echo "🐳 [8/15] Subindo containers novamente (docker compose up -d)..."
sudo docker compose up -d


echo "🔍 [9/15] Conferindo containers ativos..."
sudo docker ps -a


echo "📝 [10/15] Conferindo arquivos dentro do container NGINX..."
echo "(É esperado ver: options-ssl-nginx.conf, ssl-dhparams.pem, live/, archive/)"
sudo docker exec -it caringu-proxy ls -l /etc/letsencrypt


echo "🧪 [11/15] Validando sintaxe do NGINX dentro do container..."
sudo docker exec -it caringu-proxy nginx -t
# Resultado esperado:
# nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
# nginx: configuration file /etc/nginx/nginx.conf test is successful


echo "📂 [12/15] Garantindo que pastas necessárias existem localmente..."
sudo mkdir -p /etc/letsencrypt
sudo mkdir -p /var/www/certbot


echo "⬇️ [13/15] Baixando ssl-dhparams.pem para o sistema..."
sudo wget -q https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem \
  -O /etc/letsencrypt/ssl-dhparams.pem


echo "⬇️ [14/15] Baixando options-ssl-nginx.conf..."
sudo wget -q https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf \
  -O /etc/letsencrypt/options-ssl-nginx.conf


echo "⚙️ [15/15] Gerando dhparam (2048 bits)..."
sudo openssl dhparam -out /etc/letsencrypt/ssl-dhparams.pem 2048


echo ""
echo "📌 Agora você deve descomentar no arquivo: ./nginx/default.conf"
echo "    include /etc/letsencrypt/options-ssl-nginx.conf;"
echo "    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;"
echo ""
echo "Depois execute:"
echo "    sudo docker compose exec caringu-proxy nginx -s reload"
echo ""
echo "✅ HTTPS configurado com sucesso!"
