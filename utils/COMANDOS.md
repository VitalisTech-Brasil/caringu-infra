# 📜 Comandos Úteis - Infraestrutura

Este documento é uma coletânea de comandos que podem ajudar no dia a dia do desenvolvimento e manutenção da infraestrutura.

---

## 🛠️ Gerenciamento do Docker

### Verificar o uso de espaço do Docker
```bash
docker system df
```

### Limpar imagens, containers, networks e **volumes** não utilizados
```bash
docker system prune -a --volumes
```
> ⚠️ **Atenção:** Esse comando remove tudo que não está em uso, inclusive **volumes** (dados podem ser perdidos).

### Remover apenas imagens "dangling" (sem tag)
```bash
docker image prune
```

### Remover imagens específicas
```bash
docker rmi <ID_DA_IMAGEM>
```

### Remover volumes não utilizados
```bash
docker volume prune
```

---

## 📦 Subir e Derrubar a Infraestrutura

### Subir containers com build forçado
```bash
docker-compose up -d --build
```

### Derrubar containers e remover volumes
```bash
docker-compose down -v
```

### Derrubar containers e limpar geral (imagens, volumes e orphans)
```bash
docker-compose down --rmi all --volumes --remove-orphans
```

---

## 🐳 Gerenciamento de Containers Individuais

### Listar todos containers (ativos e inativos)
```bash
docker ps -a
```

### Parar um container
```bash
docker stop <nome_ou_id_do_container>
```

### Remover um container parado
```bash
docker rm <nome_ou_id_do_container>
```

---

## 🚸‍♂️ Resolvendo Problemas Comuns

### 1. Porta já em uso (ex: 3306 para MySQL)
```bash
# Descobrir o processo
sudo lsof -i :3306

# Matar o processo
sudo kill -9 <PID>
```

### 2. Erro de build no docker-compose
```bash
# Derruba tudo e sobe novamente com build
docker-compose down --volumes

docker-compose up -d --build
```

### 3. Atualizar imagens do docker-compose
```bash
docker-compose pull
docker-compose up -d
```

---

## 🧹 Dicas Extras

- Rodar o `docker system prune -a --volumes` de vez em quando evita o Docker encher o disco.
- Sempre verifique se o `docker-compose.yml` está atualizado com as versões corretas.
- Se mudar algo crítico (portas, mounts), derrube e suba tudo de novo com `down -v && up -d --build`.

---

## Export

- export AWS_ACCESS_KEY_ID=aws_key_id_value
- export AWS_SECRET_ACCESS_KEY=aws_secret_key_value
- export AWS_SESSION_TOKEN=aws_session_token_value

# Depois:

- echo $AWS_ACCESS_KEY_ID
- echo $AWS_SECRET_ACCESS_KEY
- echo $AWS_SESSION_TOKEN