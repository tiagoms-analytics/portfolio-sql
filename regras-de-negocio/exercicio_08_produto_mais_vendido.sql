-- Receita Total por Produto
-- Calcule a receita total (preço * quantidade) gerada por cada produto. Mostre: id_produto, nome_produto, categoria, receita_total.


SELECT p.id_produto,
       p.nome_produto,
       p.categoria,
       SUM(p.preco * i.quantidade) AS receita_total
FROM produtos p
JOIN itens_venda i
ON p.id_produto = i.id_produto
GROUP BY p.id_produto, p.nome_produto, p.categoria
ORDER BY receita_total DESC, p.nome_produto ASC;