/*
Suponha que você tenha uma tabela de eventos na análise de 
aplicativos do Facebook. 

Escreva uma consulta para calcular a taxa de cliques (CTR) 
do aplicativo em 2022 e arredonde os resultados para 2 casas 
decimais.

Definição e nota:

-> Porcentagem de taxa de cliques (CTR) = 100,0 * Número de 
cliques / Número de impressões
-> Para evitar a divisão inteira, multiplique a CTR por 100,0,
não por 100.
*/

SELECT 
    app_id, 
    ROUND(100.0*COUNT(CASE WHEN event_type = 'click' THEN 1 END)/
    COUNT(CASE WHEN event_type = 'impression' THEN 1 END), 2)
FROM events
WHERE EXTRACT(YEAR FROM timestamp) = 2022
GROUP BY app_id;