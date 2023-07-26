WITH
    cte
    AS
    
    (
        SELECT *,
            created_at - LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at ASC) AS diff
        FROM amazon_transactions
    )

SELECT DISTINCT(user_id)
FROM cte
WHERE diff < 8
ORDER BY user_id;
