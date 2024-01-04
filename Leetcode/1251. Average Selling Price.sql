-- Write your MySQL query statement below
SELECT p.product_id,
    ROUND(SUM(units * price)/SUM(units),2) AS average_price
FROM Prices p 
    CROSS JOIN UnitsSold u
WHERE p.product_id = u.product_id
    AND purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id;