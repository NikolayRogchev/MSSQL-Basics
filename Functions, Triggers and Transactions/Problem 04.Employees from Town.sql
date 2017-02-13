CREATE PROC usp_GetEmployeesFromTown (@townName VARCHAR(50))
AS
SELECT e.FirstName, e.LastName FROM Employees as e
JOIN Addresses AS adr
ON e.AddressID = adr.AddressID
JOIN Towns AS t
ON adr.TownID = t.TownID
WHERE t.Name = @townName
