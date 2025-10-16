-- Classificação de Valor de Pedido
-- : Liste o ID do Pedido, o Valor Total e uma nova coluna 'Nível de Venda': 'VIP' (valor_total > 2000), 'Normal' (valor_total > 500), 'Básico' (demais).

SELECT v.id_venda,
       v.valor_total,
       CASE 
       WHEN v.valor_total > 2000 THEN 'VIP'
       WHEN v.valor_total > 500 THEN 'Normal'
       ELSE 'Basico'
       END AS nivel_de_venda
FROM vendas v
ORDER BY v.valor_total DESC;
