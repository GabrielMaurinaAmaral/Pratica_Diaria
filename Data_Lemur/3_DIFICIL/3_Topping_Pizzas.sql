/*
Você é consultor de uma grande rede de pizzarias que realizará 
uma promoção em que todas as pizzas com 3 coberturas serão 
vendidas por um preço fixo e está tentando entender os custos 
envolvidos.

Dada uma lista de coberturas de pizza, considere todas as 
pizzas possíveis com 3 coberturas e imprima o custo total 
dessas 3 coberturas. 

Classifique os resultados com o maior custo total no topo, 
seguido pelas coberturas de pizza em ordem crescente.

Quebre os laços listando os ingredientes em ordem alfabética, 
começando pelo primeiro ingrediente, seguido pelo segundo e 
terceiro.

P.S. Tenha cuidado com o espaçamento (ou falta dele) entre 
cada ingrediente. Consulte nosso exemplo de saída.

Notas:

-> Não exponha pizzas onde a cobertura seja repetida. 
Por exemplo, ‘Calabresa, Calabresa, Pizza de Cebola’.
-> Os ingredientes devem ser listados em ordem alfabética. 
Por exemplo, 'Frango,Cebola,Salsicha'. 'Cebola, Salsicha, 
Frango' não é aceitável.
*/

SELECT 
    CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name),
    p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost
FROM pizza_toppings AS p1
INNER JOIN pizza_toppings AS p2
    ON p1.topping_name < p2.topping_name 
INNER JOIN pizza_toppings AS p3
    ON p2.topping_name < p3.topping_name
ORDER BY 2 DESC, 1;