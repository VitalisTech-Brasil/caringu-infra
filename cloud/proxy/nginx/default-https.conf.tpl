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

# Bloco HTTP apenas para redirecionar para HTTPS
server {
    listen 80;
    server_name caringu.hopto.org;

    # ACME challenge - continua disponível também em produção para renovação
    location ^~ /.well-known/acme-challenge/ {
        alias /var/www/certbot/.well-known/acme-challenge/;
        try_files $uri =404;
    }

    location / {
        return 301 https://$host$request_uri;
    }
}

# Bloco principal HTTPS
server {
    listen 443 ssl http2;
    server_name caringu.hopto.org;

    # Caminhos fixos dos certificados (sem sufixos -0001)
    ssl_certificate /etc/letsencrypt/live/caringu.hopto.org/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/caringu.hopto.org/privkey.pem;

    # Parâmetros de segurança opcionais (podem ser habilitados depois)
    # include /etc/letsencrypt/options-ssl-nginx.conf;
    # ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

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


