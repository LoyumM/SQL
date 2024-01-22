WITH
    cte
    AS
    
    (
        SELECT
            h.hacker_id,
            h.name,
            COUNT(DISTINCT s.challenge_id) AS full_scores
        FROM Hackers h
            LEFT JOIN Submissions s ON h.hacker_id = s.hacker_id
            LEFT JOIN Challenges c ON s.challenge_id = c.challenge_id
            LEFT JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
        WHERE s.score = d.score
        GROUP BY 1, 2
        ORDER BY 3 DESC, 1 ASC
    )

SELECT CONCAT(hacker_id, ' ', name) AS id_name
FROM cte
WHERE full_scores > 1;
