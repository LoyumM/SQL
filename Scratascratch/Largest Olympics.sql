WITH
    cte
    AS
    (
        SELECT games,
            count(DISTINCT id) AS athletes_count
        FROM olympics_athletes_events
        GROUP BY games
        ORDER BY athletes_count DESC
    )
SELECT games, athletes_count
FROM cte
WHERE athletes_count =
    (SELECT max(athletes_count)
FROM cte);