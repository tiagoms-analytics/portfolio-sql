--  Produto Mais Vendido
-- Liste o produto mais vendido (em quantidade) em cada cidade. Mostre: cidade, quantidade_total.

SELECT c.cidade,
       
       SUM(i.quantidade) AS quantidade_total
       FROM clientes c
       JOIN vendas v
       ON c.id_cliente = v.id_cliente
       JOIN itens_venda i
       ON i.id_venda = v.id_venda 
       JOIN produtos p
       ON p.id_produto = i.id_produto
       GROUP BY c.cidade
       ORDER BY quantidade_total DESC;

