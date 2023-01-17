SELECT ROUND
  (SUM(order_occurrences*item_count*1.0)
  /SUM(order_occurrences),1) AS mean
FROM items_per_order;