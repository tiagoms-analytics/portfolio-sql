/*
Extracao do relatorio_clientes_total_gasto
*/

SELECT c.nome as cliente,  c.email, f.nome as funcionario, p.nome as produto, pe.id_pedido, p.preco, pe.quantidade, pe.data_pedido,
SUM(pe.quantidade * p.preco) as valor_total
FROM clientes c
JOIN pedidos pe ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
JOIN produtos p ON pe.id_produto = p.id_produto
GROUP BY c.nome, c.email, f.nome, p.nome, pe.id_pedido, pe.data_pedido
ORDER BY valor_total DESC;