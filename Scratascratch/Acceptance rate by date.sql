WITH
    lst
    AS
    (
        SELECT date,
            action,
            LEAD(action) over (PARTITION BY user_id_sender, user_id_receiver ORDER BY date) AS done
        FROM fb_friend_requests
    )
SELECT date,
    COUNT(done) * 1.0 / COUNT(action) AS percentage_acceptance
FROM lst
WHERE action = 'sent'
GROUP BY date