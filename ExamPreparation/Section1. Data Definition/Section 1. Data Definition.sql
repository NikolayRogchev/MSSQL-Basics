CREATE TABLE Flights (
FlightID INT PRIMARY KEY,
DepartureTime DATETIME NOT NULL,
ArrivalTime DATETIME NOT NULL,
[Status] VARCHAR(9) CHECK([Status] IN ('Departing', 'Delayed', 'Arrived', 'Cancelled')),
OriginAirportID INT NOT NULL,
DestinationAirportID INT NOT NULL,
AirlineID INT NOT NULL
)

CREATE TABLE Tickets (
TicketID INT PRIMARY KEY,
Price DECIMAL(8, 2) NOT NULL,
Class VARCHAR(6) CHECK([Class] IN ('First', 'Second', 'Third')),
Seat VARCHAR(5) NOT NULL,
CustomerID INT NOT NULL,
FlightID INT NOT NULL
)

ALTER TABLE Flights
ADD CONSTRAINT fk_Flights_Origin_Airports FOREIGN KEY (OriginAirportID) REFERENCES Airports(AirportID)

ALTER TABLE Flights
ADD CONSTRAINT fk_Flights_Destination_Airports FOREIGN KEY (DestinationAirportID) REFERENCES Airports(AirportID)

ALTER TABLE Flights
ADD CONSTRAINT fk_Flights_Airlines FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)

ALTER TABLE Tickets
ADD CONSTRAINT fk_Tickets_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)

ALTER TABLE Tickets
ADD CONSTRAINT fk_Tickets_Flights FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)