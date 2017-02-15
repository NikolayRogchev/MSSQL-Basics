SELECT TOP 3 c.CustomerID, c.FirstName + ' ' + c.LastName AS FullName, t.Price AS TicketPrice, a.AirportName AS Destination FROM Tickets AS t
	JOIN Flights AS f
	ON t.FlightID = f.FlightID
	JOIN Customers AS c
	ON c.CustomerID = t.CustomerID
	JOIN Airports AS a
	ON f.DestinationAirportID = a.AirportID
WHERE f.Status = 'Delayed'
ORDER BY t.Price DESC, c.CustomerID