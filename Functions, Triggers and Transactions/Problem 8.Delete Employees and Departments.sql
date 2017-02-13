begin transaction 

ALTER TABLE Departments
ALTER COLUMN ManagerID INT NULL

ALTER TABLE Departments
DROP CONSTRAINT FK_Departments_Employees

ALTER TABLE EmployeesProjects
DROP CONSTRAINT FK_EmployeesProjects_Employees

ALTER TABLE Employees
DROP CONSTRAINT FK_Employees_Employees

DELETE FROM Employees
WHERE DepartmentID IN (7, 8)

DELETE FROM Departments
WHERE DepartmentID IN (7, 8)

COMMIT