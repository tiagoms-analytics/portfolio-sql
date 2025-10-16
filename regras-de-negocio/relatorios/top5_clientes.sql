-- Top 5 Clientes por Gasto Total
-- Liste os 5 clientes que mais gastaram no histórico de vendas.
-- Mostre o nome do cliente e o total gasto. 
-- Ordene do maior para o menor e limite o resultado a 5 linhas.

SELECT c.nome AS cliente,
       SUM(v.valor_total) AS total_gasto
FROM clientes c
JOIN vendas v
ON c.id_cliente = v.id_cliente
GROUP BY c.nome
ORDER BY total_gasto DESC
LIMIT 5;

