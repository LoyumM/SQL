WITH
    all_details
    AS
    (
                    SELECT user1,
                user2
            FROM facebook_friends
        UNION
            SELECT user2 AS user1,
                user1 AS user2
            FROM facebook_friends
    )

SELECT user1,
    COUNT(*)*1.0 /(SELECT COUNT(DISTINCT user1)
    FROM all_details)*100 AS popularity_percent
FROM all_details
GROUP BY 1
ORDER BY 1;