WITH
    all_details
    AS
    
    (
        SELECT merchant_id,
            credit_card_id,
            amount,
            EXTRACT(
       -- Epoch returns the time in seconds, dividing by 60 makes it minutes
        EPOCH FROM 
          transaction_timestamp - LAG(transaction_timestamp) OVER(
            PARTITION BY merchant_id, 
            credit_card_id, 
            amount 
            ORDER BY transaction_timestamp))/60 AS time_diff
        FROM transactions
    )

SELECT COUNT(*) AS payment_count
FROM all_details
WHERE time_diff <= 10.0;