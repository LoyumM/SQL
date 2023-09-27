WITH
    cte
    AS
    
    (
        SELECT from_user,
            COUNT(*) as total_email
        FROM google_gmail_emails
        GROUP BY from_user
    )

SELECT *,
    ROW_NUMBER() OVER (ORDER BY total_email DESC, from_user) as row_number
FROM cte;