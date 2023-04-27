-- Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

SELECT user_id, spend, transaction_date
FROM (SELECT *,
        ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS trans
    FROM transactions) AS temp
WHERE trans = 3;