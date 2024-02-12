/*
Uma chamada telefônica é considerada internacional quando a 
pessoa que liga está em um país diferente daquele que recebe 
a chamada.

Qual porcentagem de chamadas telefônicas são internacionais? 
Arredonde o resultado para 1 casa decimal.

Suposição:

-> O caller_id na tabela phone_info refere-se ao chamador e 
ao destinatário.
*/

SELECT  
    ROUND(100.0*SUM(CASE WHEN I.country_id <> R.country_id THEN 1 ELSE NULL END)/
    COUNT(*), 1)
FROM phone_calls AS C
LEFT JOIN phone_info AS I
    ON C.caller_id = I.caller_id
LEFT JOIN phone_info AS R
    ON C.receiver_id = R.caller_id;