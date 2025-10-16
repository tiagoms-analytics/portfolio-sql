-- Clientes VIP
-- Liste os clientes que realizaram mais de 7 compras e gastaram acima de R$ 5.000,00 no total. Mostre: nome, número de compras, valor total gasto.

SELECT c.nome AS clientes_vip,
       COUNT(v.id_venda) AS numero_de_compras,
       SUM(v.valor_total) AS total_gasto
FROM clientes c
JOIN vendas v 
ON c.id_cliente = v.id_cliente
GROUP BY c.nome HAVING COUNT(v.id_venda) > 7 AND SUM(v.valor_total) > 5000 ORDER BY
total_gasto DESC;

