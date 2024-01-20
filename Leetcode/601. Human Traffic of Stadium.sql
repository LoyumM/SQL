WITH
    cte
    AS
    
    (
        SELECT id,
            visit_date,
            people,
            ROW_NUMBER() OVER(ORDER BY id) AS n,
            id - ROW_NUMBER() OVER(ORDER BY id) AS rn
        FROM stadium
        WHERE people > 99
    )

SELECT
    id,
    visit_date,
    people
FROM cte
WHERE rn IN (
    SELECT rn
FROM cte
GROUP BY rn
HAVING COUNT(*) >= 3
    );