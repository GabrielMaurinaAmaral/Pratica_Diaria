/*
Sua equipe no JPMorgan Chase está se preparando para lançar 
um novo cartão de crédito e, para obter alguns insights, você 
está analisando quantos cartões de crédito foram emitidos a 
cada mês.

Escreva uma consulta que produza o nome de cada cartão de 
crédito e a diferença na quantidade de cartões emitidos entre 
o mês com maior emissão de cartões e o mês com menor emissão. 

Organize os resultados com base na maior disparidade.
*/

SELECT 
    card_name, 
    MAX(issued_amount) - MIN(issued_amount) 
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY 1 DESC;