-- # Write your MySQL query statement below
WITH
    cte
    AS
    
    (
        SELECT product_id, new_price
        FROM(
        SELECT product_id, new_price,
                ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS dist
            FROM Products
            WHERE change_date <= '2019-08-16') a
        WHERE dist = 1
    )

SELECT DISTINCT p.product_id, IFNULL(c.new_price,10) AS price
FROM Products p LEFT JOIN cte c
    ON p.product_id = c.product_id