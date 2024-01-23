SET @n =1;

WITH
    CTE
    AS
    (
        SELECT task_id, Start_date, End_date,
            LAG(End_date) over(ORDER BY Start_date) AS lag_date
        FROM Projects
    )

SELECT x.mindate, x.maxdate
FROM (
SELECT
        MIN(Start_date) AS mindate,
        MAX(End_date) AS maxdate,
        CASE 
        WHEN DATEDIFF(End_date, Start_date) =1
            AND (lag_date = start_date OR lag_date IS NULL) 
        THEN @n:=@n 
    ELSE @n:=@n+1 
    END AS val
    FROM CTE
    GROUP BY val
    ORDER BY COUNT(val), MIN(start_date)) x