WITH
    cte
    AS

    (
        SELECT
            s.hacker_id,
            name,
            challenge_id,
            MAX(score) AS score
        FROM submissions as s
            JOIN hackers as h on h.hacker_id=s.hacker_id
        GROUP BY s.hacker_id, name, challenge_id
    )

SELECT hacker_id,
    name,
    SUM(score) AS total_score
FROM cte
WHERE score > 0
GROUP BY hacker_id, name
ORDER BY 3 DESC, 1;
