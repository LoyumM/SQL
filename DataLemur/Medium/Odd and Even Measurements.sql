WITH
    cte
    AS
    (
        SELECT
            measurement_id,
            measurement_value,
            measurement_time,
            DATE(measurement_time) as date,
            ROW_NUMBER() OVER
  (PARTITION BY DATE(measurement_time) ORDER BY measurement_time ASC) AS measurement_rank
        FROM measurements
    )
SELECT
    date AS measurement_day,
    SUM(CASE WHEN MOD(measurement_rank,2) = 1 THEN measurement_value ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN MOD(measurement_rank,2) = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM cte
GROUP BY date;