/*
Exercicios abaixo
Selecione o nome e a categoria dos produtos que tenham o preço superior a 30;
Selecione o nome, telefone e data de nascimento dos clientes que nasceram antes do ano de 1985;
Selecione o id do produto e os ingredientes de informações do produto para os ingredientes que contenham a palavra “carne”;
Selecione o nome e a categoria dos produtos ordenados em ordem alfabética por categoria, para cada categoria deve ser ordenada pelo nome do produto;
Selecione os 5 produtos mais caros do restaurante;
A cada dia da semana 2 pratos principais estão na promoção, hoje você deve selecionar 2 produtos da categoria 'Prato Principal' e pular 6 registros (offset = 5);
Faça backup dos dados da tabela solicitada com o nome de backup_pedidos.
*/

use restaurante;

select * from backup_pedidos;
desc produtos;

SELECT nome, categoria FROM produtos WHERE preco > 30;

SELECT nome, telefone, data_nascimento FROM clientes WHERE year(data_nascimento) < '1985';

SELECT id_produto, ingredientes FROM info_produtos WHERE ingredientes LIKE '%carne%';

SELECT nome, categoria FROM produtos ORDER BY nome ASC;

SELECT nome, preco FROM produtos ORDER BY preco DESC LIMIT 5;

SELECT nome, categoria FROM produtos WHERE  categoria = 'Prato Principal' LIMIT 2 OFFSET 5;

CREATE TABLE  backup_pedidos LIKE pedidos;
INSERT INTO backup_pedidos SELECT * FROM pedidos;






