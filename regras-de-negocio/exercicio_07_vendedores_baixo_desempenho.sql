-- Vendedores de Baixo Desempenho
-- : Liste o nome do vendedor e o valor total que ele vendeu. Filtre para vendedores com total < R$ 50.000 e menos de 200 pedidos.

SELECT c.nome,
      SUM(v.valor_total) AS total_venda
FROM clientes c
JOIN vendas v
ON c.id_cliente = v.id_cliente
GROUP BY c.nome
HAVING SUM(v.valor_total) < 50000 AND COUNT(v.id_venda) < 200
ORDER BY total_venda DESC;