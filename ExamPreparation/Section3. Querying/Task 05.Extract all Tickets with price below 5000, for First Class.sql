SELECT t.TicketID, a.AirportName, c.FirstName + ' ' + c.LastName AS CustomerName FROM Tickets as t
JOIN Flights as f
  ON t.FlightID = f.FlightID
JOIN Airports AS a
  ON f.DestinationAirportID = a.AirportID
JOIN Customers as c
  ON t.CustomerID = c.CustomerID
WHERE t.Price < 5000 AND Class = 'First'