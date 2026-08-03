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

-- Database objects

SHOW INDEX FROM Employees;

CREATE INDEX idx_name ON employees(name);

CREATE INDEX idx_dept_designation
ON employees(department, designation);

SHOW INDEX FROM Employees;

SELECT * FROM employees WHERE name = 'Amit Sharma';

SELECT * FROM employees WHERE department = 'IT' 
AND designation = 'Software Engineer';

DROP INDEX idx_name ON employees;
DROP INDEX idx_dept_designation ON employees;

SHOW INDEX FROM Employees;

-- Temporary Table
CREATE TEMPORARY TABLE temp_employees (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
SELECT * FROM temp_employees;

INSERT INTO temp_employees 
VALUES (1, 'Jay'), (2, 'Raj'), (3, 'Yash');
SELECT * FROM temp_employees;

UPDATE temp_employees SET name = 'Mina' WHERE id = 3;
SELECT * FROM temp_employees;

DELETE FROM temp_employees WHERE id = 1;
SELECT * FROM temp_employees;

DROP TEMPORARY TABLE temp_employees; 

-- Temporary table from an existing table

CREATE TEMPORARY TABLE temp_it_employees AS
SELECT *
FROM employees
WHERE department = 'IT';
SELECT * FROM temp_it_employees;

SHOW tables;

INSERT INTO temp_it_employees 
(id, name, email, department, designation, joining_date, basic_salary)
VALUES (9, 'Akanksha', 'akanksha@yahoo.com', 'CS', 'Lead','2020-12-12', 40000);
SELECT * FROM temp_it_employees;

-- Views
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

CREATE OR REPLACE VIEW it_senior_employees_view AS
SELECT id, name, email, department, designation, basic_salary
FROM employees
WHERE department = 'IT'
  AND basic_salary >= 65000;
SELECT * FROM it_senior_employees_view;

DROP VIEW it_senior_employees_view;
SHOW FULL TABLES WHERE Table_Type = 'VIEW';

-- Stored Procedures
-- SP 1
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

-- Call SP 1
CALL get_employees_by_department('IT');

-- SP 2
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

-- Call SP 2
CALL get_it_employee_count(@total);
SELECT @total;

-- SP 3
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

-- Call SP 3
SET @salary = 70000;
CALL get_matching_salary(@salary);
SELECT @salary;

-- SP4
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

-- Call SP4
SET @dept = 'IT';  -- Initial value for dept_name
SET @salary = 50000; -- Initial value for dept_name

CALL employee_summary_by_department(@dept, @salary, @total);

SELECT @salary AS max_salary, @total AS employee_count;

-- DROP SPs
DROP PROCEDURE IF EXISTS get_employees_by_department;

-- Drop multiple SPs
DROP PROCEDURE IF EXISTS `employee_summary_by_department`;
DROP PROCEDURE IF EXISTS `get_it_employee_count`;
DROP PROCEDURE IF EXISTS `get_matching_salary`;

-- Triggers

ALTER TABLE employees
ADD COLUMN bonus DECIMAL(10,2),
ADD COLUMN deduction DECIMAL(10,2),
ADD COLUMN final_salary DECIMAL(10,2),
ADD COLUMN total_experience INT;

-- Create Trigger 1
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

-- Safe updates
SET SQL_SAFE_UPDATES = 0;

SELECT name, basic_salary, bonus, deduction, final_salary, total_experience FROM employees;
UPDATE employees
SET basic_salary = basic_salary;
SELECT name, basic_salary, bonus, deduction, final_salary, total_experience FROM employees;

-- Insert data
INSERT INTO employees
(name, email, department, designation, joining_date, basic_salary)
VALUES
('Rohit Malhotra', 'rohit.malhotra@gmail.com', 'IT', 'Backend Developer', '2020-05-12', 65000);
SELECT name, basic_salary, bonus, deduction, final_salary, total_experience FROM employees ORDER BY id DESC LIMIT 1;

SHOW TRIGGERS;

-- Create Trigger 2
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

-- Test again
INSERT INTO employees
(name, email, department, designation, joining_date, basic_salary)
VALUES
('Vino Thakur', 'vinod.thakur@yahoo.com', 'QA', 'Testing Manager', '2025-03-15', 60000);
SELECT name, basic_salary, bonus, deduction, final_salary, total_experience FROM employees ORDER BY id DESC LIMIT 1;

SHOW TRIGGERS;

DROP TRIGGER IF EXISTS before_update_employees;
DROP TRIGGER IF EXISTS before_insert_employees;

SHOW TRIGGERS;

-- Aliases
SELECT COUNT(*) AS total_employees FROM employees;
SELECT COUNT(*) total_employees FROM employees;

-- Functions
SELECT CONCAT(name, ' - ', department) AS employee_info
FROM employees;

SELECT CONCAT(name, ' <', email, '>') AS contact_details
FROM employees;

-- Query:

SELECT SUBSTRING(name, 2, 3) AS ExtractString 
FROM employees;

-- Query:

SELECT UPPER(name) AS upper_name
FROM employees;

-- Query:

SELECT LOWER(name) AS lower_name
FROM employees;

-- Query:

SELECT name, LENGTH(name) AS name_length
FROM employees;

-- Numeric functions
ALTER TABLE employees
ADD COLUMN monthly_tax DECIMAL(10,4);

UPDATE employees
SET monthly_tax = basic_salary * 0.0785 + id * 0.137;
SELECT basic_salary, monthly_tax FROM employees;

SELECT name, monthly_tax, ROUND(monthly_tax, 2) AS rounded_tax FROM employees;

SELECT name, monthly_tax, CEIL(monthly_tax) AS ceiled_tax FROM employees;

SELECT name, monthly_tax, FLOOR(monthly_tax) AS floored_tax FROM employees;

SELECT name, basic_salary, ABS(basic_salary - 60000) AS salary_difference FROM employees;

-- Date functions
SELECT CURDATE() AS `current_date`;

SELECT NOW() AS current_date_time;

INSERT INTO employees
(name, email, department, designation, joining_date, basic_salary)
VALUES
('Arjun Khanna', 'arjun.khanna@gmail.com', 'IT', 'Full Stack Developer', CURDATE(), 72000);
SELECT * FROM employees ORDER BY id DESC LIMIT 1;

SELECT name, DATE_FORMAT(joining_date, '%Y') AS hire_year FROM employees;

SELECT name, joining_date,
DATE_FORMAT(joining_date, '%Y') AS hire_year,
DATE_FORMAT(joining_date, '%y') AS hire_y,
DATE_FORMAT(joining_date, '%D') AS hire_day,
DATE_FORMAT(joining_date, '%d') AS hire_d,
DATE_FORMAT(joining_date, '%M') AS hire_month,
DATE_FORMAT(joining_date, '%m') AS hire_m
FROM employees;

SELECT name, joining_date, 
DATE_ADD(joining_date, INTERVAL 3 MONTH) 
AS new_joining_date FROM employees;

SELECT name, joining_date FROM employees WHERE id = 1;
UPDATE employees SET joining_date = DATE_ADD(joining_date, INTERVAL 20 DAY) where id = 1;
SELECT name, joining_date FROM employees WHERE id = 1;

SELECT 
name, joining_date, DATEDIFF(NOW(), joining_date) AS days_employed 
FROM employees 
ORDER BY days_employed DESC;

SELECT name, joining_date, EXTRACT(MONTH FROM joining_date) AS hire_month FROM employees;

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

SET GLOBAL event_scheduler = ON;

-- Events
-- One time event
CREATE EVENT update_tax_once
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
UPDATE employees
SET monthly_tax = (basic_salary * 0.1);

SELECT name, basic_salary, monthly_tax FROM employees;

CREATE EVENT update_salary_every_minute
ON SCHEDULE EVERY 1 MINUTE
DO
UPDATE employees
SET basic_salary = basic_salary + 100;

SELECT * from employees;

SHOW EVENTS;

ALTER EVENT update_salary_every_minute DISABLE;

DROP EVENT IF EXISTS update_salary_every_minute;

DROP SCHEMA db_objects;
