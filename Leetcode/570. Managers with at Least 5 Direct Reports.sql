-- Write your MySQL query statement below
WITH
    Reports
    AS

    (
        SELECT managerId, COUNT(*) AS employees
        FROM Employee
        GROUP BY managerId
    )

SELECT name
FROM Employee m LEFT JOIN Reports r
    ON m.id = r.managerId
WHERE employees >= 5;



-- Write your MySQL query statement below
SELECT name
FROM Employee
WHERE id IN 
    (SELECT managerId
FROM Employee
GROUP BY managerId
HAVING COUNT(managerId) >=5 );
