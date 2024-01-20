WITH
    topSalesProductsInFeb
    AS
    (
        SELECT
            product_id AS id,
            SUM(unit) AS total_units
        FROM orders
        WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
        GROUP BY product_id
        HAVING SUM(unit) >= 100
    )

SELECT
    p.product_name,
    ts.total_units AS unit
FROM products p
    INNER JOIN topSalesProductsInFeb ts ON p.product_id = ts.id;