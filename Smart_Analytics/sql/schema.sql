-- Schema for Smart Sales & Inventory Analytics System
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  UnitPrice FLOAT,
  ReorderLevel INT
);

CREATE TABLE Inventory (
  InventoryID INT PRIMARY KEY,
  ProductID INT,
  Warehouse VARCHAR(50),
  Stock INT,
  LastUpdated DATE,
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(100),
  City VARCHAR(50),
  CustomerSince DATE
);

CREATE TABLE Sales (
  SaleID INT PRIMARY KEY,
  Date DATE,
  ProductID INT,
  CustomerID INT,
  Quantity INT,
  UnitPrice FLOAT,
  Region VARCHAR(50),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);