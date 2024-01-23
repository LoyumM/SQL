SELECT SUM(CASE 
    WHEN status = 'open' 
    THEN 1 
    ELSE 0 
    END)*1.0/COUNT(*) AS active_user_share
FROM fb_active_users
WHERE country = 'USA';