SELECT
    language,
    COUNT(DISTINCT CASE WHEN device IN ('macbook pro', 'iphone 5s', 'ipad air') 
        THEN u.user_id 
        ELSE NULL 
        END) AS n_apple_users,
    count(DISTINCT u.user_id) AS n_total_users
FROM
    playbook_users u
    INNER JOIN
    playbook_events e
    ON
    u.user_id = e.user_id
GROUP BY
    1
ORDER BY
    3 DESC