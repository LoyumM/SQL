SELECT user_id
FROM emails JOIN texts
  ON emails.email_id = texts.email_id
WHERE signup_action = 'Confirmed' 
  AND (DATE_PART('day', action_date) - DATE_PART('day', signup_date)) = 1;