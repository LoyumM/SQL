WITH
  cte
  AS
  (
    SELECT
      ROW_NUMBER() OVER (
      PARTITION BY company_id, title, description 
    ) AS dups
    FROM job_listings
  )

SELECT COUNT(*) AS co_w_duplicate_jobs
FROM cte
WHERE dups > 1;