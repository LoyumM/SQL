SELECT ROUND(1.0*COUNT(text_id)/(SELECT COUNT(email_id)
    FROM emails),2) as confirm_rate
FROM texts
WHERE signup_action='Confirmed';