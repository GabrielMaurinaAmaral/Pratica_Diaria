/*
Suponha que você receba uma tabela sobre as transações dos 
usuários do Walmart. 

Com base na data da transação mais recente, escreva uma 
consulta que recupere os usuários junto com o número de 
produtos que eles compraram.

Produza a data da transação mais recente do usuário, o ID 
do usuário e o número de produtos, classificados em ordem 
cronológica pela data da transação.
*/

WITH ultima_transaction AS(
    SELECT 
        transaction_date, 
        user_id,
        DENSE_RANK() OVER (
            PARTITION BY user_id 
            ORDER BY transaction_date DESC) AS ranking 
    FROM user_transactions
)

SELECT 
    transaction_date, 
    user_id,
    COUNT(*)
FROM ultima_transaction
WHERE ranking = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date, user_id;