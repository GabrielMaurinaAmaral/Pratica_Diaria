/*
A CVS Health está tentando entender melhor suas vendas em 
farmácias e quão bem estão sendo vendidas diferentes produtos. 

Cada medicamento só pode ser produzido por um fabricante.

Escreva uma consulta para encontrar os três medicamentos mais
lucrativos vendidos e quanto lucro eles obtiveram. 

Suponha que não haja vínculos nos lucros. 

Exiba o resultado do lucro total mais alto para o mais baixo.

Definição:

-> cogs significa Custo dos Produtos Vendidos, que é o custo 
direto associado à produção do medicamento.
-> Lucro total = Vendas totais - Custo dos produtos vendidos
*/

SELECT 
    drug,
    total_sales-cogs
FROM pharmacy_sales
ORDER BY 2 DESC
LIMIT 3;