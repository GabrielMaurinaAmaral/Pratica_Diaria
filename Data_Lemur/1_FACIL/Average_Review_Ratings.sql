/*
Dada a tabela de avaliações, escreva uma consulta para 
recuperar a classificação média por estrelas de cada produto, 
agrupada por mês. 

A saída deve exibir o mês como um valor numérico, ID do produto
e classificação média por estrelas arredondada para duas casas 
decimais. 

Classifique a saída primeiro por mês e depois por ID do produto.
*/

SELECT  
    EXTRACT(MONTH FROM submit_date) AS mes,
    product_id,
    ROUND(AVG(stars), 2)
FROM reviews
GROUP BY product_id, mes
ORDER BY mes, product_id;