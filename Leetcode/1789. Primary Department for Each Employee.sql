-- Write your MySQL query statement below
WITH
    dept
    AS
    
    (
        SELECT employee_id, COUNT(department_id) AS departments
        FROM Employee
        GROUP BY employee_id
    ),
    solution
    AS
    
    (
        SELECT e.employee_id, e.department_id, e.primary_flag, departments,
            CASE 
            WHEN departments = 1 THEN 1
            WHEN departments > 1 AND primary_flag = 'Y' THEN 1
        ELSE 0 END AS bool
        FROM Employee e LEFT JOIN dept d
            ON e.employee_id = d.employee_id
    )

SELECT employee_id, department_id
FROM solution
WHERE bool = 1;

-- easier solution
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
    OR employee_id IN (
        SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(department_id)=1)