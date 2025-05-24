# 🎵 GrammysDB SQL Analysis

## 📘 Overview

This project explores **Grammy Awards data from 1965 to 2024** using SQL. It includes a collection of 20 practice queries designed to enhance SQL proficiency through real-world, culturally rich data. The focus is on uncovering trends, patterns, and insights about artists, nominations, and wins.

---

## 🧰 Tools Used

- SQL Server (T-SQL)
- GrammysDB (practice database)

---

## 📄 Data Source

- [Grammy Winners and Nominees (1965–2024) on Kaggle](https://www.kaggle.com/datasets/johnpendenque/grammy-winners-and-nominees-from-1965-to-2024)

---

## 🎯 Objectives

- Practice foundational and advanced SQL concepts
- Extract insights about artists, categories, and award patterns
- Gain fluency in data filtering, aggregation, CTEs, and conditional logic

---

## 📊 Key Query Topics

| Category               | Description                                                         |
|------------------------|---------------------------------------------------------------------|
| Filtering & Searching  | `WHERE`, `LIKE`, `IN`, `DISTINCT`                                  |
| Aggregation & Grouping | `COUNT`, `GROUP BY`, `HAVING`, `ORDER BY`                          |
| Conditional Logic      | `CASE WHEN`, `IS NULL`                                             |
| Common Table Expressions | `WITH` clauses for breaking down complex logic                  |
| Deduplication & Ranking| Identifying duplicates, using `COUNT(*)` and `MAX()` logic        |

---

## 📝 Example Practice Tasks

| #   | Task Description                                                                 | SQL Concepts Applied                         |
|-----|-----------------------------------------------------------------------------------|----------------------------------------------|
| 3   | Find all records where the artist is "Beyoncé"                                   | Filtering with `WHERE`                       |
| 7   | Count how many nominations Beyoncé has received                                  | `COUNT`, `WHERE` with conditional logic      |
| 12  | Identify artist(s) with the most nominations in a single year                    | CTEs, `GROUP BY`, subqueries                 |
| 14  | List all winning songs or albums with "Love" in the title                        | Pattern matching with `LIKE`                 |
| 17  | Compare wins vs nominations for each award category                              | `CASE`, `COUNT`, `GROUP BY`, `ORDER BY`      |
| 20  | Find artists who were nominated but never won any awards                         | `HAVING`, conditional aggregates             |

---

## 🔍 Highlighted Query Example

```sql
-- Find artists who were nominated but never won
SELECT artist
FROM awards
GROUP BY artist
HAVING COUNT(CASE WHEN winner = 'TRUE' THEN 1 END) = 0;
```
This query identifies artists who received at least one nomination but never won a Grammy, using a CASE statement inside an aggregate function to count only wins.

---