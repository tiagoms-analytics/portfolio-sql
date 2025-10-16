-- Classificação de Frequência de Clientes
-- Para todos os clientes, calcule a quantidade total de pedidos no histórico. Classifique com uma coluna “Nível de Frequência”:
-- •	Alta: 15 ou mais pedidos
-- •	Média: 1 a 14 pedidos
-- •	Inativo: 0 pedidos
-- Inclua clientes sem pedidos na análise.

SELECT c.nome,
       COALESCE(COUNT(v.id_venda), 0 ) AS qtd_pedidos,
       CASE
        WHEN COALESCE(COUNT(v.id_venda), 0 ) > 15 THEN 'Alta'
        WHEN COALESCE(COUNT(v.id_venda), 0 ) BETWEEN 1 AND 14 THEN 'Média'
        ELSE  'Inativo no Histórico'
        END AS nivel_de_frequencia
FROM clientes c
LEFT JOIN vendas v
ON c.id_cliente = v.id_cliente
GROUP BY c.nome
ORDER BY qtd_pedidos;


