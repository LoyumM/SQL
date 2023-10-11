WITH
    cte
    AS
    
    (
        SELECT id_guest, SUM(n_messages) AS total_messages
        FROM airbnb_contacts
        GROUP BY id_guest
        ORDER BY total_messages DESC
    )

SELECT DENSE_RANK() OVER(ORDER BY total_messages DESC) AS rank,
    id_guest,
    total_messages
FROM cte;