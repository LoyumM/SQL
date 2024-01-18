-- # Write your MySQL query statement below
SELECT u.user_id AS buyer_id, u.join_date,
    IFNULL(o.orders_in_2019, 0) AS orders_in_2019
FROM Users u
    LEFT JOIN (
  SELECT buyer_id, COUNT(*) AS orders_in_2019
    FROM Orders
    WHERE YEAR(order_date) = 2019
    GROUP BY buyer_id
) o ON u.user_id = o.buyer_id;