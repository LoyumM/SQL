SELECT sender_id, COUNT(sender_id) AS message_count
FROM messages
WHERE DATE_PART('month', sent_date) = 08
  AND DATE_PART('year', sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;