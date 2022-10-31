SELECT m.title
  FROM people AS p, stars AS s, movies AS m, ratings AS r
 WHERE p.id = s.person_id
   AND m.id = s.movie_id
   AND m.id = r.movie_id
   AND p.name = "Chadwick Boseman"
 ORDER BY r.rating DESC
 LIMIT 5;