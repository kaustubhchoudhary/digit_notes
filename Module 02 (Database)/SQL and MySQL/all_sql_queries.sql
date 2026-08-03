# DDL
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
CHANGE COLUMN name student_name VARCHAR(30) NOT NULL ,
CHANGE COLUMN email student_email VARCHAR(30) NOT NULL ,
CHANGE COLUMN course student_course VARCHAR(20) NULL ,
MODIFY COLUMN course_fees DECIMAL(8, 2) NULL ,
CHANGE COLUMN enrollment_date course_enrollment_date DATE NULL,
DROP COLUMN completion_date;

# DQL
SHOW CREATE TABLE students;

# DML - run the DML with SELECT query together to see instant results

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

# Batch update
UPDATE students 
SET course_fees = 10000 
WHERE student_course = 'Advance Java';
SELECT * FROM students;

SET SQL_SAFE_UPDATES = 0;

UPDATE students 
SET course_fees = 10000 
WHERE student_course = 'Advance Java';
SELECT * FROM students;

SET SQL_SAFE_UPDATES = 1;

DELETE FROM students WHERE `student_email` = 'yash@hotmail.com';
SELECT * FROM students;

# DQL
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

# DDL Again - cloning
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

# DDL
TRUNCATE course_1;
SELECT * FROM course_1;

DROP TABLE course_1;

DROP TABLE course_2, course_3, course_4;

DROP SCHEMA school;

-- DDL, DML, DQL completes --

-- Database Ojects start --

CREATE SCHEMA db_objects;

USE db_objects;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
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

# Indexes
SHOW INDEX FROM employees;

-- Create index on single column
CREATE INDEX idx_name ON employees(name);
SHOW INDEX FROM employees;

CREATE INDEX idx_dept_designation
ON employees(department, designation);
SHOW INDEX FROM employees;

# Search based on index
SELECT * FROM employees WHERE name = 'Amit Sharma';

SELECT * FROM employees WHERE department = 'IT' 
AND designation = 'Software Engineer';

# DROP indexes
-- Check first
SHOW INDEX FROM Employees;

-- drop then
DROP INDEX idx_name ON employees;
DROP INDEX idx_dept_designation ON employees;

-- Check again
SHOW INDEX FROM Employees;

# Temporary Table

CREATE TEMPORARY TABLE temp_employees (
    id INT,
    name VARCHAR(50)
);

INSERT INTO temp_employees 
VALUES (1, 'Jay'), (2, 'Raj'), (3, 'Yash');

SELECT * FROM temp_employees;

DROP TEMPORARY TABLE temp_employees; 

# Clone temporary table
CREATE TEMPORARY TABLE temp_it_employees AS
SELECT *
FROM employees
WHERE department = 'IT';
SHOW tables;

SELECT * FROM temp_it_employees;

-- Add more data
INSERT INTO temp_it_employees 
(name, email, department, designation, joining_date, basic_salary)
VALUES ('Akanksha', 'akanksha@yahoo.com', 'CS', 'Lead','2020-12-12', 40000);
SELECT * FROM temp_it_employees;

-- Reconnect to server to drop temp_it_employees

-- Temporary Table completes --

# Views
CREATE VIEW it_senior_employees_view AS
SELECT 
    id,
    name,
    email,
    department,
    designation,
    basic_salary,
    YEAR(CURDATE()) - YEAR(joining_date) AS experience_years
FROM employees
WHERE department = 'IT'
  AND basic_salary >= 60000;
  
SHOW FULL TABLES WHERE Table_Type = 'VIEW';

SELECT * FROM it_senior_employees_view;

UPDATE it_senior_employees_view
SET basic_salary = basic_salary + 5000
WHERE id = 4;
SELECT * FROM it_senior_employees_view;

-- Modifying the view
CREATE OR REPLACE VIEW it_senior_employees_view AS
SELECT id, name, email, department, designation, basic_salary
FROM employees
WHERE department = 'IT'
  AND basic_salary >= 65000;
SELECT * FROM it_senior_employees_view;

DROP VIEW it_senior_employees_view;
SELECT * FROM it_senior_employees_view;

-- View completes

# Stored Procedures
-- IN 
DELIMITER //

CREATE PROCEDURE get_employees_by_department (
    IN dept_name VARCHAR(50)
)
BEGIN
    SELECT *
    FROM employees
    WHERE department = dept_name;
END//

DELIMITER ;

-- Call
CALL get_employees_by_department('IT');

-- OUT
DELIMITER $$

CREATE PROCEDURE get_it_employee_count (
    OUT emp_count INT
)
BEGIN
    SELECT COUNT(*)
    INTO emp_count
    FROM employees
    WHERE department = 'IT';
END$$

DELIMITER ;

CALL get_it_employee_count(@total);
SELECT @total;

-- INOUT
DELIMITER ^^

CREATE PROCEDURE get_matching_salary (
    INOUT sal DECIMAL(10,2)
)
BEGIN
    SELECT MAX(basic_salary)
    INTO sal
    FROM employees
    WHERE basic_salary <= sal;
END^^

DELIMITER ;

-- Call
SET @salary = 70000;
CALL get_matching_salary(@salary);
SELECT @salary;

-- All 3 in 1
DELIMITER //

CREATE PROCEDURE employee_summary_by_department (
    IN dept_name VARCHAR(50),
    INOUT min_salary DECIMAL(10,2),
    OUT emp_count INT
)
BEGIN
    -- Count employees in the given department with salary >= min_salary
    SELECT COUNT(*)
    INTO emp_count
    FROM employees
    WHERE department = dept_name
      AND basic_salary >= min_salary;

    -- Update min_salary to the maximum salary in that department
    SELECT MAX(basic_salary)
    INTO min_salary
    FROM employees
    WHERE department = dept_name;
END//

DELIMITER ;
SET @dept = 'IT';
SET @salary = 50000;
CALL employee_summary_by_department(@dept, @salary, @total);
SELECT @salary AS max_salary, @total AS employee_count;

-- Drop one
DROP PROCEDURE get_employees_by_department;

-- Drop all
DROP PROCEDURE IF EXISTS `employee_summary_by_department`;
DROP PROCEDURE IF EXISTS `get_it_employee_count`;
DROP PROCEDURE IF EXISTS `get_matching_salary`;

# Triggers
-- Alter table
ALTER TABLE employees
ADD COLUMN bonus DECIMAL(10,2),
ADD COLUMN deduction DECIMAL(10,2),
ADD COLUMN final_salary DECIMAL(10,2),
ADD COLUMN total_experience INT;

-- Before update
DELIMITER //

CREATE TRIGGER before_update_employees
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    -- Calculate bonus (10% of basic salary)
    SET NEW.bonus = NEW.basic_salary * 0.10;

    -- Calculate deduction (5% of basic salary)
    SET NEW.deduction = NEW.basic_salary * 0.05;

    -- Calculate final salary
    SET NEW.final_salary = NEW.basic_salary + NEW.bonus - NEW.deduction;

    -- Calculate total experience (in years)
    SET NEW.total_experience =
        TIMESTAMPDIFF(YEAR, NEW.joining_date, CURDATE());
END//

DELIMITER ;

-- Test (update all with same value)
-- Turn off safe updates
SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET basic_salary = basic_salary;
Select * from employees;

-- Before Insert
DELIMITER //

CREATE TRIGGER before_insert_employees
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    -- Calculate bonus (10% of basic salary)
    SET NEW.bonus = NEW.basic_salary * 0.10;

    -- Calculate deduction (5% of basic salary)
    SET NEW.deduction = NEW.basic_salary * 0.05;

    -- Calculate final salary
    SET NEW.final_salary = NEW.basic_salary + NEW.bonus - NEW.deduction;

    -- Calculate total experience (in years)
    SET NEW.total_experience =
        TIMESTAMPDIFF(YEAR, NEW.joining_date, CURDATE());
END//

DELIMITER ;

-- Test
INSERT INTO employees
(name, email, department, designation, joining_date, basic_salary)
VALUES
('Rohit Malhotra', 'rohit.malhotra@gmail.com', 'IT', 'Backend Developer', '2020-05-12', 65000);
SELECT * FROM employees;

SHOW TRIGGERS;

DROP TRIGGER IF EXISTS before_insert_employees;
DROP TRIGGER IF EXISTS before_update_employees;
SHOW TRIGGERS;

-- Triggers complete

# Alias
SELECT COUNT(*) AS total_employees FROM employees;
SELECT COUNT(*) total_employees FROM employees;

# Aggregate Functions
SELECT COUNT(*) AS total_employees FROM employees;

SELECT COUNT(*) FROM employees WHERE department = 'Sales' OR department = 'Support';

SELECT MIN(basic_salary) AS min_salary FROM employees;

SELECT MAX(joining_date) as latest_joing_date FROM employees;

SELECT SUM(basic_salary) as total_salary FROM employees;

SELECT ROUND(AVG(basic_salary), 2) avg_salary FROM employees;

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

SELECT department, ROUND(AVG(basic_salary), 2) AS average_salary
FROM employees
GROUP BY department
HAVING average_salary > 23000;

# String functions
SELECT CONCAT(name, ' - ', department) AS employee_info
FROM employees;

SELECT CONCAT(name, ' <', email, '>') AS contact_details
FROM employees;

SELECT SUBSTRING(name, 2, 3) AS ExtractString 
FROM employees;

SELECT UPPER(name) AS upper_name
FROM employees;

SELECT LOWER(name) AS lower_name
FROM employees;

SELECT name, LENGTH(name) AS name_length
FROM employees;

# Numeric Functions
# add another column
ALTER TABLE employees
ADD COLUMN monthly_tax DECIMAL(10,4);

# For batch update
SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET monthly_tax = basic_salary * 0.0785 + (id * 0.137);

#Round
SELECT name, monthly_tax, ROUND(monthly_tax, 2) AS rounded_tax
FROM employees;

# CEIL
SELECT name, monthly_tax, CEIL(monthly_tax) AS ceiled_tax
FROM employees;

# Floor
SELECT name, monthly_tax, FLOOR(monthly_tax) AS floored_tax
FROM employees;

# Absoulte
SELECT name, basic_salary, ABS(basic_salary - 60000) AS salary_difference
FROM employees;

# Date Functions
SELECT CURDATE() AS `current_date`;

SELECT NOW() AS current_date_time;

INSERT INTO employees
(name, email, department, designation, joining_date, basic_salary)
VALUES
('Arjun Khanna', 'arjun.khanna@gmail.com', 'IT', 'Full Stack Developer', CURDATE(), 72000);
SELECT name, joining_date FROM employees ORDER BY joining_date desc;

SELECT name, DATE_FORMAT(joining_date, '%Y') AS hire_year FROM employees;

SELECT name, joining_date,
DATE_FORMAT(joining_date, '%Y') AS hire_year,
DATE_FORMAT(joining_date, '%y') AS hire_y,
DATE_FORMAT(joining_date, '%D') AS hire_day,
DATE_FORMAT(joining_date, '%d') AS hire_d,
DATE_FORMAT(joining_date, '%M') AS hire_month,
DATE_FORMAT(joining_date, '%m') AS hire_m
FROM employees;

# Delay joining date by 3 months
SELECT name, joining_date, 
DATE_ADD(joining_date, INTERVAL 3 MONTH) 
AS new_hire_date FROM employees;

SELECT name, joining_date FROM employees where id = 1;

UPDATE employees 
SET joining_date = DATE_ADD(joining_date, INTERVAL 20 DAY) 
where id = 1;
SELECT name, joining_date FROM employees where id = 1;

SELECT 
name, joining_date, DATEDIFF(NOW(), joining_date) AS days_employed 
FROM employees 
ORDER BY days_employed DESC;

SELECT name, joining_date, 
EXTRACT(MONTH FROM joining_date) AS hire_month 
FROM employees;

SELECT 
    name,
    joining_date,
    CONCAT(
        TIMESTAMPDIFF(YEAR, joining_date, CURDATE()), ' years ',
        TIMESTAMPDIFF(MONTH, joining_date, CURDATE()) % 12, ' months ',
        FLOOR(DATEDIFF(CURDATE(), joining_date) - TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) * 365.25 - 
        (TIMESTAMPDIFF(MONTH, joining_date, CURDATE()) % 12) * 30.44), ' days'
    ) AS difference
FROM 
    employees order by joining_date asc;

# Same formula different columns

SELECT 
    name
    joining_date,
    TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS years,
    TIMESTAMPDIFF(MONTH, joining_date, CURDATE()) % 12 AS months,
    FLOOR(DATEDIFF(CURDATE(), joining_date) - 
          (TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) * 365.25) - 
          ((TIMESTAMPDIFF(MONTH, joining_date, CURDATE()) % 12) * 30.44)) AS days
FROM 
    employees order by joining_date asc;

# The topic functions end

# Events
SET GLOBAL event_scheduler = ON;

SELECT name, basic_salary, designation from employees WHERE basic_salary >= 70000;
  
CREATE EVENT update_designation_once
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
UPDATE employees
SET designation = CONCAT('Senior ', designation)
WHERE basic_salary >= 70000;

# After 1 minute
SELECT name, basic_salary, designation from employees WHERE basic_salary >= 70000;

-- Recurring event (fires every passing minute)
CREATE EVENT update_salary_every_minute
ON SCHEDULE EVERY 1 MINUTE
DO
UPDATE employees
SET basic_salary = basic_salary + 100;

SELECT name, basic_salary, bonus, deduction from employees;

SHOW EVENTS;

ALTER EVENT update_salary_every_minute DISABLE;

DROP EVENT IF EXISTS update_salary_every_minute;

DROP SCHEMA db_objects;