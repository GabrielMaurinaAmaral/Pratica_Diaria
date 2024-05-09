/*
Table: Signups
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+
user_id é a coluna de valores exclusivos para esta tabela.
Cada linha contém informações sobre o horário de inscrição do usuário com ID user_id.

Table: Confirmations
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
| action         | ENUM     |
+----------------+----------+

(user_id, time_stamp) é a chave primária (combinação de colunas com valores exclusivos) para esta tabela. 
user_id é uma chave estrangeira (coluna de referência) para a tabela Signups. 
action é uma ENUM (categoria) do tipo ('confirmed', 'timeout') 
Cada linha desta tabela indica que o usuário com ID user_id solicitou uma mensagem de confirmação em time_stamp e essa mensagem de confirmação foi confirmada ('confirmed') ou expirou sem confirmação ('timeout').

A taxa de confirmação de um usuário é o número de 'confirmed'mensagens dividido pelo número total de mensagens de confirmação solicitadas.
A taxa de confirmação de um usuário que não solicitou nenhuma mensagem de confirmação é de 0. 
Arredonde a taxa de confirmação para duas casas decimais.

*/