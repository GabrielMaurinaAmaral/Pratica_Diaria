/*
Suponha que você receba uma tabela contendo informações sobre 
as ações dos usuários do Facebook. 

Escreva uma consulta para obter o número de usuários ativos 
mensais (MAUs) em julho de 2022, incluindo o mês no formato 
numérico "1, 2, 3".

Dica:

Um usuário ativo é definido como aquele que executou ações
como 'fazer login', 'curtir' ou 'comentário' no mês atual 
e no mês anterior.
*/

SELECT 
    MAX(EXTRACT(MONTH FROM event_date)),
    MAX(EXTRACT(MONTH FROM event_date)) - 
    MIN(EXTRACT(MONTH FROM event_date))
FROM user_actions
GROUP BY user_id
ORDER BY 1 DESC, 2 DESC
LIMIT 1;