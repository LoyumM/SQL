/*
Enter your query here.
*/

SELECT name
FROM Students s
    JOIN Friends f ON s.id = f.id
    JOIN Packages p ON f.id = p.id
    JOIN Packages pf ON f.friend_id = pf.id
WHERE p.salary < pf.salary
ORDER BY pf.salary