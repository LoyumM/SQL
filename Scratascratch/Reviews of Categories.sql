WITH
    cte
    AS
    (
        SELECT unnest(string_to_array(categories, ';')) AS category,
            review_count
        FROM yelp_business
    )

SELECT category, SUM(review_count) AS total_count
FROM cte
GROUP BY category
ORDER BY total_count DESC;