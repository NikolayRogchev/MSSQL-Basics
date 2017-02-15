CREATE PROCEDURE usp_SubmitReview(@customerID INT, @reviewContent VARCHAR(255), @reviewGrade INT, @airlineName VARCHAR(50))
AS
BEGIN
	IF(@airlineName NOT IN (SELECT AirlineName FROM Airlines))
		BEGIN
			RAISERROR('Airline does not exist.', 16, 1);
			RETURN;
		END
	ELSE
		BEGIN
			DECLARE @reviewID INT = 
				CASE
					WHEN (SELECT MAX(ReviewID) FROM CustomerReviews) IS NULL THEN 1
					ELSE (SELECT MAX(ReviewID) FROM CustomerReviews) + 1
				END;
			DECLARE @airlineID INT = (SELECT AirlineID FROM Airlines WHERE AirlineName = @airlineName);
			INSERT INTO CustomerReviews VALUES (@reviewID, @reviewContent, @reviewGrade, @airlineID, @customerID);
		END
END