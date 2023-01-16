SELECT DATE_PART('month', submit_date) AS mnth,
  product_id,
  ROUND(AVG(stars),2) as avg_stars
FROM reviews
GROUP BY product_id, mnth
ORDER BY mnth, product_id;