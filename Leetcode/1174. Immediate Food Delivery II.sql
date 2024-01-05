-- Write your MySQL query statement below
WITH
    all_details
    AS
    
    (
        SELECT *,
            RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS order_list,
            CASE WHEN customer_pref_delivery_date = order_date THEN 1 ELSE 0 END AS immediate
        FROM Delivery
        ORDER BY customer_id
    )

SELECT ROUND(100*SUM(immediate)/COUNT(immediate),2) AS immediate_percentage
FROM all_details
WHERE order_list = 1;