-- 1.The example uses a WHERE clause to show the cases in 'Italy' in March 2020.
--Modify the query to show data from Spain

SELECT name, DAY(whn),
    confirmed, deaths, recovered
FROM covid
WHERE name = 'Spain'
    AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn;