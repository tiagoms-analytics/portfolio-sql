/*

Exercicios abaixo executados:
Selecione todos os pedidos que do id funcionário igual a 4 e status é igual a 'Pendente'
Selecione todos os pedidos cujo status não é igual a 'Concluído'
Selecione os pedidos que contenham os id produtos: 1, 3, 5, 7 ou 8
Selecione os clientes que começam com a letra c
Selecione as informações de produtos que contenham ingredientes 'carne' ou 'frang
Selecione os produtos com o preço entre 20 a 30
Atualizar id pedido 6 da tabela pedidos para status = NULL
Selecione os pedidos com status nulos
Selecionar o id pedido e o status da tabela pedidos, porém para todos os status nulos, mostrar 'Cancelado'
Selecione o nome, carga, salário dos funcionários e adicione um campo chamado media_salario, que irá mostrar 'Acima da média', para o salário > 3000, senão 'Abaixo da média'

*/

use restaurante;

SELECT * FROM pedidos WHERE id_funcionario = 4 AND status_pedidos = 'Pendente';

SELECT * FROM pedidos WHERE status_pedidos <> 'Concluído';

SELECT * FROM pedidos WHERE id_produto IN (1, 3, 5, 7) OR 8;

SELECT * FROM clientes WHERE nome LIKE ('C%');

SELECT * FROM info_produtos WHERE (ingredientes LIKE 'carne%' OR ingredientes  LIKE 'frango%');

SELECT * FROM produtos WHERE preco BETWEEN 20 AND 30;

SELECT id_pedido, nullif(id_pedido, 6) FROM pedidos;

SELECT * FROM pedidos WHERE status_pedidos IS NULL;

SELECT id_pedido, status_pedidos, ifnull(status_pedidos, 'Cancelado') FROM pedidos;

UPDATE pedidos SET status_pedidos = NULL WHERE id_pedido = 49; -- CRIEI UM UPDATE NULO PARA PODER TESTAR O CANCELADO DOS STATUS_PEDIDO.

SELECT nome, cargo, salario,
 CASE 
  WHEN salario > 3000 THEN 'Acima da média'
  ELSE  'Abaixo da média' 
  END AS media_salario
  FROM funcionarios;






