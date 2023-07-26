SELECT t.worker_title
FROM worker w
    JOIN title t ON w.worker_id = t.worker_ref_id
WHERE w.salary = (
  SELECT MAX(salary)
FROM worker
)