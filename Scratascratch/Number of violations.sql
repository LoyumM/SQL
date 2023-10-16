SELECT EXTRACT(year FROM inspection_date) AS year,
    COUNT(violation_id) AS n_inspection
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
    AND violation_id IS NOT NULL
GROUP BY 1
ORDER BY 1;