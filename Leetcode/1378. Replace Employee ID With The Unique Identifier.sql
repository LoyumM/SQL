-- Write your PostgreSQL query statement below
SELECT unique_id, name
FROM Employees e LEFT JOIN EmployeeUNI u
    ON e.id = u.id;