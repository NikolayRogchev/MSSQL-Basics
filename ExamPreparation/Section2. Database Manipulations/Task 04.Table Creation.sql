CREATE TABLE CustomerReviews(
ReviewID INT PRIMARY KEY NOT NULL,
ReviewContent VARCHAR(255) NOT NULL,
ReviewGrade INT CHECK (ReviewGrade between 0 and 10),
AirlineID INT NOT NULL,
CustomerID INT NOT NULL
)
ALTER TABLE CustomerReviews
ADD CONSTRAINT fk_CustomerRev_Airlines FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
ALTER TABLE CustomerReviews
ADD CONSTRAINT fk_CustomerRev_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)

CREATE TABLE CustomerBankAccounts(
AccountID INT PRIMARY KEY NOT NULL,
AccountNumber VARCHAR(10) NOT NULL UNIQUE,
Balance DECIMAL(10, 2) NOT NULL,
CustomerID INT NOT NULL
)
ALTER TABLE CustomerBankAccounts
ADD CONSTRAINT fk_CustBankAccounts_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)