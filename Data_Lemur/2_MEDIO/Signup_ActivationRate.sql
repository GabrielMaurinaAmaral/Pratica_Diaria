/*
Novos usuários do TikTok se inscrevem com seus e-mails. 

Eles confirmaram sua inscrição respondendo ao texto de 
confirmação para ativar suas contas. 

Os usuários podem receber várias mensagens de texto para 
confirmação da conta até que confirmem sua nova conta.

Um analista sênior está interessado em saber a taxa de 
ativação de usuários específicos na tabela de emails. 

Escreva uma consulta para encontrar a taxa de ativação. 

Arredonde a porcentagem para 2 casas decimais.

Definições:

-> A tabela de e-mails contém as informações dos detalhes de 
inscrição do usuário.
-> A tabela de textos contém as informações de ativação dos 
usuários.

Premissas:

-> O analista está interessado na taxa de ativação de usuários 
específicos na tabela de emails, que pode não incluir todos 
os usuários que poderiam ser encontrados na tabela de textos.
-> Por exemplo, o usuário 123 na tabela de emails pode não 
estar na tabela de textos e vice-versa.
*/

SELECT 
    ROUND(1.0*COUNT(*) FILTER (WHERE signup_action = 'Confirmed')/COUNT(*), 2)
FROM emails E
INNER JOIN texts T
    ON E.email_id = T.email_id;