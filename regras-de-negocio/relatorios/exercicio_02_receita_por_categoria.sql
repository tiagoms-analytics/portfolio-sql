-- Receita por Categoria
-- Calcule a receita total (SUM(preco * quantidade)) por categoria. Mostre: categoria, receita_total. Ordene da maior para a menor receita.
SELECT p.categoria,
       SUM(p.preco * i.quantidade) AS receita_total
       FROM produtos p
       JOIN itens_venda i 
       ON i.id_produto = p.id_produto
       GROUP BY p.categoria
       ORDER BY receita_total DESC;
       
	