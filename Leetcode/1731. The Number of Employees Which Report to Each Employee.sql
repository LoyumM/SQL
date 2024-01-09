-- Write your MySQL query statement below
With
    CTE
    AS
    
    (
        SELECT reports_to,
            COUNT(*) AS reports_count,
            ROUND(AVG(age),0) AS average_age
        FROM Employees
        WHERE reports_to IS NOT NULL
        GROUP BY reports_to
    )


SELECT c.reports_to AS employee_id, e.name, reports_count, average_age
FROM CTE c
    LEFT JOIN Employees e
    ON c.reports_to = e.employee_id
ORDER BY 1;