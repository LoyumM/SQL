-- Assume you're given a table with information on Amazon customers and their spending on products in different categories, 
-- write a query to identify the top two highest-grossing products within each category in the year 2022. The output should 
-- include the category, product, and total spend.

SELECT category, product, total_spend
FROM(SELECT category, product, SUM(spend) AS total_spend,
        ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS rank
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY category, product) AS temp
WHERE rank < 3;