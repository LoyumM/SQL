WITH
    cte1
    AS
    (
        SELECT EXTRACT(month FROM event_date) as month,
            user_id,
            event_id
        FROM user_actions
        WHERE EXTRACT(month FROM event_date) = 07
    ),
    cte2
    AS
    (
        SELECT EXTRACT(month FROM event_date) as month,
            user_id,
            event_id
        FROM user_actions
        WHERE EXTRACT(month FROM event_date) = 06
    )
SELECT month, COUNT(DISTINCT user_id) AS monthly_active_users
FROM cte1
WHERE user_id IN (SELECT DISTINCT user_id
FROM cte2)
GROUP BY month;
