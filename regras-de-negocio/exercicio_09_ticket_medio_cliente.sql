-- Ticket Médio por Cliente
-- Calcule o ticket médio de cada cliente. Mostre: id_cliente, nome, cidade, ticket_medio.

SELECT c.id_cliente AS cliente,
       c.nome,
       c.cidade,
       ROUND(AVG(v.valor_total), 2) AS ticket_medio_cliente
FROM clientes c
JOIN vendas v
 ON c.id_cliente = v.id_cliente
 GROUP BY c.id_cliente, c.cidade, c.nome
 ORDER BY ticket_medio_cliente DESC;