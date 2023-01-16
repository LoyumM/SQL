SELECT COUNT(*) as dup_companies
FROM (
  SELECT company_id, title
  FROM job_listings
  GROUP BY company_id, title
  HAVING COUNT(*) > 1
) ti;