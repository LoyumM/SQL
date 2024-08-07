-- Write your MySQL query statement below
SELECT name as Customers
FROM customers c 
LEFT JOIN Orders o
    ON c.id = o.customerId
WHERE o.id IS NULL;