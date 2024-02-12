/*
A CVS Health deseja obter uma compreensão mais clara das 
vendas em farmácias e do desempenho de diversos produtos.

Escreva uma consulta para calcular o total de vendas de 
medicamentos para cada fabricante. 

Arredonde a resposta para o milhão mais próximo e relate 
seus resultados em ordem decrescente do total de vendas. 

No caso de duplicatas, classifique-as em ordem alfabética 
pelo nome do fabricante.

Como esses dados serão exibidos em um painel visualizado 
pelas partes interessadas da empresa, formate seus resultados 
da seguinte forma: "US$ 36 milhões".
*/

SELECT 
    manufacturer,
    '$' || TO_CHAR(ROUND(SUM(total_sales) / 1000000, 0), 'FM999,999,999') || ' million'
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, 1;