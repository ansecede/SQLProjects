SELECT m.title
  FROM people AS p, stars AS s, movies AS m
 WHERE p.id = s.person_id
   AND m.id = s.movie_id
   AND p.name = "Johnny Depp"
   AND movie_id IN (SELECT s.movie_id
                      FROM people AS p JOIN stars AS s
                        ON s.person_id = p.id
                     WHERE p.name = "Helena Bonham Carter");