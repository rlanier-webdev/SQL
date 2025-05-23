# 🎓 SchoolDB SQL Practice

## 📘 Overview

This project explores a fictional school database called **SchoolDB** using SQL Server. It includes a variety of structured queries to practice real-world data handling scenarios such as student enrollments, course assignments, grading, and instructor data. The purpose of this project is to reinforce SQL fundamentals through hands-on problem-solving and practical analysis.

---

## 🧰 Tools Used

- SQL Server (T-SQL)
- SchoolDB (custom practice database)

---

## 🎯 Objectives

- Strengthen SQL querying skills through realistic data challenges  
- Explore relationships between students, courses, and instructors  
- Practice key SQL concepts: joins, filters, aggregations, and conditional logic  
- Derive actionable insights from simulated educational data  

---

## 📊 Key Query Topics

| Category                  | Description                                                                |
|---------------------------|----------------------------------------------------------------------------|
| Filtering and Sorting     | `WHERE`, `LIKE`, `ORDER BY`, `TOP`                                         |
| Aggregations              | `SUM`, `COUNT`, `AVG`, `GROUP BY`, `HAVING`                                |
| Joins and Relationships   | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN` for linking tables                 |
| Conditional Logic         | `CASE` statements and filtering with date logic                            |
| Date Functions            | `DATEFROMPARTS`, `BETWEEN`, and direct comparisons on `DATE` fields        |

---

## 📌 Sample Insights from the Analysis

| #  | Insight                                                                          | SQL Concepts                        |
|----|----------------------------------------------------------------------------------|-------------------------------------|
| 1  | Retrieved student contact info and birth dates                                  | `SELECT`, `WHERE`                   |
| 6  | Sorted students by most recent enrollment                                       | `ORDER BY`                          |
| 11 | Displayed students and the courses they're enrolled in                          | `JOIN`                              |
| 14 | Identified which instructor teaches "Introduction to Programming"              | `JOIN`, `WHERE`                     |
| 16 | Counted how many students are enrolled per course                               | `GROUP BY`, `COUNT`                 |
| 18 | Calculated total enrollments per semester/year using date-based logic          | `LEFT JOIN`, `DATEFROMPARTS`, `GROUP BY` |
| 20 | Counted recent enrollments (post-2023)                                           | `WHERE`, `COUNT`                    |

---

## 🔍 Highlighted Query Example

```sql
-- Find the total number of enrollments per semester/year combination
SELECT ca.semester, ca.year, COUNT(e.student_id) AS total_enrollments
FROM CourseAssignments ca
LEFT JOIN Enrollments e ON e.course_id = ca.course_id
  AND (
    (ca.semester = 'Spring' AND e.enrollment_date BETWEEN DATEFROMPARTS(ca.year, 1, 1) AND DATEFROMPARTS(ca.year, 5, 31))
    OR
    (ca.semester = 'Fall' AND e.enrollment_date BETWEEN DATEFROMPARTS(ca.year, 8, 1) AND DATEFROMPARTS(ca.year, 12, 31))
  )
GROUP BY ca.semester, ca.year
ORDER BY ca.year, ca.semester;
```

This query ensures that even semesters with **zero enrollments** are included by using a `LEFT JOIN` and applying date logic directly in the join clause. It's a great example of combining **date filtering**, **joins**, and **aggregation** for robust reporting.

---
