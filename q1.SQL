CREATE DATABASE STUDENTS;
USE USERDB;

-- Create Students Table
CREATE TABLE COLLEGE (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create Courses Table
CREATE TABLE courseSS(
    course_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credit_hour INT
);

-- Create Enrollment Table
CREATE TABLE enrollmentTT (
    enrollment_id INT PRIMARY KEY,
    course_id INT,
    student_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);



-- Insert Data into Students
INSERT INTO Students (student_id, name, age, email, phone_number) VALUES
(1, 'Alice Smith', 20, 'alice@example.com', '555-0101'),
(2, 'Bob Johnson', 22, 'bob@example.com', '555-0102'),
(3, 'Charlie Brown', 19, 'charlie@example.com', '555-0103'),
(4, 'Diana Prince', 21, 'diana@example.com', '555-0104'),
(5, 'Evan Wright', 23, 'evan@example.com', '555-0105');

-- Insert Data into Courses
INSERT INTO courses (course_id, name, credit_hour) VALUES
(100, 'Introduction to Computer Science', 3),
(101, 'Data Structures', 3),
(103, 'Database Management Systems', 3),
(104, 'Web Development', 3),
(105, 'Artificial Intelligence', 4);

-- Insert Data into Enrollment
INSERT INTO enrollment (enrollment_id, course_id, student_id) VALUES
(1001, 101, 1),
(1002, 103, 1),
(1003, 102, 2),
(1004, 104, 2),
(1005, 101, 3),
(1006, 105, 4),
(1007, 103, 5),
(1008, 105, 5),
(1009, 102, 1);
SELECT * FROM students;
SELECT * FROM course;
SELECT * FROM enrollment;



SELECT * FROM Students;
SELECT name, email
FROM Students;
SELECT *
FROM Students
WHERE age > 20;
SELECT name
FROM Students
WHERE name LIKE 'A%';
SELECT *
FROM courses
WHERE name LIKE '%Science%';
SELECT *
FROM Students
ORDER BY age DESC;
SELECT *
FROM Students
WHERE phone_number = '555-0103';
ALTER TABLE Students
ADD address VARCHAR(255);
ALTER TABLE Students
MODIFY is_active BOOLEAN DEFAULT TRUE;
ALTER TABLE Students
MODIFY phone_number VARCHAR(50);
SELECT * FROM courses LIMIT 1;
DESCRIBE courses;
ALTER TABLE Students
DROP COLUMN age;
SHOW CREATE TABLE courses;
ALTER TABLE courses
ADD CHECK (credit_hour > 0);
UPDATE Students
SET phone_number = '555-9999'
WHERE student_id = 1;
UPDATE Students
SET email = 'bob.j@newemail.com'
WHERE student_id = 2;
UPDATE courses
SET credit_hour = credit_hour + 1
WHERE credit_hour = 3;
 UPDATE Students
SET email = LOWER(email);
UPDATE courses
SET credit_hour = 5
WHERE course_name = 'Data Structures';
DELETE FROM Students
WHERE name = 'Evan Wright';
DELETE FROM courses
WHERE credit_hour < 3;
DELETE FROM enrollment
WHERE student_id = 3;
DELETE FROM Students
WHERE student_id = 3;
TRUNCATE TABLE enrollment;
SELECT COUNT(*) AS total_students
FROM Students;
SELECT AVG(age) AS average_age
FROM Students;
SELECT MAX(credit_hour) AS max_credit_hour
FROM courses;
SELECT MIN(age) AS youngest_age
FROM Students;
SELECT SUM(credit_hour) AS total_credit_hours
FROM courses;
SELECT course_id, COUNT(student_id) AS total_students
FROM enrollment
GROUP BY course_id;
SELECT student_id, COUNT(course_id) AS total_courses
FROM enrollment
GROUP BY student_id;
SELECT course_id
FROM enrollment
GROUP BY course_id
HAVING COUNT(student_id) > 2;
SELECT student_id
FROM enrollment
GROUP BY student_id
HAVING COUNT(course_id) = 2;
SELECT s.name, e.course_id
FROM Students s
JOIN enrollment e ON s.student_id = e.student_id;
SELECT s.name, c.course_name
FROM Students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;
SELECT c.course_id, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id;
SELECT s.name
FROM Students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Management Systems';
SELECT s.student_id, s.name
FROM Students s
LEFT JOIN enrollment e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
SELECT s.name, SUM(c.credit_hour) AS total_credit_hours
FROM Students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY s.name;
SELECT s.name
FROM Students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.credit_hour = (
    SELECT MAX(credit_hour) FROM courses
);
SELECT course_id
FROM enrollment
GROUP BY course_id
HAVING COUNT(student_id) > (
    SELECT AVG(course_count)
    FROM (
        SELECT COUNT(student_id) AS course_count
        FROM enrollment
        GROUP BY course_id
    ) AS temp
);
SELECT name
FROM Students
WHERE age > (
    SELECT AVG(age)
    FROM Students
);
DELIMITER //

DROP PROCEDURE IF EXISTS GetStudentCourses;
UPDATE courses
SET credit_hour = credit_hour + 1
WHERE course_name = 'Web Development';
SELECT *FROM course 
WHERE name ="web development";
SELECT * from course;
SHOW TABLES;
SELECT* FROM college;
SELECT *FROM courses;
SELECT * from enrollment;




