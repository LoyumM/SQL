SELECT app_id, 
  ROUND(100.0 * 
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END)/ 
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END),2) AS ctr
FROM events
WHERE timestamp BETWEEN '2022-01-01 00:00:00' AND '2022-12-31 23:59:59'
GROUP BY app_id;