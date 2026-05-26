# 📊 E-Commerce Business Intelligence: SQL Data Analysis Report

## 📌 Project Overview
This project presents a structured **SQL Data Analysis Case Study** conducted on an e-commerce transactional dataset containing **1,200 orders**. The core objective is to apply relational database querying to unlock strategic business insights across financial performance, product popularity, marketing acquisition efficiency, and operational bottlenecks[cite: 2].

Developed as part of the Data Analytics Industrial Training Specialization at **DecodeLabs (Batch 2026)**[cite: 2].

---

## 🏗️ Relational Schema & Dataset Attributes
The analysis inspects a comprehensive tracking table (`Orders`) with 18 fields, optimizing queries across key properties[cite: 2]:
* **Identificational:** `OrderID`, `CustomerID`[cite: 2].
* **Temporal:** `Date`[cite: 2].
* **Categorical Operations:** `Product`, `PaymentMethod`, `OrderStatus`, `ReferralSource`[cite: 2].
* **Financial Metrics:** `Quantity`, `UnitPrice`, `TotalPrice`[cite: 2].

---

## 🛠️ SQL Syntax & Techniques Demonstrated
* **Descriptive Auditing:** `SELECT`, `LIMIT` for structure sampling[cite: 2].
* **Conditional Segmentations:** Multi-factor filtering using `WHERE` operators[cite: 2].
* **Analytical Aggregations:** Multi-level categorical breakdown using `GROUP BY` accompanied by `COUNT(*)`, `SUM()`, `AVG()`, and static precision scaling using `ROUND()`[cite: 2].
* **Result Prioritization:** Structured sorting via `ORDER BY ... DESC`[cite: 2].

---

## 🚀 Key Executive & Business Insights

### 1️⃣ Marketing Channel ROI (Referral Sources)
* **Instagram** stands out as the ultimate powerhouse acquisition channel, driving **259 orders** and generating **$275,285.45 in revenue**[cite: 2]. This accounts for nearly **20% of total business revenue**[cite: 2], clearly suggesting that future growth strategies and ad spend should heavily favor social conversion loops.

### 2️⃣ Financial Leakage & Friction Analysis
* **Cancelled orders** represent the largest single cohort in fulfillment tracking with **250 orders**, draining an estimated **$276,396.21 in potential gross income**[cite: 2]. This highlights a critical operational vulnerability—potentially caused by payment gateway issues or check-out drop-offs—that requires technical evaluation.

### 3️⃣ Product Diagnostics & Consumer Tractions
* **Chairs** dominate macro product categories in total financial volume, claiming **$195,620.11 in total revenue**[cite: 2] and the highest unit footprint with **562 items sold**[cite: 2].
* **Laptops** operate as the premier high-ticket velocity asset, capturing the maximum Average Order Value (AOV) at **$1,110.56 per order**[cite: 2].

---

## 💻 Query Documentation & Analytics Catalog

The comprehensive operational script containing all ten functional queries is available in the `queries.sql` file in this repository. Below are key technical pillars extracted from the run:

### Aggregate Financial & Pricing Performance by Catalog Item
```sql
SELECT Product,
       COUNT(*) AS TotalOrders,
       ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
       ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM Orders
GROUP BY Product
ORDER BY TotalRevenue DESC;
