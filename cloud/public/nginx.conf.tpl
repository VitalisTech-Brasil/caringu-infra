# Define um "grupo" de servidores backend para o balanceamento de carga
upstream backend_servers {
    # Nginx vai distribuir o tráfego entre estes servidores.
    # Por padrão, usa o método Round Robin (um de cada vez).
    server ${backend_ip}:8080;
}

server {
    listen 80;

    # Bloco para servir o conteúdo do Frontend (React)
    location / {
        # Caminho 'root' para o diretório padrão dentro do container Docker
        root /usr/share/nginx/html;
        index index.html index.htm;
        
        # Diretiva 'try_files', ESSENCIAL para o React Router funcionar
        try_files $uri $uri/ /index.html;
    }

    # Bloco para fazer o Proxy Reverso para a API com Balanceamento de Carga
    location /api/ {
        # Aponta para o grupo 'upstream' que definimos no topo do arquivo
        proxy_pass http://backend_servers/;
        
        # Headers para passar informações corretas para o backend
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}