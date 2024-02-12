/*
Você recebe uma tabela contendo a contagem de itens para cada 
pedido no Alibaba, junto com a frequência de pedidos que têm 
a mesma contagem de itens. 

Escreva uma consulta para recuperar o modo das ocorrências do 
pedido. 

Além disso, se houver várias contagens de itens com o mesmo 
modo, os resultados deverão ser classificados em ordem 
crescente.

Esclarecimentos:

-> item_count: Representa a quantidade de itens vendidos em 
cada pedido.
-> order_occurrences: Representa a frequência dos pedidos 
com a quantidade correspondente de itens vendidos por pedido.
->  Por exemplo, se houver 800 pedidos com 3 itens vendidos 
em cada pedido, o registro terá um item_count de 3 e um 
order_occurrences de 800.
*/

SELECT item_count
FROM items_per_order
WHERE order_occurrences = 
    (SELECT MAX(order_occurrences) 
     FROM items_per_order)
ORDER BY item_count;