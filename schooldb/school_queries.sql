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


-- Insert Students
INSERT INTO Students (name, email, date_of_birth, enrollment_date) VALUES
('Alice Johnson', 'alice.johnson@example.com', '2005-02-15', '2023-08-21'),
('Bob Smith', 'bob.smith@example.com', '2004-06-10', '2022-08-21'),
('Carol Lee', 'carol.lee@example.com', '2005-01-30', '2023-08-21'),
('David Kim', 'david.kim@example.com', '2003-12-05', '2021-08-21'),
('Emma Davis', 'emma.davis@example.com', '2006-07-18', '2024-01-10'),
('Frank Moore', 'frank.moore@example.com', '2005-03-22', '2023-08-21'),
('Grace Hall', 'grace.hall@example.com', '2004-09-01', '2022-08-21'),
('Henry Allen', 'henry.allen@example.com', '2006-11-03', '2024-01-10'),
('Ivy Baker', 'ivy.baker@example.com', '2005-08-14', '2023-08-21'),
('Jake Turner', 'jake.turner@example.com', '2004-04-20', '2022-08-21');

-- Insert Courses
INSERT INTO Courses (course_name, course_code, credits) VALUES
('Mathematics 101', 'MATH101', 3),
('English Literature', 'ENG201', 4),
('Physics I', 'PHYS101', 3),
('Introduction to Programming', 'CS101', 4),
('World History', 'HIST150', 3),
('Biology Basics', 'BIO110', 3),
('Art and Design', 'ART100', 2),
('Chemistry I', 'CHEM101', 4),
('Statistics', 'STAT200', 3),
('Economics', 'ECON210', 3);

-- Insert Instructors
INSERT INTO Instructors (name, email, hire_date) VALUES
('Dr. Susan Green', 'susan.green@school.edu', '2018-09-01'),
('Mr. Tom White', 'tom.white@school.edu', '2019-01-15'),
('Ms. Linda Black', 'linda.black@school.edu', '2020-03-10'),
('Dr. Kevin Brown', 'kevin.brown@school.edu', '2017-07-12'),
('Prof. Rachel Gray', 'rachel.gray@school.edu', '2016-08-05'),
('Mr. Paul Adams', 'paul.adams@school.edu', '2019-11-23'),
('Ms. Nancy Reed', 'nancy.reed@school.edu', '2021-02-14'),
('Dr. James Scott', 'james.scott@school.edu', '2015-06-19'),
('Prof. Laura King', 'laura.king@school.edu', '2020-10-01'),
('Ms. Megan Wells', 'megan.wells@school.edu', '2022-01-05');

-- Insert CourseAssignments
INSERT INTO CourseAssignments (course_id, instructor_id, semester, year) VALUES
(1, 1, 'Fall', 2023),
(2, 2, 'Spring', 2023),
(3, 3, 'Fall', 2023),
(4, 4, 'Spring', 2024),
(5, 5, 'Fall', 2023),
(6, 6, 'Spring', 2024),
(7, 7, 'Fall', 2023),
(8, 8, 'Fall', 2023),
(9, 9, 'Spring', 2024),
(10, 10, 'Spring', 2024);

-- Insert Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2023-08-22', 'A'),
(1, 2, '2023-08-22', 'B'),
(2, 1, '2022-08-22', 'A'),
(2, 3, '2022-08-22', 'C'),
(3, 4, '2023-08-22', 'A'),
(3, 5, '2023-08-22', 'B'),
(4, 2, '2021-08-22', 'B'),
(4, 6, '2021-08-22', 'A'),
(5, 1, '2024-01-11', 'A'),
(5, 7, '2024-01-11', 'A'),
(6, 8, '2023-08-22', 'C'),
(7, 9, '2022-08-22', 'B'),
(8, 10, '2024-01-11', 'A'),
(9, 3, '2023-08-22', 'B'),
(10, 4, '2022-08-22', 'A');

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

-- 8. Retrieve all instructors whose email contains “@school.edu”.
SELECT * FROM Instructors WHERE email LIKE '%@school.edu%';

-- 9. List all course assignments for the year 2023.
SELECT * FROM CourseAssignments WHERE year = 2023;

-- 10. Display all enrollments where the grade is not null and not 'F'.
SELECT * FROM Enrollments WHERE grade IS NOT NULL AND NOT grade = 'F';

-- Joins & Relationships
-- 11. List students and the courses they are enrolled in.
SELECT Students.student_id, Students.name, Courses.course_name
FROM Students
JOIN Enrollments ON Enrollments.student_id = Students.student_id
JOIN Courses on Courses.course_id = Enrollments.course_id;

-- 12. Show instructors and the courses they teach, including semester and year.
SELECT Instructors.name, Courses.course_name, CourseAssignments.semester, CourseAssignments.year
FROM Instructors
JOIN CourseAssignments ON CourseAssignments.instructor_id = Instructors.instructor_id
JOIN Courses ON Courses.course_id = CourseAssignments.course_id;

-- 13. Display each student with the grades they received, course name included.
SELECT Students.name, Courses.course_name, Enrollments.grade
FROM Students
JOIN Enrollments ON Enrollments.student_id = Students.student_id
JOIN Courses ON Courses.course_id = Enrollments.course_id
ORDER BY Enrollments.grade, Students.name;

-- 14. Find which instructor is teaching “Introduction to Programming”.
SELECT Instructors.name, Courses.course_name
FROM Instructors
JOIN CourseAssignments ON CourseAssignments.instructor_id = Instructors.instructor_id
JOIN Courses ON Courses.course_id = CourseAssignments.course_id
WHERE Courses.course_name = 'Introduction to Programming';

-- 15. List all students enrolled in courses taught in Spring 2024.

-- Aggregations & Grouping
-- 16. Count how many students are enrolled in each course.
-- 17. Calculate the average grade (alphabetically) per course.
-- 18. Find the total number of enrollments per semester/year combination.
-- 19. Count how many courses each instructor is assigned to.
-- 20. Get the number of students who enrolled after 2023.

