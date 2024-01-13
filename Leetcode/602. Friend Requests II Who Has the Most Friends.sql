-- # Write your MySQL query statement below
WITH
    cte
    AS

    (
                    SELECT requester_id AS id,
                accept_date
            FROM RequestAccepted
        UNION ALL
            SELECT accepter_id AS id,
                accept_date
            FROM RequestAccepted
    )

SELECT id, COUNT(*) AS num
FROM cte
GROUP BY id
ORDER BY num DESC
LIMIT 1;
