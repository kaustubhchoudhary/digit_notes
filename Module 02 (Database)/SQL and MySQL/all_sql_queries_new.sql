CREATE SCHEMA school;

USE school;

CREATE TABLE student (
  _id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  course VARCHAR(45) NOT NULL,
  course_fees VARCHAR(45) NOT NULL,
  enrollment_date DATE NOT NULL,
  completion_date DATE NOT NULL,
  PRIMARY KEY (_id),
  UNIQUE INDEX _id_UNIQUE (_id),
  UNIQUE INDEX email_UNIQUE (email)
);

RENAME TABLE student TO students;

ALTER TABLE students
CHANGE COLUMN _id student_id INT NOT NULL,
CHANGE COLUMN `name` student_name VARCHAR(30) NOT NULL,
CHANGE COLUMN email student_email VARCHAR(30) NOT NULL,
CHANGE COLUMN course student_course VARCHAR(20) NULL,
MODIFY COLUMN course_fees DECIMAL(8, 2) NULL,
CHANGE COLUMN enrollment_date course_enrollment_date DATE NULL,
DROP COLUMN completion_date;

SHOW CREATE TABLE students;

INSERT INTO students 
(student_id, student_name, student_email, 
student_course, course_fees, course_enrollment_date) 
VALUES (101, 'Harsh', 'harsh@gmail.com', 'Core Java', 5000, '2023-05-29');
SELECT * FROM students;

INSERT INTO students VALUES 
(102, 'Madhavi', 'madhavi@yahoo.com', 'Core Python', 18000, '2023-06-01');
SELECT * FROM students;

INSERT INTO students 
(student_id, student_name, student_email, 
student_course, course_fees, course_enrollment_date) 
VALUES 
(103, 'Yash', 'yash@hotmail.com', 'Advance Java', 12000, '2022-12-31'),
(104, 'Mithun', 'mithun@hotmail.com', 'Core Java', 5000, '2023-06-30'),
(105, 'Raj', 'raj@gmail.com', 'Advance Java', 8000, '2022-12-31'),
(106, 'Shekhar', 'shekhar@yahoo.com', 'Core Python', 5000, '2023-01-01'), 
(107, 'Sapna', 'sapna@gmail.com', 'Advanced PHP', 10000, '2023-06-07');
SELECT * FROM students;

UPDATE students 
SET student_course = 'Advance Java', course_fees = 8000 
WHERE student_id = 101;
SELECT * FROM students;

UPDATE students 
SET course_fees = 10000 
WHERE student_course = 'Advance Java';
SELECT * FROM students;

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

DELETE FROM students WHERE `student_email` = 'yash@hotmail.com';
SELECT * FROM students;

SELECT student_name, student_course FROM students;

SELECT * FROM students;

SELECT student_name, student_course, course_fees 
FROM students 
WHERE course_fees > 10000;

SELECT student_name, student_course, course_fees 
FROM students 
WHERE student_course = 'Advance Java' AND course_fees <= 10000;

SELECT student_name, student_course, course_fees 
FROM students 
WHERE student_course = 'Advance Java' OR course_fees <= 10000;

SELECT student_name, student_course, course_enrollment_date 
FROM students 
WHERE course_enrollment_date 
BETWEEN '2023-01-01' AND '2023-06-30' 
ORDER BY course_enrollment_date ASC;

SELECT student_name, student_course, course_enrollment_date
FROM students
WHERE course_enrollment_date >= '2023-01-01'
  AND course_enrollment_date <= '2023-06-30'
ORDER BY course_enrollment_date ASC;

SELECT student_name, student_course 
FROM students 
WHERE student_course LIKE ('%Java');

SELECT student_name, student_course 
FROM students 
WHERE student_course LIKE ('Core%');

SELECT * FROM students WHERE student_email LIKE '%gmail%';

SELECT * FROM students ORDER BY student_id DESC;

SELECT * FROM students 
WHERE student_course 
LIKE '%JAVA%' ORDER BY course_fees DESC;

CREATE TABLE course_1 SELECT * FROM students;
SELECT * FROM course_1;

CREATE TABLE course_2 AS
SELECT * FROM students
WHERE course_fees >= 8000;
SELECT * FROM course_2;

CREATE TABLE course_3 (
  id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
AS
SELECT student_name, student_course
FROM students
WHERE course_fees <= 8000;
SELECT * FROM course_3;

CREATE TABLE course_4 LIKE students;
SELECT * FROM course_4;

CREATE TABLE course_5 LIKE students;

INSERT INTO course_5 SELECT * FROM students;
SELECT * FROM course_5;

TRUNCATE course_1;
SELECT * FROM course_1;

DROP TABLE course_1;

DROP TABLE course_2, course_3, course_4;

DROP DATABASE school;

-- DB Objects --

CREATE SCHEMA db_objects;

USE db_objects;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    designation VARCHAR(50),
    joining_date DATE,
    basic_salary DECIMAL(10,2)
);

INSERT INTO employees 
(name, email, department, designation, joining_date, basic_salary)
VALUES
('Amit Sharma', 'amit.sharma@gmail.com', 'IT', 'Software Engineer', '2019-06-15', 60000),

('Neha Verma', 'neha.verma@gmail.com', 'HR', 'HR Executive', '2021-03-10', 45000),

('Rahul Mehta', 'rahul.mehta@gmail.com', 'Finance', 'Accountant', '2018-01-20', 55000),

('Priya Singh', 'priya.singh@gmail.com', 'IT', 'Senior Developer', '2016-09-05', 85000),

('Ankit Patel', 'ankit.patel@gmail.com', 'Sales', 'Sales Executive', '2022-07-01', 40000),

('Sneha Kulkarni', 'sneha.k@gmail.com', 'Marketing', 'Marketing Analyst', '2020-11-18', 50000),

('Vikas Rao', 'vikas.rao@gmail.com', 'Operations', 'Operations Manager', '2015-04-12', 90000),

('Pooja Nair', 'pooja.nair@gmail.com', 'IT', 'QA Engineer', '2021-08-25', 48000),

('Suresh Iyer', 'suresh.iyer@gmail.com', 'Support', 'Support Lead', '2017-02-14', 52000),

('Kavita Joshi', 'kavita.joshi@gmail.com', 'Admin', 'Office Administrator', '2019-12-02', 42000);

SELECT * FROM employees;