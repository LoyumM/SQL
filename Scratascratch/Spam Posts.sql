SELECT post_date,
    SUM(CASE WHEN
        post_keywords LIKE '%spam%' 
        THEN 1 
        ELSE 0 
        END)*100/count(post_keywords) AS spam_share
FROM facebook_posts a
    JOIN facebook_post_views b
    on a.post_id = b.post_id
GROUP BY 1;