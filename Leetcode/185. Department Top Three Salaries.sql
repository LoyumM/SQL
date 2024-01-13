-- # Write your MySQL query statement below
WITH
    all_details
    AS
    
    (
        SELECT e.id, e.name AS Employee, departmentId, salary AS Salary, d.name AS department,
            DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk
        FROM Employee e LEFT JOIN Department d
            ON e.departmentId = d.id
    )

SELECT Department, Employee, Salary
FROM all_details
WHERE rnk <=3
ORDER BY 1, 3 DESC;