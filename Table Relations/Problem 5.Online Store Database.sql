DROP TABLE Orders
DROP TABLE Customers
DROP TABLE Cities
DROP TABLE Items
DROP TABLE ItemTypes
DROP TABLE OrderItems


CREATE TABLE Orders (
OrderID INT PRIMARY KEY IDENTITY,
CustomerID INT NOT NULL
)
CREATE TABLE Items (
ItemID INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
ItemTypeID INT NOT NULL
)
CREATE TABLE OrderItems (
OrderID INT NOT NULL,
ItemID INT NOT NULL
)
CREATE TABLE ItemTypes (
ItemTypeID INT PRIMARY KEY,
Name VARCHAR(50) NOT NULL
)

--Relationship many-to-many between Orders and Items
ALTER TABLE OrderItems
ADD CONSTRAINT fk_OrderItems_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
ALTER TABLE OrderItems
ADD CONSTRAINT fk_OrderItems_Items FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
ALTER TABLE OrderItems
ADD CONSTRAINT pk_OrderItems PRIMARY KEY (OrderID, ItemID)

--Relationship one-to-many between ItemTypes and Items
ALTER TABLE Items
ADD CONSTRAINT fk_Items_ItemTypes FOREIGN KEY (ItemTypeID) REFERENCES ItemTypes(ItemTypeID)


CREATE TABLE Customers (
CustomerID INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
Birthday DATE,
CityID INT NOT NULL
)

--Relationship one-to-many between Customers and Orders
ALTER TABLE Orders
ADD CONSTRAINT fk_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)

CREATE TABLE Cities (
CityID INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL
)

--Relationship one-to-many between Cities and Customers
ALTER TABLE Customers
ADD CONSTRAINT fk_Customers_Cities FOREIGN KEY (CityID) REFERENCES Cities(CityID)