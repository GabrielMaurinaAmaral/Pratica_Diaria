/*
Suponha que você receba uma tabela contendo informações sobre 
as transações dos usuários da Wayfair para diferentes produtos.
 
Escreva uma consulta para calcular a taxa de crescimento anual 
para o gasto total de cada produto, agrupando os resultados 
por ID do produto.

A saída deve incluir o ano em ordem crescente, ID do produto, 
gastos do ano atual, gastos do ano anterior e percentual de 
crescimento anual, arredondado para duas casas decimais.
*/

WITH vendas_ano_produto AS (
    SELECT 
        EXTRACT(YEAR FROM transaction_date) AS ano,
        product_id AS id_produto,
        spend AS spend_atual,
        LAG(spend, 1) OVER (
            PARTITION BY product_id 
            ORDER BY product_id, transaction_date) AS spend_passada
    FROM user_transactions
)

SELECT 
    ano,
    id_produto, 
    spend_atual, 
    spend_passada, 
    ROUND(100 * (spend_atual - spend_passada)/ 
        spend_passada, 2) 
FROM vendas_ano_produto;