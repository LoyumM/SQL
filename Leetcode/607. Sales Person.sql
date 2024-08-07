SELECT s.name
FROM salesperson s
WHERE s.name NOT IN
(SELECT  s.name
FROM salesperson s 
LEFT JOIN orders o 
    ON s.sales_id = o.sales_id
LEFT JOIN company c
    ON c.com_id = o.com_id
WHERE c.name = 'RED')