/*
Você recebe duas tabelas: a tabela do anunciante contém informações sobre os anunciantes e seus respectivos status de pagamento, e a tabela daily_pay contém as informações de pagamento atuais dos anunciantes e inclui apenas os anunciantes que efetuaram pagamentos.

Escreva uma consulta para atualizar o status de pagamento dos anunciantes do Facebook com base nas informações da tabela daily_pay. A saída deve incluir o ID do usuário e seu status de pagamento atual, classificado pelo ID do usuário.

O status de pagamento dos anunciantes pode ser classificado nas seguintes categorias:

Novo: Anunciantes recém-cadastrados e que efetuaram o primeiro pagamento.
Existente: anunciantes que efetuaram pagamentos no passado e recentemente efetuaram um pagamento atual.
Churn: anunciantes que fizeram pagamentos no passado, mas não fizeram nenhum pagamento recentemente.
Ressuscitar: anunciantes que não fizeram um pagamento recente, mas podem ter feito um pagamento anterior e feito novamente recentemente.
Antes de prosseguir com a pergunta, é importante entender as possíveis transições no status do anunciante com base no status do pagamento. A tabela a seguir fornece um resumo dessas transições:
*/