-- Write your PostgreSQL query statement below

SELECT customer_id,
    COUNT(*) AS count_no_trans
FROM Visits v LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
WHERE transaction_id IS NULL
GROUP BY 1;