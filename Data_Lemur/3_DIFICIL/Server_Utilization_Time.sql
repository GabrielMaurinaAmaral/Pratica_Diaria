/*
Amazon Web Services (AWS) é alimentado por frotas de servidores.

A alta administração solicitou soluções baseadas em dados para 
otimizar o uso do servidor.

Escreva uma consulta que calcule o tempo total em que a frota 
de servidores esteve em execução. 

A saída deve estar em unidades de dias completos.

Premissas:

Cada servidor pode iniciar e parar diversas vezes.

O tempo total em que a frota de servidores está em execução 
pode ser calculado como a soma do tempo de atividade de cada 
servidor.
*/

WITH tempo_execucao AS (
    SELECT
        server_id AS id,
        session_status AS status,
        status_time AS tempo_inicio,
        LEAD(status_time) OVER (
            PARTITION BY server_id
            ORDER BY status_time) AS tempo_fim
    FROM server_utilization
)

SELECT
    DATE_PART('days', JUSTIFY_HOURS(SUM(tempo_fim-tempo_inicio)))
FROM tempo_execucao
WHERE status = 'start'
    AND tempo_fim IS NOT NULL;