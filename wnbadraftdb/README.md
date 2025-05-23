# 🏀 WNBA Draft SQL Analysis

## 📘 Overview

This project explores WNBA Draft data from **1997 to 2022** using SQL. It includes a wide range of queries to analyze player performance, team selection trends, and college-level stats. The goal was to deepen my SQL skills through practical, sports-oriented data analysis and produce insights from real-world-style datasets.

---

## 🧰 Tools Used

- SQL Server (T-SQL)
- WNBADraftDB (practice database)

---

## 📄 Data Source
  - [WNBA Draft Basketball Player Data (1997–2021) on Kaggle](https://www.kaggle.com/datasets/mattop/wnba-draft-basketball-player-data-1997-2021)

---

## 🎯 Objectives

- Write queries to explore and manipulate sports data
- Uncover trends in WNBA draft history between 1997–2022
- Practice advanced SQL concepts like window functions, subqueries, and aggregations

---

## 📊 Key Query Topics

| Category                  | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| Filtering and Sorting     | `WHERE`, `LIKE`, `ORDER BY`, `TOP`                                         |
| Aggregations              | `SUM`, `COUNT`, `AVG`, `GROUP BY`, `HAVING`                                |
| Window Functions          | `RANK() OVER`, `PARTITION BY`                                              |
| Subqueries and Joins      | Nested `SELECT`, joining aggregated data                                   |
| Conditional Logic         | `CASE` statements for categorizing players                                 |

---

## 📌 Sample Insights from the Analysis:

| #  | Insight                                                                        | SQL Concepts                       |
|----|--------------------------------------------------------------------------------|------------------------------------|
| 1  | Identified all players drafted in the year 2000                                | `WHERE` filter                     |
| 3  | Calculated total points scored per player and filtered those over 500          | `SUM`, `GROUP BY`, `HAVING`        |
| 6  | Listed top 5 players with highest win shares                                   | `ORDER BY`, `TOP`                  |
| 11 | Found the college with most draftees                                           | `COUNT`, `GROUP BY`, `TOP`         |
| 18 | Ranked players by total points using `RANK()`                                  | Window functions                   |
| 20 | Selected top win share players per year using a `JOIN` with aggregate subquery | Subqueries, `JOIN`, `GROUP BY`     |

---

## 🔍 Highlighted Query Example

```sql
-- Rank players by total points scored
SELECT player, 
    SUM(games * points) AS total_points, 
    RANK() OVER (ORDER BY SUM(games * points) DESC) AS Rank
FROM Picks 
GROUP BY player
ORDER BY total_points DESC;
```
This query ranks players based on their total point contribution across seasons. It uses a window function combined with aggregation to build a performance leaderboard.

---
