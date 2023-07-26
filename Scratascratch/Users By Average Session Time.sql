with
    all_user_sessions
    as
    (
        SELECT t1.user_id, t1.timestamp::date as date,
            min(t2.timestamp::TIMESTAMP) - max(t1.timestamp::TIMESTAMP) as session_duration
        FROM facebook_web_log t1
            JOIN facebook_web_log t2 ON t1.user_id = t2.user_id
        WHERE t1.action = 'page_load'
            AND t2.action = 'page_exit'
            AND t2.timestamp > t1.timestamp
        GROUP BY 1, 2
    )
SELECT user_id, avg(session_duration)
FROM all_user_sessions
GROUP BY user_id;