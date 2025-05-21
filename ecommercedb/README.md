# 🛍️ eCommerce SQL Analysis

## 📘 Overview

This project explores an **eCommerce database** using T-SQL to analyze customer behavior, product trends, order accuracy, and revenue insights. The dataset includes tables such as `Customers`, `Orders`, `OrderDetails`, and `Products`, simulating a real-world retail environment.

🗓️ **Data covers customer activity and order history up to 2025**

---

## 🧰 Tools Used

- SQL Server (T-SQL)
- EcommerceDB (simulated practice database)

---

## 🎯 Objectives

- Practice SQL skills on a transactional database
- Generate insights into customer spending, product sales, and order fulfillment
- Apply concepts like joins, subqueries, window functions, aggregations, and data validation

---

## 🗂️ Dataset Tables

| Table         | Description                            |
|---------------|----------------------------------------|
| `Customers`   | Customer info, registration date, email|
| `Orders`      | Order records with total amounts       |
| `OrderDetails`| Product quantities and prices per order|
| `Products`    | Product names, categories, and prices  |

---

## 📌 Sample Insights from the Analysis

| #  | Insight                                                                                      | SQL Concepts                             |
|----|----------------------------------------------------------------------------------------------|------------------------------------------|
| 5  | Retrieved top 5 most expensive products                                                      | `ORDER BY`, `TOP`                        |
| 12 | Calculated total orders placed by each customer                                              | `JOIN`, `COUNT`, `GROUP BY`              |
| 13 | Calculated total revenue per product                                                         | `SUM`, `JOIN`, `GROUP BY`                |
| 17 | Found customers who spent more than $500 using a subquery                                    | Subquery with `IN`                       |
| 27 | Identified all products never ordered                                                        | `LEFT JOIN`, `IS NULL`                   |
| 29 | Retrieved customers who purchased a specific product (e.g., Laptop)                          | Subquery, `JOIN`                         |
| 32 | Validated orders where total doesn’t match sum of OrderDetails prices                        | `JOIN`, `GROUP BY`, `HAVING`             |

---

## 🔍 Highlighted Query Example

```sql
-- Find mismatched order totals between Orders and OrderDetails
SELECT Orders.order_id, 
    Orders.total_amount AS total, 
    SUM(OrderDetails.price) AS calculated_total
FROM Orders
JOIN OrderDetails ON OrderDetails.order_id = Orders.order_id
GROUP BY Orders.order_id, Orders.total_amount
HAVING SUM(OrderDetails.price) <> Orders.total_amount;
```
This query identifies data inconsistencies between what customers were charged and the actual sum of itemized prices.

---