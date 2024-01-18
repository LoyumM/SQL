WITH
    all_details
    AS
    
    (
        SELECT e.id AS id, e.name AS Employee, d.name AS Department, salary,
            DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY salary DESC) AS rnk
        FROM Employee e LEFT JOIN Department d
            ON e.departmentId = d.id
    )

SELECT Department, Employee, salary AS Salary
FROM all_details
WHERE rnk = 1;