-- Write your MySQL query statement below
WITH
    cte
    AS
    (
        SELECT *,
            SUM(weight) OVER (ORDER BY turn) AS total_sum
        FROM Queue
        ORDER BY turn
    )

SELECT person_name
FROM cte
WHERE total_sum <= 1000
ORDER BY total_sum DESC
LIMIT 1;