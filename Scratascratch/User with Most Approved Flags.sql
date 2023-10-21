WITH
    cte
    AS
    
    (
        SELECT CONCAT(user_firstname,' ', user_lastname) AS full_name,
            DENSE_RANK() OVER (ORDER BY COUNT(DISTINCT video_id) DESC) AS rn
        FROM user_flags u JOIN flag_review f
            ON u.flag_id = f.flag_id
        WHERE reviewed_outcome = 'APPROVED'
        GROUP BY 1
    )

SELECT full_name
FROM cte
WHERE rn = 1;