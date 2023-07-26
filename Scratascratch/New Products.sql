WITH
    CTE
    AS
    
    (
        SELECT COUNT(DISTINCT product_name) AS cnt , year, company_name,
            LAG(COUNT(DISTINCT product_name)) OVER (PARTITION BY company_name 
    ORDER BY company_name) AS prev
        FROM car_launches
        GROUP BY year, company_name
        ORDER BY company_name, year ASC
    )

SELECT company_name, cnt - prev AS net_products
FROM cte
WHERE year = 2020