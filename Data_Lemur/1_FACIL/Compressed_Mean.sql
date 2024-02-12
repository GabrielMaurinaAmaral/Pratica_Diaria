/*
Você está tentando encontrar o número médio de itens por 
pedido no Alibaba, arredondado para 1 casa decimal usando 
tabelas que incluem informações sobre a contagem de itens 
em cada pedido (tabela item_count) e o número correspondente 
de pedidos para cada contagem de item (order_occurrences mesa).
*/

SELECT 
    ROUND(SUM(item_count*order_occurrences)::numeric / 
    SUM(order_occurrences)::numeric, 1)
FROM items_per_order;