-- First attempt

WITH
    all_details
    AS

    (
        SELECT client_id, event_type,
            CASE
            WHEN event_type IN ('video call received', 'video call sent', 'voice call received', 'voice call sent') THEN 1
        ELSE 0
        END AS calls
        FROM fact_events
    )

SELECT
    client_id
FROM
    all_details
GROUP BY
    client_id
HAVING
    (1.0 * SUM(calls) / COUNT(*)) >= 0.5;


-- Second attempt

WITH
    all_details
    AS
    
    (
        SELECT user_id, client_id, event_type,
            CASE
            WHEN event_type IN ('video call received', 'video call sent', 'voice call received', 'voice call sent') THEN 1
        ELSE 0
        END AS calls
        FROM fact_events
    ),
    client_call_details
    AS
    
    (
        SELECT client_id,
            COUNT(DISTINCT user_id) AS call_user
        FROM all_details
        WHERE user_id IN(
        SELECT user_id
        FROM all_details
        GROUP BY user_id
        HAVING 1.0 * SUM(calls) / COUNT(*) >= 0.5)
        GROUP BY client_id
    )

SELECT client_id
FROM client_call_details
WHERE call_user = (
SELECT MAX(call_user)
FROM client_call_details)
