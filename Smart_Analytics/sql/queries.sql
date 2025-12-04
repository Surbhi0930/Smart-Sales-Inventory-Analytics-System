-- Important queries for analysis
-- 1. Sales revenue by region
SELECT Region, SUM(Quantity*UnitPrice) AS TotalRevenue
FROM Sales
GROUP BY Region
ORDER BY TotalRevenue DESC;

-- 2. Top 5 products by revenue
SELECT p.ProductName, SUM(s.Quantity * s.UnitPrice) AS Revenue
FROM Sales s JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC
LIMIT 5;

-- 3. Current stock status with reorder flag
SELECT p.ProductID, p.ProductName, i.Stock, p.ReorderLevel,
CASE WHEN i.Stock <= p.ReorderLevel THEN 'REORDER' ELSE 'OK' END AS Status
FROM Inventory i JOIN Products p ON i.ProductID = p.ProductID;