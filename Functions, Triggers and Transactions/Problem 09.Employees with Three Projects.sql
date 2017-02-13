CREATE PROCEDURE usp_AssignProject(@employeeID INT, @projectID INT)
AS
BEGIN
	DECLARE @projectsCount INT = (SELECT COUNT(*) FROM EmployeesProjects 
		WHERE EmployeeID = @employeeID);
	BEGIN TRANSACTION
		INSERT INTO EmployeesProjects VALUES(@employeeID, @projectID)
		IF(@projectsCount > 3)
		BEGIN
			RAISERROR('The employee has too many projects!', 16, 1);
			ROLLBACK;
		END
		ELSE
			COMMIT
END