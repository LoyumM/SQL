-- Write your MySQL query statement below
SELECT name, bonus
FROM Employee e LEFT JOIN Bonus b
    ON e.empID = b.empId
WHERE bonus < 1000 OR bonus IS NULL;