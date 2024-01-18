SELECT t.Request_at AS 'Day',
    ROUND(
        SUM(CASE  
            WHEN t.Status IN ('cancelled_by_driver','cancelled_by_client') THEN 1 
            ELSE 0 END) / COUNT(*), 2) AS 'Cancellation Rate'
FROM Trips t
WHERE t.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
    AND t.Request_at <= '2013-10-03'
    AND t.Client_Id IN (
        SELECT Users_Id
    FROM Users u
    WHERE Banned = 'No')
    AND t.Driver_Id IN (
        SELECT Users_Id
    FROM Users u
    WHERE Banned = 'No')
GROUP BY t.Request_at;