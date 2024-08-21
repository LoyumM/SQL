--Write your MySQL query statement below
SELECT name, SUM(amount) AS balance
FROM transactions t
LEFT JOIN users u
    ON u.account = t.account
GROUP BY 1
HAVING SUM(amount) > 10000
