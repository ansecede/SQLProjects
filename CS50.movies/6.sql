SELECT AVG(rating) AS avg2012_rating
  FROM movies AS m,
       ratings AS r
 WHERE m.id = r.movie_id
   AND m.year = 2012;