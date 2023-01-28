SELECT ROUND(100.0*COUNT(case_id)/(SELECT COUNT(case_id) 
    FROM callers),1) AS null_percentage
FROM callers
WHERE call_category IS NULL
    OR call_category ='n/a';