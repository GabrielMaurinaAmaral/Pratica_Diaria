/*
Sua equipe do JPMorgan Chase lançará em breve um novo cartão 
de crédito. 

Você deverá estimar quantos cartões emitirá no primeiro mês.

Antes de poder responder a essa pergunta, você deseja primeiro
ter uma perspectiva sobre o desempenho normal dos lançamentos 
de novos cartões de crédito no primeiro mês.

Escreva uma consulta que produza o nome do cartão de crédito 
e quantos cartões foram emitidos no mês de lançamento. 

O mês de lançamento é o primeiro registro na tabela 
mensal_cards_issued de um determinado cartão. 

Ordene os resultados a partir do maior valor emitido.
*/

SELECT DISTINCT
    card_name,
    FIRST_VALUE(issued_amount) OVER(
        PARTITION BY card_name 
        ORDER BY issue_year, issue_month)
FROM monthly_cards_issued
ORDER BY 2 DESC;