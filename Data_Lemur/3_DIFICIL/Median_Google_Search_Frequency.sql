/*
A equipe de marketing do Google está fazendo um comercial 
para o Superbowl e precisa de uma estatística simples para 
colocar em seu anúncio de TV:

o número médio de pesquisas que uma pessoa fez no ano passado.

No entanto, à escala do Google, consultar os 2 biliões de 
pesquisas é demasiado dispendioso. 

Felizmente, você tem acesso à tabela de resumo que informa o 
número de pesquisas feitas no ano passado e quantos usuários 
do Google se enquadram nesse grupo.

Escreva uma consulta para relatar a mediana das pesquisas 
feitas por um usuário. 

Arredonde a mediana para uma casa decimal.
*/

WITH searches_expanded AS (
    SELECT searches
    FROM search_frequency
    GROUP BY searches,
        GENERATE_SERIES(1, num_users)
)

SELECT 
    PERCENTILE_CONT(0.5) WITHIN 
    GROUP (ORDER BY searches)
FROM searches_expanded;