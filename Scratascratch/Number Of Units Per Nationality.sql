SELECT nationality, 
    COUNT(DISTINCT unit_id) as total_apartment
FROM airbnb_units u 
    JOIN airbnb_hosts h
    ON u.host_id = h.host_id
WHERE age < 30
    AND unit_type = 'Apartment'
GROUP BY 1
ORDER BY 2 DESC;