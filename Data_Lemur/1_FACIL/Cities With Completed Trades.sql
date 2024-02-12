/*
Suponha que você receba tabelas contendo ordens de negociação 
concluídas e detalhes do usuário em um sistema de negociação 
Robinhood.

Escreva uma consulta para recuperar as três principais cidades 
que possuem o maior número de ordens comerciais concluídas 
listadas em ordem decrescente. 

Produza o nome da cidade e o número correspondente de ordens 
comerciais concluídas.
*/

SELECT 
    U.city, 
    COUNT(T.order_id)
FROM users U
JOIN trades T
    ON T.user_id = U.user_id
WHERE T.status = 'Completed'
GROUP BY U.city
ORDER BY 2 DESC
LIMIT 3;