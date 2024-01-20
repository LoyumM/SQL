-- General solution
WITH
    running_time
    AS
    (
        SELECT
            server_id,
            session_status,
            status_time AS start_time,
            LEAD(status_time) OVER (
      PARTITION BY server_id
      ORDER BY status_time) AS stop_time
        FROM server_utilization
    )
-- The function JUSTIFY_HOURS converts any value above 24 hours into units of full days.
SELECT
    DATE_PART('days', JUSTIFY_HOURS(SUM(stop_time - start_time))) AS total_uptime_days
FROM running_time
WHERE session_status = 'start'
    AND stop_time IS NOT NULL;

-- Solution that works when number of days is less than a month
SELECT SUM(CASE
  WHEN session_status = 'start' THEN -(EXTRACT(DAY from status_time)) 
  ELSE EXTRACT(DAY from status_time) 
  END) as total_uptime_days
FROM server_utilization