-- ==============================================================================
-- PROJECT     : E-Commerce Transactional Data Analysis
-- DATASET     : 1,200 Orders | 7 Products | DecodeLabs Batch 2026
-- AUTHOR      : Mahmoud Abdul Ghany
-- DESCRIPTION : End-to-End Business Intelligence & Operational Insights using SQL
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- Query 1: First 10 Orders — Basic SELECT
-- Business Goal: Display a sample of all orders to understand the dataset structure.
-- ------------------------------------------------------------------------------
SELECT OrderID, Date, CustomerID, Product,
       Quantity, UnitPrice, TotalPrice, OrderStatus
FROM Orders
LIMIT 10;


-- ------------------------------------------------------------------------------
-- Query 2: Top 10 Shipped Orders by Value — WHERE + ORDER BY
-- Business Goal: Filter only 'Shipped' orders and rank them by highest total price.
-- ------------------------------------------------------------------------------
SELECT OrderID, CustomerID, Product, TotalPrice, OrderStatus
FROM Orders
WHERE OrderStatus = 'Shipped'
ORDER BY TotalPrice DESC
LIMIT 10;


-- ------------------------------------------------------------------------------
-- Query 3: High-Value Orders (> $2,000) — WHERE Filter
-- Business Goal: Identify premium orders exceeding $2,000 in total price.
-- ------------------------------------------------------------------------------
SELECT OrderID, CustomerID, Product, Quantity, TotalPrice
FROM Orders
WHERE TotalPrice > 2000
ORDER BY TotalPrice DESC;


-- ------------------------------------------------------------------------------
-- Query 4: Order Count by Product — GROUP BY + COUNT
-- Business Goal: Count the total number of orders for each product category.
-- ------------------------------------------------------------------------------
SELECT Product, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Product
ORDER BY TotalOrders DESC;


-- ------------------------------------------------------------------------------
-- Query 5: Revenue & Avg Order Value by Product — SUM + AVG
-- Business Goal: Aggregate total revenue and average order value per product category.
-- ------------------------------------------------------------------------------
SELECT Product,
       COUNT(*) AS TotalOrders,
       ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
       ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM Orders
GROUP BY Product
ORDER BY TotalRevenue DESC;


-- ------------------------------------------------------------------------------
-- Query 6: Order Status Summary — GROUP BY + Aggregations
-- Business Goal: Summarize order volume and revenue by fulfillment status.
-- ------------------------------------------------------------------------------
SELECT OrderStatus,
       COUNT(*) AS OrderCount,
       ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
       ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM Orders
GROUP BY OrderStatus
ORDER BY OrderCount DESC;


-- ------------------------------------------------------------------------------
-- Query 7: Payment Method Analysis — GROUP BY + COUNT + SUM
-- Business Goal: Determine which payment methods are most used and generate the most revenue.
-- ------------------------------------------------------------------------------
SELECT PaymentMethod,
       COUNT(*) AS UsageCount,
       ROUND(SUM(TotalPrice), 2) AS TotalRevenue
FROM Orders
GROUP BY PaymentMethod
ORDER BY UsageCount DESC;


-- ------------------------------------------------------------------------------
-- Query 8: Delivered Orders by Product — WHERE + GROUP BY
-- Business Goal: Analyze successfully delivered orders per product to identify top performers.
-- ------------------------------------------------------------------------------
SELECT Product,
       COUNT(*) AS DeliveredOrders,
       ROUND(SUM(TotalPrice), 2) AS Revenue
FROM Orders
WHERE OrderStatus = 'Delivered'
GROUP BY Product
ORDER BY Revenue DESC;


-- ------------------------------------------------------------------------------
-- Query 9: Revenue by Referral Source — GROUP BY
-- Business Goal: Identify which marketing channels drive the most orders and revenue.
-- ------------------------------------------------------------------------------
SELECT ReferralSource,
       COUNT(*) AS OrderCount,
       ROUND(SUM(TotalPrice), 2) AS TotalRevenue
FROM Orders
GROUP BY ReferralSource
ORDER BY TotalRevenue DESC;


-- ------------------------------------------------------------------------------
-- Query 10: Average & Total Quantity by Product — AVG + SUM
-- Business Goal: Measure how many units are typically ordered per transaction for each product.
-- ------------------------------------------------------------------------------
SELECT Product,
       ROUND(AVG(Quantity), 2) AS AvgQuantity,
       SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY Product
ORDER BY TotalQuantity DESC;
