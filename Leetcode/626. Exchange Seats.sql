-- Write your MySQL query statement below
WITH
    cte
    as

    (
        SELECT *,
            LAG(student,1) OVER(ORDER BY id) AS lag,
            LEAD(student,1) OVER(ORDER BY id) as lead
        FROM seat
    )

SELECT id,
    CASE
    WHEN id % 2 != 0 AND id = (SELECT COUNT(id)
        FROM seat) THEN student
    WHEN id % 2 = 0 THEN lag
    WHEN id % 2 != 0 THEN lead
END AS student
FROM cte

