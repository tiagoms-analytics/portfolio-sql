/*

Exercicios abaixo executados:
Calcular a quantidade de pedidos
Calcular a quantidade de clientes únicos que realizaram pedidos
Calcular a média de preço dos produtos
Calcular o mínimo e máximo do preço dos produtos
Selecionar o nome e o preço do produto e faça uma classificação dos 5 produtos mais caros
Selecionar a média dos preços dos produtos agrupados por categoria
Selecionar o fornecedor e a quantidade de produtos fornecidos pelo fornecedor da informações de produtos
Selecionar os fornecedores que possuem mais de um produto cadastrado
Selecionar os clientes que realizaram apenas 1 pedido

*/


use restaurante;

SELECT * FROM info_produtos;

 
SELECT  COUNT(quantidade) FROM pedidos;

SELECT COUNT(DISTINCT id_cliente) AS cliente_unicos FROM pedidos;

SELECT  ROUND (AVG(preco), 2) AS media_preco  FROM produtos; -- limitei os digitos ao lado

SELECT  MAX(preco) AS maximo_preco, MIN(preco) AS minimo_preco FROM produtos;

SELECT  nome, preco, ROW_NUMBER() OVER (ORDER BY preco DESC) AS ranking_preco FROM produtos limit 5;

SELECT categoria, ROUND(AVG(preco), 2) AS preco_media FROM produtos GROUP BY categoria;

SELECT fornecedor, COUNT(id_produto) AS quantidade_produtos FROM info_produtos GROUP BY fornecedor;

SELECT fornecedor, COUNT(id_produto) AS quantidade_produtos FROM info_produtos GROUP BY fornecedor HAVING quantidade_produtos > 1 ORDER BY quantidade_produtos DESC;

SELECT id_cliente, count(id_pedido) AS pedido_unico FROM pedidos GROUP BY id_cliente HAVING COUNT(id_pedido) = 1; -- REFINADO E COMPATIVEL COM TODOS OS BANCOS.




