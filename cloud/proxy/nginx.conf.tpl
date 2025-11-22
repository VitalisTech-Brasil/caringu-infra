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

server {
    listen 80;

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


