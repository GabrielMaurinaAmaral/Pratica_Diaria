/*
Suponha que você receba uma tabela contendo ofertas de emprego
de várias empresas na plataforma LinkedIn. Escreva uma consulta 
para recuperar a contagem de empresas que publicaram listas de 
empregos duplicadas.

Definição:

Listas de empregos duplicadas são definidas como duas listas de
empregos na mesma empresa que compartilham títulos e descrições
idênticas.,
*/

SELECT COUNT(*)
FROM (SELECT company_id, title, description
      FROM job_listings
      GROUP BY company_id, title, description
      HAVING COUNT(*) > 1
) AS sub_query;