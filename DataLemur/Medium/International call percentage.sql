WITH
    cte
    AS
    
    (
        SELECT
            COUNT(*) AS total_calls,
            SUM(CASE WHEN caller.country_id != receiver.country_id 
    THEN 1 
    ELSE NULL END) AS international_calls
        FROM phone_calls AS calls
            LEFT JOIN phone_info AS caller
            ON calls.caller_id = caller.caller_id
            LEFT JOIN phone_info AS receiver
            ON calls.receiver_id = receiver.caller_id
    )

SELECT ROUND(100.0*international_calls/total_calls,1) AS calls_percent
FROM cte