SELECT first_name, target
FROM salesforce_employees
WHERE manager_id = 13
    AND target =
        (SELECT MAX(target)
    FROM salesforce_employees
    WHERE manager_id = 13);