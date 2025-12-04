-- Example views for Power BI consumption
CREATE VIEW vw_SalesByDate AS
SELECT Date, SUM(Quantity*UnitPrice) AS Revenue, SUM(Quantity) AS UnitsSold
FROM Sales
GROUP BY Date;

CREATE VIEW vw_ProductPerformance AS
SELECT p.ProductID, p.ProductName, p.Category, SUM(s.Quantity) AS TotalUnits, SUM(s.Quantity*s.UnitPrice) AS TotalRevenue
FROM Sales s JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;