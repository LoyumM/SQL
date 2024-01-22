WITH
    cte
    AS
    (
        SELECT state,
            COUNT(business_id) AS n_businesses
        FROM yelp_business
        WHERE stars = 5
        GROUP BY state
    )
SELECT state, n_businesses
FROM
    (SELECT *,
        RANK() OVER (ORDER BY n_businesses DESC) AS rnk
    FROM cte) a
WHERE rnk <= 5
ORDER BY n_businesses DESC,
    state ASC;