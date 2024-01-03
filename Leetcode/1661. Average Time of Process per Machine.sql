-- With Joins
SELECT a1.machine_id,
    ROUND(AVG(a2.timestamp - a1.timestamp),3) AS processing_time
FROM Activity a1 JOIN Activity a2
    ON a1.process_id = a2.process_id
        AND a1.machine_id = a2.machine_id
        AND a1.timestamp < a2.timestamp
GROUP BY a1.machine_id;

-- With CTE
WITH
    ProcessTimes
    AS
    (
        SELECT
            machine_id,
            process_id,
            SUM(CASE WHEN activity_type = 'end' THEN timestamp ELSE -timestamp END) AS process_time
        FROM Activity
        GROUP BY machine_id, process_id
    )
SELECT
    machine_id,
    ROUND(AVG(process_time), 3) AS processing_time
FROM ProcessTimes
GROUP BY machine_id;