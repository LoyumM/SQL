(SELECT u.name AS results
FROM MovieRating m LEFT JOIN users u
    ON m.user_id = u.user_id
GROUP BY 1
ORDER BY COUNT(rating) DESC, 1
LIMIT 1)
UNION ALL
(SELECT 
m
.title AS results 
FROM MovieRating r LEFT JOIN Movies m
    ON r.movie_id = m.movie_id
WHERE created_at BETWEEN '2020-02-01' AND '2020-02-28'
GROUP BY 1
ORDER BY AVG
(rating) DESC, 1
LIMIT 1)