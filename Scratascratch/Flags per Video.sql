SELECT COUNT(DISTINCT(CONCAT(user_firstname,' ',user_lastname))) AS unique_user,
    video_id
FROM user_flags
WHERE flag_id IS NOT NULL
GROUP BY video_id