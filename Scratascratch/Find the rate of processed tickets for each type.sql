SELECT type,
    SUM(CASE WHEN processed THEN 1
    ELSE 0 END)*1.0/COUNT(processed) AS rate
FROM facebook_complaints
GROUP BY type;