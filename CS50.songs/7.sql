SELECT AVG(energy) FROM songs s, artists a
WHERE s.artist_id = a.id 
AND a.name = "Drake";