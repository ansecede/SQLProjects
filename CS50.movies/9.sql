SELECT DISTINCT(p.name)
  FROM people AS p, stars AS s, movies AS m
 WHERE p.id = person_id
   AND m.id = movie_id
   AND m.year = 2004
 ORDER BY p.birth;