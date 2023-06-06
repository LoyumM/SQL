WITH
    cte
    AS
    (
        SELECT
            card_name,
            issued_amount,
            ROW_NUMBER() OVER 
      (PARTITION BY card_name 
      ORDER BY issue_year, issue_month) AS first_month
        FROM monthly_cards_issued
    )

SELECT card_name, issued_amount
FROM cte
WHERE first_month = 1
ORDER BY issued_amount DESC;