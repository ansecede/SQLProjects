SELECT p.name
  FROM people AS p, stars AS s
 WHERE p.id = s.person_id
   AND NOT p.name = "Kevin Bacon"
   AND s.movie_id IN (SELECT s.movie_id
                        FROM people AS p, stars AS s
                       WHERE p.id = s.person_id
                         AND p.name = "Kevin Bacon"
                         AND p.birth = 1958);