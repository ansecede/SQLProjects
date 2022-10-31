SELECT DISTINCT(name)
  FROM people AS p, directors AS d, ratings AS r
 WHERE p.id = d.person_id
   AND d.movie_id = r.movie_id
   AND r.rating >= 9.0;