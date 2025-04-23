# 📃 Instruções para Configuração do projeto na nuvem da Azure

## 🐋 Passos para rodar os containers Docker dentro da VM

1. 🔐 **Acesse a VM:**
   - Use o comando SSH para acessar sua VM:
     ```bash
     ssh -i <chavepem>.pem <usuario_azure>@<ip>
     ```

2. 📥 **Clone o repositório Infra:**
   - Dentro da VM, clone o repositório onde está toda a configuração de infraestrutura:

     ```bash
     git clone https://github.com/VitalisTech-Brasil/caringu-infra.git
     ```

3. 📂 **Acesse o diretório do repositório:**
   - Navegue até o diretório do repositório:
     ```bash
     cd caringu-infra
     ```

4. 🔧 **Permissões para o script `script.sh`:**
   - Dê permissão de execução para o script `script.sh`:
     ```bash
     chmod +x script.sh
     ```

5. ▶️ **Rodar o script `script.sh`:**
   - Execute o script `script.sh` para realizar as configurações e rodar a aplicação:
     ```bash
     bash script.sh
     ```

6. ✅ **Pronto! A aplicação estará rodando.**
   - Após a execução do script, o Docker estará configurado, os containers de MySQL, Python, Node.js e Java estarão sendo orquestrados pelo Docker Compose na VM.

---

## 🛑 Como parar os containers?

Para parar os containers rodando no Docker Compose, basta usar o seguinte comando:

```bash
sudo docker compose down
```

Se quiser iniciar novamente, basta usar o seguinte comando:

```bash
sudo docker compose up -d
```

---

## 🐬 Como acessar o container do MySQL?

📦 Acesse o Shell do Container:

```bash
sudo docker exec -it <nome_do_container> bash
```
🧑‍💻 Conecte-se ao MySQL Dentro do Container:
```bash
mysql -u root -h localhost -p vitalis
```

>🔑 Quando solicitado, digite a senha definida na variável `MYSQL_ROOT_PASSWORD`
---

