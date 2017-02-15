BEGIN TRAN

UPDATE Tickets
SET Price *= 1.5
WHERE Tickets.FlightID in	
		(SELECT t.FlightID FROM
			(SELECT top 1 a.AirlineID FROM Airlines as a 
				ORDER BY a.Rating DESC) as al -- return max rate airline
			JOIN Flights AS f
			ON al.AirlineID = f.AirlineID --return all flights of that airline
			JOIN Tickets AS t
			ON t.FlightID = f.FlightID
		) 
ROLLBACK