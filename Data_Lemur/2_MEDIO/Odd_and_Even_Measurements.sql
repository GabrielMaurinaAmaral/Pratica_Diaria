/*
Suponha que você receba uma tabela com valores de medição 
obtidos de um sensor do Google durante vários dias, com 
medições realizadas várias vezes em cada dia.

Escreva uma consulta para calcular a soma das medições de 
números ímpares e pares separadamente para um determinado dia
e exiba os resultados em duas colunas diferentes. 

Consulte o exemplo de saída abaixo para obter o formato desejado.

Definição:

-> Dentro de um dia, as medições feitas na 1ª, 3ª e 5ª vezes 
são consideradas medições de números ímpares, e as medições 
feitas na 2ª, 4ª e 6ª vezes são consideradas medições de 
números pares.
*/

SELECT
    CAST(measurement_time AS DATE) AS measurement_day,
    SUM(CASE WHEN MOD(measurement_id, 2) = 1 THEN measurement_value ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN MOD(measurement_id, 2) = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM measurements
GROUP BY CAST(measurement_time AS DATE)
ORDER BY measurement_day;