-- Projetar o primeiro nome e o último nome dos atores que são diretores;
SELECT actors.first_name , actors.last_name

FROM actors join directors on actors.id = directors.id

 
-- Projetar o primeiro nome e o último nome dos atores que não são diretores;
SELECT actors.first_name , actors.last_name

FROM actors left join directors on actors.id = directors.id

WHERE directors.id IS NULL

 
 
-- Projetar o primeiro nome e o último nome dos atores e diretores;
SELECT actors.first_name, actors.last_name

FROM actors

UNION

SELECT directors.first_name, directors.last_name

FROM directors

 
 
-- Projetar o nome dos filmes que não são dirigidos por nenhum diretor;
SELECT name

FROM movies left join movies_directors on id = movie_id

WHERE movie_id IS NULL

 

-- Projetar primeiro nome e o último nome dos atores que não atuaram em pelo menos dois filmes;
SELECT first_name,last_name

FROM actors 

left join (select actor_id, 
           COUNT(*) AS filmesNum from roles 
           group by actor_id) 

as B on id = actor_id

WHERE filmesNum <= 2
