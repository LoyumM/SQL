-- Assume you're given tables with information on Snapchat users, including their ages and time spent sending and 
-- opening snaps. Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage 
-- of total time spent on these activities grouped by age group. Round the percentage to 2 decimal places in the output.

WITH
    CTE
    AS
    (
        SELECT age_bucket,
            SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS send,
            SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS open
        FROM activities
            INNER JOIN age_breakdown ON
      activities.user_id = age_breakdown.user_id
        GROUP BY age_bucket
    )

SELECT age_bucket,
    ROUND(100.0 * send/(send+open), 2) AS send_perc,
    ROUND(100.0 * open/(send+open), 2) AS open_perc
FROM CTE;