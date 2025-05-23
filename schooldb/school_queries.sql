-- ==========================================
-- SQL Practice Tasks: SchoolDB
-- Author: RaShunda
-- Purpose: Practice SQL querying skills on School data
-- ==========================================

CREATE DATABASE SchoolDB;
GO

USE SchoolDB;
GO

CREATE TABLE Students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE,
    enrollment_date DATE
);

CREATE TABLE Courses (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    course_name NVARCHAR(100) NOT NULL,
    course_code NVARCHAR(10) UNIQUE NOT NULL,
    credits INT CHECK (credits > 0)
);

CREATE TABLE Instructors (
    instructor_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) UNIQUE NOT NULL,
    hire_date DATE
);

CREATE TABLE Enrollments (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE CourseAssignments (
    assignment_id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    semester NVARCHAR(20),
    year INT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

-- View all students
SELECT * FROM Students;

-- View all courses
SELECT * FROM Courses;

-- View all instructors
SELECT * FROM Instructors;

-- View all course assignments
SELECT * FROM CourseAssignments;

-- View all enrollments
SELECT * FROM Enrollments;

-- Basic SELECT Queries
-- 1. Retrieve the names and emails of all students.
SELECT name, email FROM students;

-- 2. List all courses with more than 3 credits.
SELECT * FROM Courses WHERE credits > 3;

-- 3. Get a list of all instructors hired before 2020.
SELECT * FROM Instructors WHERE hire_date < '2020-01-01';

-- 4. Show all students born after 2005.
SELECT * FROM Students WHERE date_of_birth > '2005-12-31';

-- 5. Display all enrollments where the grade is 'A'.
SELECT * FROM Enrollments WHERE grade = 'A';

-- Sorting & Filtering
-- 6. List all students, sorted by enrollment date (newest first).
SELECT * FROM Students ORDER BY enrollment_date DESC;

-- 7. Show all courses, sorted alphabetically by course name.
SELECT * FROM Courses ORDER BY course_name;

-- 8. Retrieve all instructors whose email contains "@school.edu".
SELECT * FROM Instructors WHERE email LIKE '%@school.edu%';

-- 9. List all course assignments for the year 2023.
SELECT * FROM CourseAssignments WHERE year = 2023;

-- 10. Display all enrollments where the grade is not null and not 'F'.
SELECT * FROM Enrollments WHERE grade IS NOT NULL AND NOT grade = 'F';

-- Joins & Relationships
-- 11. List students and the courses they are enrolled in.
SELECT s.student_id, s.name, c.course_name
FROM Students s
JOIN Enrollments e ON e.student_id = s.student_id
JOIN Courses c on c.course_id = e.course_id;

-- 12. Show instructors and the courses they teach, including semester and year.
SELECT i.name, c.course_name, ca.semester, ca.year
FROM Instructors i
JOIN CourseAssignments ca ON ca.instructor_id = i.instructor_id
JOIN Courses c ON c.course_id = ca.course_id;

-- 13. Display each student with the grades they received, course name included.
SELECT s.name, c.course_name, e.grade
FROM Students s
JOIN Enrollments e ON e.student_id = s.student_id
JOIN Courses c ON c.course_id = e.course_id
ORDER BY e.grade, s.name;

-- 14. Find which instructor is teaching "Introduction to Programming".
SELECT i.name, c.course_name
FROM Instructors i
JOIN CourseAssignments ca ON ca.instructor_id = i.instructor_id
JOIN Courses c ON c.course_id = ca.course_id
WHERE c.course_name = 'Introduction to Programming';

-- 15. List all students enrolled in courses taught in Spring 2024.
SELECT s.name, c.course_name
FROM Students s
JOIN Enrollments e ON e.student_id = s.student_id
JOIN Courses c ON c.course_id = e.course_id
JOIN CourseAssignments ca ON ca.course_id = c.course_id
WHERE ca.semester = 'Spring' AND ca.year = 2024;

-- Aggregations & Grouping
-- 16. Count how many students are enrolled in each course.
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM Courses c
LEFT JOIN Enrollments e ON e.course_id = c.course_id
GROUP BY c.course_id, c.course_name;

-- 17. List the number of students that received each letter grade per course.
SELECT c.course_name, e.grade, COUNT(e.student_id) AS total_students
FROM Enrollments e
RIGHT JOIN Courses c ON c.course_id = e.course_id
GROUP BY c.course_name, e.grade
ORDER BY c.course_name, e.grade;

-- 18. Find the total number of enrollments per semester/year combination.
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

-- 19. Count how many courses each instructor is assigned to.
SELECT i.name, COUNT(ca.course_id) AS total_courses
FROM Instructors i
LEFT JOIN CourseAssignments ca ON ca.instructor_id = i.instructor_id
GROUP BY i.instructor_id, i.name;

-- 20. Get the number of students who enrolled after 2023.
SELECT COUNT(student_id) AS recent_enrollments
FROM Enrollments
WHERE enrollment_date >= '2023-01-01';