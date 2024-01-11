WITH cte AS(
    SELECT *, 
    LAG(num,1) OVER(ORDER BY id) AS num1,
    LAG(num, 2) OVER(ORDER BY id) as num2
    FROM Logs)

SELECT DISTINCT num AS ConsecutiveNums
FROM cte
WHERE num = num1
    AND num1 = num2;