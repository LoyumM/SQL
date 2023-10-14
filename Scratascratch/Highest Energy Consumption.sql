WITH
    fb_energy
    AS
    
    (
                            SELECT *
            FROM fb_eu_energy eu
        UNION ALL
            SELECT *
            FROM fb_asia_energy asia
        UNION ALL
            SELECT *
            FROM fb_na_energy na
    ),
    energy_by_date
    AS
    
    (
        SELECT date, SUM(consumption) AS total_energy
        FROM fb_energy
        GROUP BY date
        ORDER BY date
    )

SELECT date, total_energy
FROM energy_by_date
WHERE total_energy = (SELECT MAX(total_energy)
FROM energy_by_date);