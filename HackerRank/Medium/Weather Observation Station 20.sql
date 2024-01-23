/*
Enter your query here.
*/

WITH
    nrows
    as
    (
        SELECT COUNT(*) as num_rows
        FROM station
    )

SELECT ROUND(AVG(LAT_N),4)
FROM
    (
SELECT
        LAT_N,
        ROW_NUMBER() OVER(ORDER BY LAT_N ASC) AS rn
    FROM
        STATION
) AS t1 , nrows
WHERE
    t1.rn IN (FLOOR((nrows.num_rows+1)/2), CEIL((nrows.num_rows+1)/2));