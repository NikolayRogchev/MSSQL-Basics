SELECT top 5 a.AirlineID, a.AirlineName, a.Nationality, MAX(a.Rating) AS Rating FROM Airlines AS a
JOIN Flights as f
ON a.AirlineID = f.AirlineID
GROUP BY a.AirlineID, a.AirlineName, a.Nationality
ORDER BY Rating desc