/*
Suponha que você receba tabelas com informações sobre 
inscrições e confirmações de usuários do TikTok por e-mail 
e texto. 

Novos usuários do TikTok se inscrevem usando seus endereços 
de e-mail e, ao se inscrever, cada usuário recebe uma mensagem 
de texto de confirmação para ativar sua conta.

Escreva uma consulta para exibir os IDs de usuário daqueles 
que não confirmaram sua inscrição no primeiro dia, mas 
confirmaram no segundo dia.

Definição:

-> action_date refere-se à data em que os usuários ativaram 
suas contas e confirmaram sua inscrição por meio de mensagens 
de texto.
*/

SELECT DISTINCT E.user_id
FROM emails E
JOIN texts T 
     ON E.email_id = T.email_id
WHERE E.signup_date = T.action_date - INTERVAL '1 day'
  AND T.signup_action = 'Confirmed';