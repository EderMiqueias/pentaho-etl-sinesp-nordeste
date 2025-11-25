# Projeto ETL - Pentaho (Kettle)

Este repositório contém um conjunto de **ETLs construídos no Pentaho Data Integration (PDI)** para alimentar um modelo dimensional, utilizando arquivos CSV como fonte de dados.

## 📁 Estrutura do Repositório

etl/
jobs/ → Orquestração principal (.kjb)
transformations/ → Transformações individuais (.ktr)
sql/ → Scripts SQL do modelo dimensional
data/
*.csv → Arquivos de dados utilizados como fonte
docs/
arquivos auxiliares (imagens, diagramas, etc)

---

## 🚀 Objetivo do Projeto

Criar uma pipeline ETL completa que:

- Carrega arquivos CSV brutos
- Trata, limpa e padroniza os dados
- Alimenta tabelas de dimensões e fato
- Gera um modelo dimensional para análises posteriores (OLAP ou BI)

---

## 🔧 Ferramentas Utilizadas

- **Pentaho Data Integration (PDI / Kettle)**
- **PostgreSQL** (modelo dimensional)
- **CSV** como fonte de dados
- **SQL** para criação de tabelas

---

## 📦 Componentes Principais

### **Job Principal**
- `etl/jobs/ETL.kjb`  
  Responsável por coordenar a execução de todas as transformações.

### **Transformações**
- Dimensões:
  - `carga_dim_agente.ktr`
  - `carga_dim_evento.ktr`
  - `carga_dim_local.ktr`
  - `carga_dim_tempo.ktr`
- Fatos:
  - `carga_fato_ocorrencia.ktr`
  - `carga_fato_populacao.ktr`

### **Script de Banco**
- `etl/sql/ddl_dimensional.sql` – Criação das tabelas do modelo dimensional

---

## 📊 Fonte de Dados

Os arquivos CSV estão na pasta `data/` e representam:

- Dados da Polícia / SINESP
- Dados populacionais (IBGE ou outra fonte)
- Bases anuais (2018–2021)

Cada dataset tem explicação adicional em `data/README.md`.

---

## 📖 Como Executar

1. Abra o **Pentaho Spoon**
2. Carregue o job:
- etl/jobs/ETL.kjb
3. Configure:
- Conexão com PostgreSQL
- Caminhos dos CSVs (se estiverem em local diferente)
4. Execute o job.

---

## 📝 Licença

Este projeto está licenciado sob a licença **MIT**.  
Veja o arquivo [`LICENSE`](LICENSE) para mais detalhes.

---

## 👤 Autor

Eder Miqueias  
Projeto acadêmico para fins de estudo e prática de ETL.
