with
    cte
    as
    (
        select worker_ref_id,
            sum(bonus) as tot_bonus
        from sf_bonus
        group by 1
    )

select employee_title, sex,
    avg(salary + tot_bonus) as avg_sal
from sf_employee e
    inner join cte c
    on e.id = c.worker_ref_id
group by 1,2;