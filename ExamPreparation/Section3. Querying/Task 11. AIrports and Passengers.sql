SELECT a.AirportID,
	a.AirportName,
	Passengers = COUNT(*)  
FROM Airports AS a
	JOIN Flights AS f
	ON a.AirportID = f.OriginAirportID
	JOIN Tickets AS t
	ON f.FlightID = t.FlightID
WHERE f.Status = 'Departing'
GROUP BY a.AirportID, a.AirportName