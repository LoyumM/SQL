with
    cte
    as
    
    (
        select salary,
            dense_rank() over(order by salary desc) as rnk
        from employee
    )
select salary
from cte
where rnk = 2;