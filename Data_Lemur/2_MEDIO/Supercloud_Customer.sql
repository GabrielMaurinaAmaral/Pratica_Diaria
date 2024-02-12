/*
Um cliente do Microsoft Azure Supercloud é definido como uma 
empresa que compra pelo menos um produto de cada categoria 
de produto.

Escreva uma consulta que identifique efetivamente o ID da 
empresa desses clientes do Supercloud.
*/

SELECT customer_id
FROM customer_contracts C
JOIN products P
    ON C.product_id = P.product_id
WHERE product_name LIKE '%Azure%'
GROUP BY customer_id
ORDER BY COUNT(*) DESC
LIMIT 1;