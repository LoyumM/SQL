WITH
    dec_2020
    AS
    (
        SELECT DISTINCT account_id,
            user_id
        FROM sf_events
        WHERE EXTRACT(MONTH
                 FROM date) = 12
            AND EXTRACT(YEAR
                 FROM date) = 2020
    ),
    jan_2021
    AS
    (
        SELECT DISTINCT account_id,
            user_id
        FROM sf_events
        WHERE EXTRACT(MONTH
                 FROM date) = 1
            AND EXTRACT(YEAR
                 FROM date) = 2021
    ),
    max_date
    AS
    (
        SELECT user_id,
            MAX(Date) AS max_date
        FROM sf_events
        GROUP BY user_id
    ),
    retention_dec_2020
    AS
    (
        SELECT account_id,
            SUM(CASE
                  WHEN max_date > '2020-12-31' THEN 1.0
                  ELSE 0
              END) / COUNT(*) * 100.0 AS retention_dec
        FROM dec_2020
            JOIN max_date ON dec_2020.user_id = max_date.user_id
        GROUP BY account_id
    ),
    retention_jan_2021
    AS
    (
        SELECT account_id,
            SUM(CASE
                  WHEN max_date > '2021-01-31' THEN 1.0
                  ELSE 0
              END) / COUNT(*) * 100.0 AS retention_jan
        FROM jan_2021
            JOIN max_date ON jan_2021.user_id = max_date.user_id
        GROUP BY account_id
    )
SELECT retention_jan_2021.account_id,
    retention_jan / retention_dec AS retention
FROM retention_jan_2021
    INNER JOIN retention_dec_2020 ON retention_jan_2021.account_id = retention_dec_2020.account_id