/*
Suponha que você receba a tabela abaixo sobre as transações 
do Uber feitas pelos usuários. 

Escreva uma consulta para obter a terceira transação de cada 
usuário. 

Produza o ID do usuário, gasto e data da transação.
*/

WITH rank_id_transactions AS(
    SELECT 
        user_id, 
        spend, 
        transaction_date,
        ROW_NUMBER() OVER(
            PARTITION BY user_id
            ORDER BY transaction_date) AS rank_id
    FROM transactions
)  

SELECT 
    user_id, 
    spend, 
    transaction_date
FROM rank_id_transactions
WHERE rank_id = 3;