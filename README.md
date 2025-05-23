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
  - Rank players by total points and win shares
  - Identify top-performing draftees by year or college
  - Calculate average points per college
  - Use partitioning to compare players within their schools
  - Label players by experience level using `CASE`

📄 [View WNBADraftDB README](https://github.com/rlanier-webdev/SQL/blob/main/wnbadraftdb/README.md)

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
