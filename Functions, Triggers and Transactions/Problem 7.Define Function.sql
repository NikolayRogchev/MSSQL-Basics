CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(20), @word VARCHAR(20))
RETURNS BIT
BEGIN
	DECLARE @result BIT = 1;
	DECLARE @counter int = 1;
	WHILE(@counter <= LEN(@word))
	BEGIN
		DECLARE @currentChar CHAR = SUBSTRING(@word, @counter, 1);
		DECLARE @resultIndex INT = CHARINDEX(@currentChar, @setOfLetters, 1);
		IF(@resultIndex	< 1)
			BEGIN
				SET @result = 0;
				BREAK;
			END
		set @counter += 1;
	END
	RETURN @result;
END

PRINT dbo.ufn_IsWordComprised ('oistmiahf', 'halves')