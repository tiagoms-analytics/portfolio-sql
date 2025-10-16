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

## ⚖️ Licença / Disclaimer

Todo o conteúdo deste repositório foi desenvolvido para fins educacionais e de portfólio pessoal. Você é livre para usar, modificar e compartilhar os arquivos, desde que respeite os créditos ao autor original.

---

## 🤝 Conecte-se

[Tiago Magalhães Santos - LinkedIn](https://www.linkedin.com/in/tiago-magalh%C3%A3es-santos-0b6ab0b6/)
