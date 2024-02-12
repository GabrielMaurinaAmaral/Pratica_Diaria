/*
A Amazon quer maximizar o número de itens que pode estocar em um armazém de 500.000 pés quadrados. Ela deseja estocar o maior número possível de itens nobres e, posteriormente, usar a metragem quadrada restante para estocar o maior número de itens não nobres.

Escreva uma consulta para encontrar o número de itens nobres e não nobres que podem ser armazenados no armazém de 500.000 pés quadrados. Produza o tipo de item com prime_eligible seguido de not_prime e o número máximo de itens que podem ser estocados.

A partir de 3 de abril de 2023, adicionamos algumas novas suposições à questão para fornecer maior clareza.

Premissas:

Itens nobres e não nobres devem ser armazenados em quantidades iguais, independentemente de seu tamanho ou metragem quadrada. Isso implica que os itens principais serão armazenados separadamente dos itens não principais em seus respectivos contêineres, mas dentro de cada contêiner todos os itens deverão estar na mesma quantidade.
Os itens não nobres devem estar sempre disponíveis em estoque para atender à demanda do cliente, portanto a contagem de itens não nobres nunca deve ser zero.
A contagem de itens deve ser números inteiros (inteiros).
*/

SELECT  
    item_type AS tipo_item,
    SUM(square_footage) AS total_prime_eligible,  
    COUNT(*) AS count_not_prime  
FROM inventory  
GROUP BY item_type;