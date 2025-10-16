-- Média de Faturamento por Cidade
-- Calcule a média de faturamento por cidade e exiba também a menor e maior venda média.

SELECT c.cidade,
       COUNT(v.id_venda) AS qtd_vendas,
       ROUND(AVG(v.valor_total), 2) AS media_faturamento,
       ROUND(MIN(v.valor_total), 2) AS menor_venda, 
       ROUND(MAX(v.valor_total), 2) AS maior_venda
       FROM clientes c
       JOIN vendas v
       ON c.id_cliente = v.id_cliente
       GROUP BY c.cidade
       ORDER BY media_faturamento DESC;

