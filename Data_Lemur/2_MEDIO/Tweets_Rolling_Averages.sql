/*
Dada uma tabela de dados de tweets durante um período de 
tempo especificado, calcule a média contínua de tweets de 
3 dias para cada usuário. 

Produza o ID do usuário, a data do tweet e as médias contínuas 
arredondadas para 2 casas decimais.

Notas:

-> Uma média móvel, também conhecida como média móvel ou média 
móvel, é uma técnica de série temporal que examina tendências 
nos dados durante um período de tempo especificado.
-> Nesse caso, queremos determinar como a contagem de tweets 
de cada usuário muda durante um período de 3 dias.
*/

SELECT 
    user_id,
    tweet_date,
    ROUND(AVG(tweet_count) OVER(
        PARTITION BY user_id 
        ORDER BY tweet_date 
        ROWS BETWEEN 
            2 PRECEDING AND CURRENT ROW), 2)
from tweets;