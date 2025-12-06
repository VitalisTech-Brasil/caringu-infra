# Bloco 1: Definição dos upstreams para os servidores de frontend, backend e Python
upstream frontend_servers {
    server ${frontend_1_ip}:80;
    server ${frontend_2_ip}:80;
}

upstream backend_servers {
    server ${backend_1_ip}:8080;
    server ${backend_2_ip}:8080;
}

upstream python_servers {
    server ${frontend_1_ip}:8000;
    server ${frontend_2_ip}:8000;
}

# Bloco 2: Redireciona todas as solicitações HTTP para HTTPS
server {
    listen 80;
    server_name caringu.hopto.org;

    # Rota para a validação do Let's Encrypt (ACME Challenge)
    # O Nginx servirá os arquivos a partir deste diretório
    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    # Redirecionamento permanente para a versão HTTPS
    location / {
        return 301 https://$host$request_uri;
    }
}

# Bloco 3: Configuração principal do servidor HTTPS
server {
    listen 443 ssl http2; # Adicionado http2 para melhor performance
    server_name caringu.hopto.org;

    # Caminhos apontando para os certificados autoassinados criados na EC2
    # ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
    # ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

    # Caminhos apontando para os certificados DO LET'S ENCRYPT
    # Estes arquivos serão criados localmente para o nginx rodar
    # ssl_certificate /etc/letsencrypt/live/caringu.hopto.org/fullchain.pem;
    # ssl_certificate_key /etc/letsencrypt/live/caringu.hopto.org/privkey.pem;

    # Caminhos apontando para os certificados DO LET'S ENCRYPT
    # Estes arquivos serão criados pelo Certbot
    ssl_certificate /etc/letsencrypt/live/caringu.hopto.org/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/caringu.hopto.org/privkey.pem;

    # Caminhos apontando para os certificados DO LET'S ENCRYPT
    # Estes arquivos serão criados pelo Certbot
    # DESCOMENTAR ISSO DEPOIS QUE GERAR O CERTIFICADO NOVAMENTE
    # ssl_certificate /etc/letsencrypt/live/caringu.hopto.org-0001/fullchain.pem;
    # ssl_certificate_key /etc/letsencrypt/live/caringu.hopto.org-0001/privkey.pem;

    # Parâmetros de segurança SSL - descomentar só quando nginx rodar e gerar o certificado
    # include /etc/letsencrypt/options-ssl-nginx.conf;
    # ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    # NOVOS certificados assinados pela sua CA
    # ssl_certificate /etc/ssl/certs/caringu.com.crt;
    # ssl_certificate_key /etc/ssl/private/caringu.com.key;

    # Frontend React (SPA)
    location / {
        proxy_pass http://frontend_servers;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # Backend Java (/api)
    location /api/ {
        proxy_pass http://backend_servers/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # FastAPI (/python)
    location /python/ {
        proxy_pass http://python_servers/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}


