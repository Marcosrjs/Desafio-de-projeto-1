# Desafio-de-projeto-1
# Projeto E-commerce – Banco de Dados (MySQL)

## 📌 Descrição
Este projeto implementa a modelagem lógica de um banco de dados para um **cenário de e-commerce**, aplicando refinamentos do modelo conceitual e criando o esquema em **MySQL**.  
O objetivo é replicar a modelagem EER com chaves primárias, estrangeiras e constraints, além de realizar consultas SQL que exploram diferentes cláusulas.

## 🛠️ Estrutura do Modelo
- **Party (PF/PJ exclusivo):** entidade central que representa uma conta única, podendo ser Pessoa Física (CPF) ou Pessoa Jurídica (CNPJ).
- **Papéis:**  
  - `Customer` – clientes que realizam pedidos  
  - `Seller` – vendedores que ofertam produtos  
  - `Supplier` – fornecedores que abastecem o estoque  
- **Produtos e Estoque:** controle de produtos, quantidades e estoque de segurança.  
- **Pedidos e Itens:** pedidos vinculados a clientes e vendedores, com itens detalhados.  
- **Pagamentos:** múltiplas formas de pagamento por cliente (cartão, pix, boleto).  
- **Entrega:** cada pedido possui status e código de rastreio.  

## 🔧 Refinamentos aplicados
- Exclusividade PF/PJ (não pode ter CPF e CNPJ ao mesmo tempo).  
- Clientes podem cadastrar **mais de uma forma de pagamento**.  
- Entregas possuem **status e código de rastreio**.  
- Relacionamento fornecedor–produto para mapear custo e estoque.  

## 📂 Estrutura dos arquivos
- `scripts/01_ddl.sql` → Criação das tabelas (DDL)  
- `scripts/02_dml_seed.sql` → Inserção de dados de teste (DML)  
- `scripts/03_queries.sql` → Consultas SQL do desafio  

## ▶️ Como executar no MySQL Workbench
1. Abra o **MySQL Workbench** e conecte-se ao seu servidor MySQL.  
2. Crie um novo **SQL Editor**.  
3. Execute `01_ddl.sql` para criar o esquema.  
4. Rode `02_dml_seed.sql` para inserir dados de exemplo.  
5. Teste as consultas em `03_queries.sql`.  

## 📊 Consultas implementadas
As queries exploram:
- **SELECT simples**  
- **Filtros com WHERE**  
- **Atributos derivados (expressões)**  
- **Ordenações com ORDER BY**  
- **Agrupamentos e HAVING**  
- **Junções entre tabelas (JOIN)**  

### Exemplos de perguntas respondidas:
- Quantos pedidos foram feitos por cada cliente?  
- Algum vendedor também é fornecedor?  
- Relação de produtos, fornecedores e estoques.  
- Relação de nomes dos fornecedores e nomes dos produtos.  
- Pedidos com status de entrega e código de rastreio.  
- Produtos abaixo do estoque de segurança.  
- Receita calculada vs armazenada por pedido.  

## 🚀 Objetivo
Este projeto faz parte de um desafio dos projetos lógicos de banco de dados com:  
- Modelagem lógica e refinamentos  
- Criação de esquema SQL com constraints  
- Persistência de dados  
- Consultas complexas em MySQL  

---
