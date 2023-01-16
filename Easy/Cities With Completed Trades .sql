SELECT city, 
  COUNT(status) AS total_orders
FROM trades
LEFT JOIN users 
  ON trades.user_id = users.user_id
WHERE status = 'Completed'
GROUP BY city
ORDER BY total_orders DESC
LIMIT 3;