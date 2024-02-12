/*
A CVS Health está analisando seus dados de vendas de farmácias 
e a qualidade das vendas de diferentes produtos no mercado. 

Cada medicamento é fabricado exclusivamente por um único 
fabricante.

Escreva uma consulta para identificar os fabricantes associados 
aos medicamentos que resultaram em perdas para a CVS Health e 
calcule o valor total das perdas incorridas.

Produza o nome do fabricante, a quantidade de medicamentos 
associados às perdas e as perdas totais em valor absoluto. 

Exiba os resultados classificados em ordem decrescente com as 
maiores perdas exibidas na parte superior.
*/

SELECT 
    manufacturer,
    COUNT(*),
    SUM(cogs - total_sales)
FROM pharmacy_sales
WHERE cogs - total_sales>0
GROUP BY manufacturer
ORDER BY 3 DESC;