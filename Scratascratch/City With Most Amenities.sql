WITH
    cte
    AS
    
    (
        SELECT city,
            SUM(ARRAY_LENGTH(STRING_TO_ARRAY(amenities, ','), 1)) AS total_ammenities
        FROM airbnb_search_details
        GROUP BY city
    )

SELECT city
FROM cte
WHERE total_ammenities IN (SELECT MAX(total_ammenities)
FROM cte);
