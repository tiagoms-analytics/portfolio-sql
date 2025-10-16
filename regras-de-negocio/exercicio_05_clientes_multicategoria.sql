-- Clientes por Categoria de Compra
-- Liste os clientes que compraram produtos de mais de uma categoria. Mostre: id_cliente, nome, cidade, total_categorias.

SELECT c.id_cliente,
       c.nome,
       c.cidade,
       COUNT(DISTINCT p.categoria) AS total_categoria
       FROM clientes c
       JOIN vendas v 
       ON c.id_cliente = v.id_cliente
       JOIN itens_venda i
       ON i.id_venda = v.id_venda
       JOIN produtos p
       ON p.id_produto = i.id_produto
       GROUP BY c.id_cliente, c.nome, c.cidade
       HAVING COUNT(DISTINCT p.categoria) > 1 
       ORDER BY total_categoria DESC;