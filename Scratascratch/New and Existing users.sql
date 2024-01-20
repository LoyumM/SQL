-- WITH all_details AS(
--     SELECT 
--         DATE_FORMAT(time_id, "%M") AS month,
--         customer_id,
--         CASE
--             WHEN (customer_id, DATE_FORMAT(time_id, "%M")) IN (
--                 SELECT customer_id, DATE_FORMAT(MIN(time_id), '%M')
--                 FROM fact_events
--                 GROUP BY customer_id
--             ) THEN 'New'
--             ELSE 'Existing'
--         END AS user_status
--     FROM fact_events
--     ORDER BY time_id)

-- SELECT 
--     month, 
--     SUM(CASE WHEN user_status = 'New' THEN 1 ELSE 0 END) AS share_new,
--     SUM(CASE WHEN user_status = 'Existing' THEN 1 ELSE 0 END) AS share_existing,
--     COUNT(*) AS total
-- FROM all_details
-- GROUP BY month;



WITH
    UserStatus
    AS
    (
        SELECT
            user_id,
            MIN(DATE_FORMAT(time_id, '%Y-%m')) AS first_month
        FROM
            fact_events
        GROUP BY
        user_id
    )

SELECT
    DATE_FORMAT(fact_events.time_id, '%Y-%m') AS month,
    SUM(CASE WHEN UserStatus.first_month = DATE_FORMAT(fact_events.time_id, '%Y-%m') THEN 1 ELSE 0 END) / COUNT(*) AS share_new,
    SUM(CASE WHEN UserStatus.first_month < DATE_FORMAT(fact_events.time_id, '%Y-%m') THEN 1 ELSE 0 END) / COUNT(*) AS share_existing
FROM
    fact_events
    JOIN
    UserStatus ON fact_events.user_id = UserStatus.user_id
GROUP BY
    month
ORDER BY
    month;

    
