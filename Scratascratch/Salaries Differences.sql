with
    temp
    AS
    
    (
        select department, max(salary) as salary
        from db_employee as e
            join db_dept as d
            on d.id = e.department_id
        where d.department in ('marketing', 'engineering')
        group by department
    )

select abs(max(salary) - min(salary)) as diff
from temp