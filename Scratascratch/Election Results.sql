WITH
    cte
    AS
    (
        SELECT voter, candidate,
            1.0/COUNT(*) OVER(PARTITION BY voter) AS pts
        FROM voting_results
        WHERE candidate IS NOT null
    ),
    cte_2
    AS
    
    (
        SELECT candidate,
            RANK() OVER(ORDER BY ROUND(SUM(PTS),3) DESC) AS rnk
        FROM cte
        GROUP BY candidate
    )

SELECT candidate
FROM cte_2
WHERE rnk = 1;
