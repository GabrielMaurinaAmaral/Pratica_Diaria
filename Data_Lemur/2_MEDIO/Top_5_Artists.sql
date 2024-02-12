/*
Suponha que existam três tabelas do Spotify: 
artistas, músicas e global_song_rank, que contêm informações 
sobre artistas, músicas e paradas musicais, respectivamente.

Escreva uma consulta para encontrar os 5 principais artistas 
cujas músicas aparecem com mais frequência no Top 10 da tabela 
global_song_rank. 

Exiba os 5 principais nomes de artistas em ordem crescente, 
juntamente com a classificação de aparência das músicas.

Se dois ou mais artistas tiverem o mesmo número de 
apresentações musicais, eles deverão receber a mesma 
classificação e os números da classificação deverão ser 
contínuos (ou seja, 1, 2, 2, 3, 4, 5). 

Se você nunca viu uma ordem de classificação como essa antes, 
faça o tutorial da função da janela de classificação.
*/

WITH Top_10_Artistas AS(
    SELECT 
        A.artist_name,
        DENSE_RANK() OVER( 
            ORDER BY COUNT(*) DESC) AS rank_musicas
    FROM artists A
    JOIN songs S
        ON A.artist_id = S.artist_id
    JOIN global_song_rank G
        ON S.song_id = G.song_id
    WHERE rank <= 10  
    GROUP BY A.artist_name
)

SELECT *
FROM Top_10_Artistas
WHERE rank_musicas <= 5;