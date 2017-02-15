SELECT DISTINCT c.CustomerID, c.FirstName + ' ' + c.LastName AS FullName, 2016 - DATEPART(YEAR, c.DateOfBirth) AS Age FROM Customers AS c
	JOIN Tickets AS t
	ON c.CustomerID = t.CustomerID
	JOIN Flights AS f
	ON f.FlightID = t.FlightID
WHERE f.Status = 'Arrived' AND 2016 - DATEPART(YEAR, c.DateOfBirth) < 21
ORDER BY Age DESC, c.CustomerID