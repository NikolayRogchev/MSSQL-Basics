CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY)
RETURNS VARCHAR(10)
BEGIN 
	DECLARE @result VARCHAR(10);
	IF(@salary < 30000)
	BEGIN
		SET @result = 'Low';
	END
	ELSE IF(@salary <= 50000)
	BEGIN
		SET @result = 'Average';
	END
	ELSE
	BEGIN
		SET @result = 'High';
	END
	RETURN @result;
END
 