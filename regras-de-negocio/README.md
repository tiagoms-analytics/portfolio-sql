# 🛍️ Regras de Negócio e Análise SQL - E-commerce

Este diretório contém uma série de exercícios focados na aplicação de **Regras de Negócio** e na extração de indicadores gerenciais (KPIs) usando SQL.

O objetivo é transformar dados brutos de E-commerce (contidos na pasta `base_tabelas/`) em informações acionáveis para a tomada de decisão.

---

## 📚 Temas e Habilidades Abordadas

* SQL: Linguagem de Manipulação de Dados (DML)
* SQL: Linguagem de Consulta de Dados (SELECT)
* SQL: Filtros e Condicionais (WHERE, HAVING, CASE)
* SQL: Agregações (SUM, AVG, COUNT, GROUP BY)
* Consultas SQL em múltiplas tabelas (JOINs)

---

## 💾 Fonte de Dados

Os scripts aqui presentes utilizam o modelo de dados de E-commerce (clientes, produtos, vendas, itens\_venda) contido na pasta **`../base_tabelas/`** (no nível superior do repositório).

---

## 📁 Guia de Navegação / Estrutura do Repositório

Para facilitar a exploração e auditoria do projeto, a estrutura de pastas foi organizada da seguinte forma:

| Pasta/Arquivo | Propósito e Habilidades Demonstradas |
| :--- | :--- |
| `../base_tabelas/` | **Base de Dados (Source Data):** Contém o script SQL principal (`tabela_ecommerce.sql`) para o setup do banco de dados utilizado. |
| **`regras-de-negocio/`** | **Análises de Negócio (KPIs):** Contém todos os exercícios de análise, demonstrando habilidades em Agregação, Filtros, Joins e Geração de KPIs. |
| `relatorios/` | **Extração para Relatórios:** Contém scripts SQL voltados para a extração final de dados limpos para alimentar artefatos de BI. |
| `outputs/` | **Artefatos de Entrega:** Armazena os resultados finais das análises, como arquivos **CSV exportados** e **visualizações** (gráficos PNG). |

---

## ✨ Exemplos de Análises de Negócio Realizadas

Esta pasta demonstra a capacidade de responder a perguntas de negócio complexas:

* **Identificação de Clientes VIP:** Listagem de clientes com alta frequência e alto gasto.
* **Métricas Gerenciais (KPIs):**
    * Cálculo de **Ticket Médio** por Cliente e por Cidade.
    * Classificação do **Valor de Pedido** (VIP, Normal, Básico).
    * Análise de **Desempenho de Vendas** (Receita por Categoria, Top Produtos, Vendedores Baixo Desempenho).

---
## 📊 Análise e Visualização de Resultados (BI)

O projeto demonstra a capacidade de ir além das consultas, extraindo dados do banco para análises alimentares de **Business Intelligence (BI)** e relatórios de negócio.

| Arquivo/Pasta | Descrição |
| :--- | :--- |
| **`relatorios/`** | Pasta que contém *scripts* SQL específicos para a extração de dados brutos e relatórios de negócio. |
| **`relatorios/top5_clientes.sql`** | Script que calcula o gasto total por cliente (identificando os clientes mais importantes) e simula a entrega de dados limpos para a área de Análise. |
| **`relatorios/receita_por_categoria.sql`** | Script que calcula a receita total por categoria, essencial para análises de desempenho de vendas. |
| **`relatorios/produto_mais_vendido_por_cidade.sql`** | Script que identifica o produto mais vendido por cidade, oferecendo *insights* regionais. |
| **`outputs/`** | Pasta que armazena os artefatos de BI gerados a partir da extração via SQL. |
| **`outputs/planilha_clientes_top.csv`** | Arquivo CSV (saído da *query* `top5_clientes.sql`) contendo o conjunto de dados pronto para visualização. |
| **`outputs/clientes_top_5.png`** | Visualização (Gráfico) que mostra o *ranking* de gasto dos clientes mais importantes, completando o ciclo de análise e comunicação de resultados. |
| **`outputs/receita_por_categoria.png`** | Visualização (Gráfico) que mostra o desempenho da receita por categoria. |
| **`outputs/planilha_produto_mais_vendido_por_cidade`** | Arquivo CSV (saído da *query* de produto mais vendido por cidade) contendo o conjunto de dados pronto para visualização. |
| **`outputs/produtos_mais_vendidos_por_cidade`** | Visualização (Gráfico) que mostra o *ranking* de produtos vendidos por cidade, completando a análise regional. |

---

## ⚖️ Licença / Disclaimer

Todo o conteúdo deste repositório foi desenvolvido para fins educacionais e de portfólio pessoal. Você é livre para usar, modificar e compartilhar os arquivos, desde que respeite os créditos ao autor original.

---

## 🤝 Conecte-se

[Tiago Magalhães Santos - LinkedIn](https://www.linkedin.com/in/tiago-magalh%C3%A3es-santos-0b6ab0b6/)
