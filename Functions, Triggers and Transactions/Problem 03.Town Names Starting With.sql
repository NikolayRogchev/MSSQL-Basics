CREATE PROC usp_GetTownsStartingWith(@startString VARCHAR(50))
AS
SELECT [Name] FROM Towns
WHERE LEFT([Name], LEN(@startString)) = @startString
