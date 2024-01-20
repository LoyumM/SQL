SELECT DATE_FORMAT(created_at, '%Y-%m') AS ym,
    ROUND((SUM(value) - LAG(SUM(value)) OVER ())
        /LAG(SUM(value)) OVER () * 100,2) AS revenue_diff_pct
FROM sf_transactions
GROUP BY 1
ORDER BY 1 ASC;