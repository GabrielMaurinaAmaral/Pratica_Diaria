/*
Suponha que você receba tabelas com informações sobre os 
usuários do Snapchat, incluindo idade e tempo gasto enviando 
e abrindo snaps.

Escreva uma consulta para obter um detalhamento do tempo 
gasto enviando versus abrindo snaps como uma porcentagem 
do tempo total gasto nessas atividades agrupadas por faixa 
etária. 

Arredonde a porcentagem para 2 casas decimais na saída.

Calcule as seguintes porcentagens:
-> tempo gasto enviando / (Tempo gasto enviando + Tempo gasto abrindo)
-> Tempo gasto na abertura / (Tempo gasto no envio + Tempo gasto na abertura)

Para evitar a divisão inteira em porcentagens, multiplique 
por 100,0 e não por 100.
*/

WITH activities_age AS(
    SELECT 
        B.age_bucket AS age, 
        SUM(A.time_spent) FILTER (WHERE activity_type = 'send') AS  send_total,
        SUM(A.time_spent) FILTER (WHERE activity_type = 'open') AS  open_total
    FROM activities A
    INNER JOIN age_breakdown B
        ON A.user_id = B.user_id
    GROUP BY B.age_bucket
)

SELECT 
    age,
    ROUND(100.0*send_total/(send_total+open_total), 2),
    ROUND(100.0*open_total/(send_total+open_total), 2)
FROM activities_age;