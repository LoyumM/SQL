-- Write your MySQL query statement below
WITH
    all_details
    AS
    
    (
        SELECT *,
            COUNT(*) OVER(PARTITION BY tiv_2015) AS tiv_count,
            COUNT(*) OVER (PARTITION BY CONCAT(lat, lon)) AS add_count
        FROM Insurance
    )

SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM all_details
WHERE tiv_count > 1
    AND add_count = 1;