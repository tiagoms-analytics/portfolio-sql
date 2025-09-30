/*

Exercicios abaixo executados:
Crie uma view chamada resumo_pedido do join entre essas tabelas:
(pedidos: id, quantidade e dados
clientes: nome e email
funcionarios: nome
produtos: nome, preco)

Selecione o id do pedido, nome do cliente e o total (quantidade * preço) de cada pedido da view resumo_pedido

Atualiza o view resumo pedido, adicionando campo total

Repita a consulta da questão 3, utilizando o campo total adicionado

Repita a consulta da pergunta anterior, com uso do EXPLAIN para verificar e compreender o JOIN que está oculto em nossa consulta

Crie uma função chamada 'BuscaIngredientesProduto', que retornará os ingredientes da tabela info produtos, quando passar o id do produto como argumento (entrada) da função.

Execute a função 'BuscaIngredientesProduto' com o id do produto 10

Crie uma função chamada 'mediaPedido' que retornará uma mensagem dizendo que o total do pedido é acima, abaixo ou igual a média de todos os pedidos, quando passar o id do pedido como argumento da função

Execute a função 'mediaPedido' com o id de pedido 5 e depois 6.

*/

use restaurante;

SELECT * FROM cliente LIMIT 10;
SELECT * FROM pedidos LIMIT 10;
SELECT * FROM funcionarios LIMIT 10;
SELECT * FROM produtos LIMIT 10;
SELECT * FROM info_produtos LIMIT 10;

 
CREATE VIEW resumo_pedido AS
SELECT id_pedido, pe.quantidade, pe.data_pedido, c.nome AS nome_cliente, c.email, f.nome AS nome_funcionario, p.nome AS nome_produto, p.preco FROM pedidos pe
JOIN clientes c ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
JOIN produtos p ON pe.id_produto = p.id_produto;

EXPLAIN 
SELECT id_pedido, nome_cliente, (quantidade * preco) AS total FROM resumo_pedido;
SELECT total FROM resumo_pedido;


CREATE OR REPLACE VIEW resumo_pedido AS
SELECT  id_pedido, pe.quantidade, pe.data_pedido, c.nome AS nome_cliente, c.email, f.nome AS nome_funcionario, p.nome AS nome_produto, p.preco, (pe.quantidade * p.preco) AS total FROM pedidos pe
JOIN clientes c ON pe.id_cliente = c.id_cliente
JOIN funcionarios f ON pe.id_funcionario = f.id_funcionario
JOIN produtos p ON pe.id_produto = p.id_produto;

EXPLAIN 
SELECT * FROM resumo_pedido;

DELIMITER //
CREATE FUNCTION BuscaIngredientesProduto (IDproduto INT)
RETURNS VARCHAR (100)
READS SQL DATA
 BEGIN
 DECLARE ingredientes_do_produto TEXT;
 SELECT i.ingredientes INTO  ingredientes_do_produto FROM produtos p 
 JOIN info_produtos i ON p.id_produto = i.id_produto
 WHERE  p.id_produto = IDproduto;
 RETURN ingredientes_do_produto;
 END //
 DELIMITER ;
  
SELECT BuscaIngredientesProduto(10);

DELIMITER //
CREATE FUNCTION mediaPedido(IDpedido INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
    DECLARE total_pedido FLOAT;
    DECLARE media_total FLOAT;
    DECLARE classificacao_total VARCHAR(100);
    
    SELECT quantidade * preco
    INTO total_pedido
    FROM resumo_pedido
    WHERE id_pedido = IDpedido;
    
    SELECT AVG(quantidade * preco)
    INTO media_total
    FROM resumo_pedido;
    
    SET classificacao_total = CASE
        WHEN total_pedido < media_total THEN 'Abaixo da média'
        WHEN total_pedido > media_total THEN 'Acima da média'
        ELSE 'Igual a média'
    END;

    RETURN classificacao_total;
END //

DELIMITER ;

SELECT mediaPedido(5);
SELECT mediaPedido(6);

-- Sem função
SELECT
    id_pedido,
    SUM(quantidade * preco) AS valor_total,
    CASE
        WHEN SUM(quantidade * preco) > 500 THEN 'Pedido Grande'
        WHEN SUM(quantidade * preco) >= 200 AND SUM(quantidade * preco) <= 500 THEN 'Pedido Médio'
        ELSE 'Pedido Pequeno'
    END AS porte_pedido
FROM
    resumo_pedido
GROUP BY
    id_pedido
ORDER BY
    valor_total DESC;