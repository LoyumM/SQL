
WITH
    cte
    AS

    (
        SELECT
            date,
            SUM(CASE
        WHEN paying_customer = 'no' THEN downloads
        ELSE 0
    END) AS non_paying,
            SUM(CASE
            WHEN paying_customer = 'yes' THEN downloads
            ELSE 0
        END) AS paying
        FROM ms_download_facts f
            LEFT JOIN ms_user_dimension u ON f.user_id = u.user_id
            LEFT JOIN ms_acc_dimension a ON u.acc_id = a.acc_id
        GROUP BY date
        ORDER BY date
    )

SELECT *
FROM cte
WHERE non_paying > paying;