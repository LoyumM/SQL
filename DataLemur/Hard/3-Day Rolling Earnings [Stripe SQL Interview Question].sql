SELECT
    user_id,
    transaction_date,
    SUM(SUM(amount)) OVER(
    PARTITION BY user_id 
    ORDER BY transaction_date 
    RANGE BETWEEN INTERVAL '2 days'
PRECEDING 
      AND CURRENT ROW) AS rolling_earnings_3d
FROM user_transactions
GROUP BY user_id, transaction_date;