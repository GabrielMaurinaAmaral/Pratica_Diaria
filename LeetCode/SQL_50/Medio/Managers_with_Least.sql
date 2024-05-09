/*
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+

id é a chave primária (coluna com valores exclusivos) para esta tabela. 
Cada linha desta tabela indica o nome de um funcionário, seu departamento e o ID de seu gerente. 
Se managerId for nulo, o funcionário não tem gerente. 
Nenhum funcionário será gerente de si mesmo.
 
Escreva uma solução para encontrar gerentes com pelo menos cinco subordinados diretos .
Retorne a tabela de resultados em qualquer ordem .
O formato do resultado está no exemplo a seguir.
*/

SELECT E1.name 
FROM Employee E1 
JOIN Employee E2 
    ON E1.id = E2.managerId 
GROUP BY E2.managerId 
HAVING COUNT(*) >= 5;