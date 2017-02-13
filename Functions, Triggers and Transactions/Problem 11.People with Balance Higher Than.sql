CREATE PROC usp_GetHoldersWithBalanceHigherThan(@targetBalance MONEY)
AS
BEGIN
	SELECT 
	FirstName
	,LastName
	FROM 
		(SELECT a.Id, SUM(a.Balance) as TotalBalance FROM Accounts as a
			GROUP BY a.Id
			HAVING SUM(a.Balance) > @targetBalance) as tab1
	JOIN AccountHolders as ah
	on tab1.Id = ah.Id
END

