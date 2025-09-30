/*
Exercicios abaixo executados:
Utilizar o banco de dados do restaurante e crie os joins ou subconsultas

Selecionar:
(produtos: id, nome e descrição
info_produtos: ingredientes)

(Selecionar:
pedidos: id, quantidade e dados
clientes: nome e email)

Selecionar:
(pedidos: id, quantidade e dados
clientes: nome e email
funcionarios: nome)

Selecionar:
(pedidos: id, quantidade e dados
clientes: nome e email
funcionarios: nome
produtos: nome, preco)

Selecionar o nome dos clientes com os pedidos com status 'Pendente' e exibir por ordem descendente de acordo com o id do pedido

Selecionar clientes sem pedidos

Selecionar o nome do cliente e o total de pedidos de cada cliente

Selecionar o preço total (quantidade*preço) de cada pedido

*/
use restaurante;

SELECT * FROM funcionarios;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM pedidos;
SELECT * FROM info_produtos;

SELECT p.id_produto, p.nome, p.descricao, i.ingredientes
FROM produtos p
JOIN info_produtos i ON p.id_produto = i.id_produto; 

SELECT c.nome, c.email, pe.id_pedido, pe.quantidade, pe.data_pedido
FROM clientes c
JOIN pedidos pe ON pe.id_cliente = c.id_cliente
ORDER BY pe.data_pedido DESC;

SELECT c.nome as cliente,  c.email, f.nome as funcionario, pe.id_pedido, pe.quantidade, pe.data_pedido
FROM clientes c
JOIN pedidos pe ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
ORDER BY pe.data_pedido;

SELECT c.nome as cliente,  c.email, f.nome as funcionario, p.nome as produto, pe.id_pedido, p.preco, pe.quantidade, pe.data_pedido,
SUM(pe.quantidade * p.preco) as valor_total
FROM clientes c
JOIN pedidos pe ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
JOIN produtos p ON pe.id_produto = p.id_produto
GROUP BY c.nome, c.email, f.nome, p.nome, pe.id_pedido, pe.data_pedido
ORDER BY valor_total DESC;

SELECT c.nome, pe.id_pedido AS ordem_dos_pedidos
FROM clientes c
JOIN pedidos pe ON pe.id_cliente = c.id_cliente
WHERE pe.status_pedidos = 'Pendente'
ORDER BY ordem_dos_pedidos DESC;


SELECT c.nome
FROM clientes c
LEFT JOIN pedidos pe ON pe.id_cliente = c.id_cliente
WHERE pe.id_pedido IS NULL;
 
SELECT c.id_cliente, c.nome, SUM(pe.quantidade * p.preco) as total_pedidos
FROM clientes c
JOIN pedidos pe ON pe.id_cliente = c.id_cliente
JOIN produtos p ON pe.id_produto = p.id_produto 
GROUP BY c.id_cliente, c.nome
ORDER BY total_pedidos DESC;

SELECT  pe.id_pedido, sum(pe.quantidade * p.preco) AS preco_total
FROM pedidos pe
JOIN produtos p ON pe.id_produto = p.id_produto
GROUP BY pe.id_pedido
ORDER BY preco_total DESC;

-- U