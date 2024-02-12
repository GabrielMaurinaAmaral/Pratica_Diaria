/*
Às vezes, as transações de pagamento são repetidas 
acidentalmente; 
pode ser devido a um erro do usuário, falha da API ou um erro 
de nova tentativa que faz com que o cartão de crédito seja 
cobrado duas vezes.

Usando a tabela de transações, identifique quaisquer 
pagamentos feitos no mesmo comerciante com o mesmo cartão de 
crédito e no mesmo valor com intervalo de 10 minutos entre eles. 

Conte esses pagamentos repetidos.

Premissas:

A primeira transação de tais pagamentos não deve ser 
contabilizada como um pagamento repetido. Isso significa que, 
se houver duas transações realizadas por um lojista com o 
mesmo cartão de crédito e pelo mesmo valor em até 10 minutos, 
haverá apenas 1 pagamento repetido.
*/

WITH transacao_minutos AS (
    SELECT 
        EXTRACT(
            EPOCH FROM
                LEAD(transaction_timestamp) OVER (
                    PARTITION BY merchant_id, 
                        credit_card_id,
                        amount
                    ORDER BY transaction_timestamp 
                )
            - transaction_timestamp
        )/60 AS diferenca_minutos
    FROM transactions
)

SELECT COUNT(diferenca_minutos)
FROM transacao_minutos
WHERE diferenca_minutos <= 10;