/*
Suponha que você receba uma tabela contendo dados sobre 
clientes da Amazon e seus gastos em produtos em categorias 
diferentes, escreva uma consulta para identificar os dois 
produtos de maior bilheteria em cada categoria no ano de 2022. 

O resultado deve incluir a categoria, produto, e gasto total.
*/

WITH ranked_spending AS (
  SELECT 
    category, 
    product, 
    SUM(spend) AS total_spend,
    RANK() OVER (
      PARTITION BY category 
      ORDER BY SUM(spend) DESC) AS ranking 
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
)

SELECT 
    category, 
    product, 
    total_spend 
FROM ranked_spending 
WHERE ranking<=2
ORDER BY category, total_spend DESC;