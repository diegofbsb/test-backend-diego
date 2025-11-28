# 🚀 Backend - Java 21 / Spring Boot 3.3.4
### Desenvolvido por **Diego Fernando dos Santos**

---

<div align="center">

### 🏗️ API de Alta Performance • Docker • Load Balancer • Gatling

![Java](https://img.shields.io/badge/Java-21-ED8B00?logo=java&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.3+-6DB33F?logo=springboot&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-4169E1?logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker&logoColor=white)
![Load Balancer](https://img.shields.io/badge/HAProxy-Round--Robin-5A5A5A?logo=haproxy&logoColor=white)
![Swagger](https://img.shields.io/badge/Swagger-API%20Docs-85EA2D?logo=swagger&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

</div>

---

# 📚 Sumário
- [Visão Geral](#visão-geral)
- [Arquitetura](#arquitetura)
- [Tecnologias](#tecnologias)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Swagger](#swagger)
- [Rodando com Docker](#rodando-com-docker)
- [Configurações](#configurações)
- [Testes de Performance](#testes-de-performance)
- [Autor](#autor)

---

# 📖 Visão Geral

Este projeto implementa a API exigida na **Rinha de Backend**, utilizando um ambiente de alta concorrência com:

- 2 instâncias da API Java
- Load Balancer (HAProxy)
- Banco PostgreSQL
- Perfil produtivo otimizado
- Testes de carga com Gatling

Tudo conteinerizado via Docker Compose.

# 📌 Repositório Público (obrigatório)

👉 **Código-fonte completo:**  
https://github.com/diegofbsb/test-backend.git

https://github.com/diegofbsb/test-gatling.git

---

# 🐋 Imagem Docker da API 

> Substitua abaixo pela sua imagem quando fizer o push no Docker Hub:

👉 **Imagem Docker:**  
https://hub.docker.com/r/diegofbsb/diego-backend
---

# 🏗️ Arquitetura

                 [ HAProxy 9999 ]
                        |
          ┌─────────────┴─────────────┐
          |                           |
     [ API 01 - Spring ]       [ API 02 - Spring ]
          └─────────────┬─────────────┘
                        |
                  [ PostgreSQL ]
---

# 🧰 Tecnologias

- **Java 21**
- **Spring Boot 3.3+**
- **JPA / Hibernate**
- **PostgreSQL 16**
- **Docker & Docker Compose**
- **HAProxy**
- **MapStruct**
- **Lombok**
- **H2 para testes**
- **Swagger / OpenAPI**
- **Gatling para testes de carga**

---
### Estrutura de Diretórios
```
backend/
├── 📁 src/
│   ├── 📁 main/
│   │   ├── 📁 java/
│   │   │   └── 📁 com/test/backend/
│   │   │       ├── 📁 conf/            # Configurações gerais
│   │   │       ├── 📁 controller/      # Controladores REST
│   │   │       ├── 📁 dto/             # Data Transfer Objects
│   │   │       ├── 📁 entity/          # Entidades JPA
│   │   │       ├── 📁 exception/       # Exceções customizadas
│   │   │       ├── 📁 mapper/          # Conversores/Mapeadores
│   │   │       ├── 📁 repository/      # Repositórios JPA
│   │   │       ├── 📁 request/         # Objetos de requisição
│   │   │       ├── 📁 response/        # Objetos de resposta
│   │   │       ├── 📁 service/         # Regras de negócio
│   │   │       ├── 📁 util/            # Utilitários gerais
│   │   │       │     └── 📄 Util.java
│   │   │       └── 📄 BackendApplication.java  # Classe principal Spring Boot
│   │   │
│   │   └── 📁 resources/               # Arquivos de configuração e templates
│   │       ├── 📁 static/              # Arquivos estáticos
│   │       ├── 📁 templates/           # Templates (Thymeleaf, etc.)
│   │       ├── 📄 application.properties        # Config local (H2)
│   │       └── 📄 application-prod.properties   # Config produção (PostgreSQL)
│   │
│   └── 📁 test/                        # Testes automatizados
│
├── 📁 target/                           # Artefatos gerados (build)
│
├── 📄 docker-compose.yml                # Orquestração Docker
├── 📄 Dockerfile                        # Build da imagem
├── 📄 haproxy.cfg                       # Configuração HAProxy
├── 📄 nginx.conf                        # Configuração do Nginx
├── 📄 pom.xml                           # Dependências Maven
├── 📄 README.md                         # Documentação geral
├── 📄 .gitignore
├── 📄 .gitattributes
├── 📄 backend.iml
├── 📄 mvnw
└── 📄 mvnw.cmd
```

# 📘 Swagger

A documentação da API está disponível em:

Swagger 👉 **http://localhost:8080/swagger-ui.html**

HAProxy 👉 **http://localhost:9999/swagger-ui/index.html** (via Load Balancer)


---

🧪 Exemplos de Requisições
---
🟢 Registrar Nova Transação
---
```
curl --location 'http://localhost:9999/clientes/1/transacoes' \
--header 'accept: */*' \
--header 'Content-Type: application/json' \
--data '{
"valor": 100000,
"tipo": "c",
"descricao": "string"
}'
```
🔵 Consultar Extrato
---
```
curl --location 'http://localhost:9999/clientes/2/extrato' \
--header 'accept: */*' \
--data ''
```
---
# 🐳 Rodando com Docker

### **1️⃣ Build e subir serviços**

```bash
docker-compose up --build

Serviços que sobem:
Serviço	Porta
HAProxy (load balancer)	9999
PostgreSQL	5432
API 01	Interna 8080
API 02	Interna 8080

A API deve ser acessada via:

👉 http://localhost:9999
```
⚙️ Configurações
```
O projeto possui dois profiles:
application.properties
→ utilizado localmente
application-prod.properties
→ utilizado dentro dos containers
```

📈 Testes de Performance (Gatling)
```
Clone o repositório do teste de carga:
git clone https://github.com/diegofbsb/test-gatling.git
Execute o teste apontando para o load balancer:
mvn gatling:test -DBASE_URL=http://localhost:9999
```

👤 Autor

Diego Fernando dos Santos
Desenvolvedor Java / Spring / Microsserviços