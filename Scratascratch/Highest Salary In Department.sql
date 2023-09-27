with
    cte
    as
    
    (
        select *,
            rank() over(partition by department order by salary desc)
        from employee
    )

select department, first_name, salary
from cte
where rank = 1
order by salary desc;
