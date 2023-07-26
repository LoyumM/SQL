SELECT
    title,
    budget,
    CEILING(SUM(salary * ((end_date - start_date)::decimal / 365))) AS prorated_employee_expense
FROM
    linkedin_projects AS p JOIN linkedin_emp_projects AS ep ON p.id = ep.project_id JOIN linkedin_employees AS e ON ep.emp_id = e.id
GROUP BY
    title,
    budget
HAVING
    budget < CEILING(SUM(salary * ((end_date - start_date)::decimal / 365)))
ORDER BY
    title ASC;