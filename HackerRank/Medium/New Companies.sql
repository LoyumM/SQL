/*
Enter your query here.
*/

SELECT c.company_code, c.founder,
    COUNT(DISTINCT lm.lead_manager_code),
    COUNT(DISTINCT sm.senior_manager_code),
    COUNT(DISTINCT m.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM company c
    JOIN lead_manager lm ON lm.company_code = c.company_code
    JOIN senior_manager sm ON sm.lead_manager_code = lm.lead_manager_code
    JOIN manager m ON m.senior_manager_code = sm.senior_manager_code
    JOIN employee e ON e.manager_code = m.manager_code
GROUP BY 1,2
ORDER BY 1;