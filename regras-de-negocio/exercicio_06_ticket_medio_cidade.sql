-- Ticket Médio por Cidade
-- : Calcule o ticket médio de vendas por cidade. Mostre: cidade, ticket_medio

SELECT c.cidade,
       ROUND(AVG(v.valor_total), 2) AS ticket_medio
       FROM clientes c
       JOIN vendas v
       ON c.id_cliente = v.id_cliente
       GROUP BY c.cidade
       ORDER BY ticket_medio DESC;
