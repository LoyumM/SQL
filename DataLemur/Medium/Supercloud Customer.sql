SELECT customer_id
FROM customer_contracts a
    JOIN products b
    ON a.product_id = b.product_id
GROUP BY customer_id
HAVING COUNT(DISTINCT product_category) = 
       (SELECT
    COUNT(DISTINCT product_category)
FROM products);