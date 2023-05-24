with
    cte
    as
    
    (
        SELECT user_id, COUNT(*) as tweet_bucket
        FROM tweets
        WHERE EXTRACT(year from tweet_date)=2022
        GROUP BY user_id
    )

SELECT tweet_bucket, COUNT(*) as users_num
FROM cte
GROUP BY tweet_bucket