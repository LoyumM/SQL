-- Write your PostgreSQL query statement below
SELECT id
FROM(SELECT *,
        LAG(temperature, 1) OVER(ORDER BY recorddate) as yesterday_temp
    FROM Weather) e
WHERE temperature > yesterday_temp;