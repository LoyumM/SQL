-- Write your MySQL query statement below
SELECT employee_id, 
CASE 
    WHEN employee_id % 2 != 0 
    AND name NOT LIKE 'M%' THEN salary
    ELSE 0
end AS bonus
FROM employees 
ORDER BY employee_id;