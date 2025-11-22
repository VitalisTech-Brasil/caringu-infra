# 📦 Provisionamento Automatizado da Infraestrutura (Terraform + AWS)

Este guia explica como preparar seu ambiente local para utilizar o **Terraform** e provisionar automaticamente toda a infraestrutura necessária na AWS, incluindo:

* VPC, Subnets, Route Tables, NAT Gateway
* EC2 pública e privada
* Segurança (SGs, ACLs, KeyPair)
* Deploy automático da aplicação (backend + frontend + proxy reverso)
* Configuração automática dentro das EC2s via *user_data*

Nenhum comando precisa ser executado dentro da EC2.
Toda a infraestrutura e toda a aplicação sobem sozinhas.

# 🧰 1. Pré-requisitos no computador local

Antes de rodar o Terraform, você precisa instalar:

## 📌 1.1 Instalar o **Terraform** (versão AMD64)

Baixe a versão mais recente:

🔗 [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

Após instalar, confirme a versão:

```bash
terraform -version
```

Se der erro, adicione o Terraform ao PATH do seu sistema operacional.

### ⚙️ Adicionar o Terraform ao PATH do Windows

1. Pressione **Win + R**
2. Digite:

   ```
   sysdm.cpl
   ```

   e pressione Enter
3. Vá na aba **Avançado**
4. Clique em **Variáveis de Ambiente**
5. Em **Variáveis do sistema**, selecione a variável chamada **Path**
6. Clique em **Editar**
7. Clique em **Novo**
8. Cole o caminho onde está o `terraform.exe`, por exemplo:

   ```
   C:\terraform
   ```
9. Clique em **OK** em todas as janelas para salvar

### ✔️ Para testar:

Abra o **PowerShell** e digite:

```bash
terraform -version
```

Se aparecer a versão, está tudo funcionando.

---

## 📌 1.2 Instalar o **AWS CLI**

Download:

🔗 [https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

Verifique:

```bash
aws --version
```

---

## 📌 1.3 Configurar credenciais da AWS

Você deve criar seu `AWS Access Key` e `AWS Secret Key` no IAM (usuário com permissões: EC2, VPC, IAM, S3 opcional).

Depois configure o CLI:

```bash
aws configure
```

Ele vai pedir:

```
AWS Access Key ID: **********
AWS Secret Access Key: **********
Default region name: us-east-1
Default output format: json
```

# 🚀 2. Como Provisionar a Infraestrutura

Agora com tudo configurado, basta rodar 3 comandos:

## 2.1 Inicializar o Terraform

```bash
terraform init
```

## 2.2 Ver o plano de execução

```bash
terraform plan
```

## 2.3 Criar toda a infraestrutura

```bash
terraform apply
```

Confirme com:

```
yes
```

---

# ⚙️ 3. O que o Terraform faz automaticamente?

Quando você executa `terraform apply`, ele:

### 🌐 **1. Cria toda a rede AWS**

* VPC
* Subnets público/privado
* NAT Gateway
* Internet Gateway
* Route Tables

### 📦 **2. Sobe a EC2 privada e pública**

### 🔐 **3. Gera e aplica security groups**

### 💾 **4. Gera o nginx.conf com o IP privado dinamicamente**

### 📤 **5. Envia esse arquivo via SSH para a EC2 pública**

### 🤖 **6. Executa o user_data nas EC2s**

* Instala pacotes essenciais
* Faz git clone do repositório automaticamente
* Instala Docker e Docker Compose
* Sobe todos os containers (backend, frontend, proxy, banco)
* Configura o Nginx
* Reinicia os serviços
* Sobe a aplicação por completo

📌 **Nada precisa ser feito manualmente dentro das EC2s.**
O ambiente inteiro fica pronto sozinho.

---

# 🟢 4. Após o deploy — acesso e testes

## 4.1 Acessar a aplicação

Basta acessar via navegador o **IP público** da EC2 pública:

```
http://<IP_PUBLICO_DA_EC2_PUBLICA>
```

---

# 🛑 5. Como destruir toda a infraestrutura

Quando quiser remover tudo da AWS:

```bash
terraform destroy
```

Confirme com:

```
yes
```

Isso irá **apagar todas as EC2s, rede, NAT, SGs e tudo que foi criado.**

---

# 🐋 6. Gerenciamento manual dos containers (opcional)

Se você quiser acessar a EC2 e mexer manualmente:

### Acesse via SSH:

```bash
ssh -i caringu.pem ubuntu@<ip-publico>
```

### Ver todos os containers:

```bash
sudo docker ps -a
```

### Parar containers:

```bash
sudo docker compose down
```

### Parar containers e destruir volumes:

```bash
sudo docker compose down -v
```

### Subir novamente:

```bash
sudo docker compose up -d
```

### Acessar MySQL:

```bash
sudo docker exec -it <nome_do_container_mysql> bash
mysql -u root -p
```
### Acessar os logs do cloud-init:

```bash
cat /var/log/cloud-init-output.log
```

---

# 🎯 7. Conclusão

Agora toda a infraestrutura e a aplicação da Caringu estão completamente automatizadas.

Com **um único comando**:

```bash
terraform apply
```

Você obtém:

* Rede
* Segurança
* EC2s
* Deploy completo da aplicação
* Nginx configurado dinamicamente
* Containers rodando
* Ambiente pronto