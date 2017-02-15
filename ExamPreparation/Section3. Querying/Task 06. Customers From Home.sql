SELECT c.CustomerID, c.FirstName + ' ' + c.LastName AS FullName, towns.TownName FROM Airports AS a
  JOIN Flights AS f
    ON f.OriginAirportID = a.AirportID
  JOIN Tickets as t
	ON t.FlightID = f.FlightID
  JOIN Customers as c
    ON c.CustomerID = t.CustomerID
  JOIN Towns AS towns
    ON c.HomeTownID = towns.TownID
WHERE f.Status = 'Departing' AND c.HomeTownID = a.TownID