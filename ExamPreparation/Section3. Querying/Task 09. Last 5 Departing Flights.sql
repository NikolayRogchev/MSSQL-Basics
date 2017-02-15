SELECT TOP 5 f.FlightID, 
	f.DepartureTime, 
	f.ArrivalTime, origin.AirportName AS Origin, 
	dest.AirportName AS Destination 
	FROM Flights AS f
JOIN Airports AS origin
ON origin.AirportID = f.OriginAirportID
JOIN Airports AS dest
ON dest.AirportID = f.DestinationAirportID
	WHERE f.Status = 'Departing'
	ORDER BY f.DepartureTime ASC, f.FlightID ASC