# 🧮 Basic SQL Queries

This repository contains a collection of basic SQL queries I've written to practice and reinforce my understanding of fundamental SQL concepts. It's a personal learning project, perfect for beginners or anyone who wants a quick refresher on core SQL skills.

---

## 📁 Projects Included

### 1. 📘 SchoolDB

A simulated academic database designed for mastering SQL queries across a variety of real-world school scenarios—students, instructors, courses, grades, and scheduling.

- **Focus Areas**:
  - Database design and table creation with foreign keys
  - Joins across multiple tables (Students, Enrollments, Courses, Instructors)
  - Aggregation and filtering by semester, year, and grade
  - Practical views like class rosters, teaching assignments, and academic stats

- **Highlight Queries**:
  - Student-course-instructor relationships via joins
  - Enrollment stats by course, semester, and grade
  - Sorting and filtering by enrollment date, email domain, and credit load
  - Determine which instructors teach specific courses
  - Count of courses taught per instructor and students per course

📄 [View SchoolDB README](https://github.com/rlanier-webdev/SQL/blob/main/schooldb/README.md)

---

### 2. 🛒 EcommerceDB

A simulated eCommerce database focused on customers, orders, products, and order details. This project explores various business logic scenarios like customer activity, revenue calculations, and order trends.

- **Focus Areas**:
  - Filtering, pattern matching, and sorting
  - Aggregations and grouping (`SUM`, `AVG`, `COUNT`)
  - Joins across multiple related tables
  - Revenue analysis, product performance, and customer behavior
  - Subqueries and integrity validation (e.g., mismatched totals)

- **Highlight Queries**:
  - Calculate total and average revenue per customer
  - Identify top 3 spending customers
  - Find all products never ordered
  - Validate order totals by comparing aggregated order detail prices
  - Retrieve detailed product purchase reports per customer and order

📄 [View EcommerceDB README](https://github.com/rlanier-webdev/SQL/blob/main/ecommercedb/README.md)

---

### 3. 🏀 WNBADraftDB

A deep-dive into WNBA draft data with a focus on player performance, draft trends, and team-level insights. This project enhances SQL proficiency through ranking functions, conditional logic, and aggregate analysis.

- **Focus Areas**:
  - Filtering and conditional queries (e.g., player stats, draft years)
  - Aggregation, grouping, and ranking (`RANK() OVER`, `GROUP BY`)
  - Advanced joins and subqueries for year-over-year comparisons
  - CASE statements for custom labels like 'Veteran' vs. 'Rookie'
  - Win shares analysis and college/team breakdowns

- **Highlight Queries**:
  - Top scorers by total points (games × points per game)
  - Players ranked by win shares per 40 minutes
  - Average points per college and draftees per team
  - Label players as veterans or rookies based on years played
  - Determine draft-year leaders by performance

- **Data Source**:
  - [WNBA Draft Basketball Player Data (1997–2021) on Kaggle](https://www.kaggle.com/datasets/mattop/wnba-draft-basketball-player-data-1997-2021)

📄 [View WNBADraftDB README](https://github.com/rlanier-webdev/SQL/blob/main/wnbadraftdb/README.md)

---

### 4. 🎤 GrammysDB  
A comprehensive SQL analysis of Grammy Awards data from 1965 to 2024, focused on uncovering insights into artist performance, award categories, and nomination patterns. This project reinforces key SQL concepts using a real-world entertainment dataset.

**Focus Areas:**

- Filtering and pattern matching (e.g., song titles with "Love")  
- Aggregation and grouping (wins vs. nominations per artist/category)  
- CTEs and subqueries for advanced summarization  
- Identifying duplicates, outliers, and unique records  
- Conditional logic using `CASE` statements  

**Highlight Queries:**

- Most nominated artist in a single year  
- Artists with Grammy wins in 3+ different categories  
- Duplicate nominations across years and categories  
- Songs with multiple producers or recurring title themes  
- Artists who were nominated but never won  

**Data Source:**

  - [Grammy Winners and Nominees (1965–2024) on Kaggle](https://www.kaggle.com/datasets/johnpendenque/grammy-winners-and-nominees-from-1965-to-2024)  

📄 View [GrammysDB README](https://github.com/rlanier-webdev/SQL/tree/main/grammysDB#readme)

---

## 🔧 Tools Used

- SQL Server (T-SQL)
- Custom-built sample databases
- SSMS (SQL Server Management Studio)

---

## 🎓 Purpose

- Practice SQL querying techniques in real-world-style datasets.
- Reinforce foundational and intermediate SQL concepts.
- Build a portfolio of practical SQL solutions.

---
