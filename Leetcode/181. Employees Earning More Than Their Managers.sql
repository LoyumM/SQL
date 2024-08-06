SELECT e.name AS Employee
FROM Employee e
LEFT JOIN Employee m
    ON e.managerId = m.id
WHERE e.salary > m.salary
