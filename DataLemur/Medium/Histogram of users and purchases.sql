WITH
    cte
    AS
    
    (
        SELECT MAX(transaction_date) AS recent_date,
            user_id
        FROM user_transactions
        GROUP BY user_id
    )

SELECT transaction_date, a.user_id,
    COUNT(product_id) AS purchase_count
FROM user_transactions a
    JOIN cte on a.user_id = cte.user_id
WHERE transaction_date = recent_date
GROUP BY transaction_date, a.user_id
ORDER BY transaction_date;