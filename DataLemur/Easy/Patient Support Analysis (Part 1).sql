SELECT COUNT(member) AS total
FROM (SELECT COUNT(case_id) AS member
      FROM callers
      GROUP BY policy_holder_id
      HAVING COUNT(case_id)>=3
) AS temp_table;