-- Aggrgation
CREATE DATABASE company_db;
USE company_db;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employees VALUES
(101, 'Amit',    'Engineering', 35000, '2020-01-15'),
(102, 'Neha',    'QA',          28000, '2021-03-20'),
(103, 'Rahul',   'Engineering', 42000, '2019-11-10'),
(104, 'Priya',   'HR',          25000, '2022-06-05'),
(105, 'Karan',   'QA',          30000, '2020-09-12'),
(106, 'Sneha',   'HR',          27000, '2023-01-08'),
(107, 'Rohit',   'Engineering', 39000, '2018-07-19'),
(108, 'Mina',    'Sales',       32000, '2021-12-01'),
(109, 'Ankit',   'Sales',       29000, '2022-04-18'),
(110, 'Pooja',   'Engineering', 45000, '2017-02-25');

SELECT * FROM employees;

-- count
SELECT COUNT(*) AS total_employees
FROM employees;

SELECT COUNT(*) AS total_employees
FROM employees
WHERE department = 'QA'
OR department = 'Engineering';

SELECT COUNT(*)
FROM employees
WHERE salary > 30000;

-- min
SELECT MIN(salary) AS min_salary
FROM employees;

SELECT MIN(joining_date) AS earliest_joining_date
FROM employees;

-- max
SELECT MAX(salary) AS max_salary
FROM employees;

SELECT MAX(joining_date) AS latest_joining_date
FROM employees;

-- sum
SELECT SUM(salary) AS total_salary
FROM employees;

-- average
SELECT AVG(salary) AS avg_salary
FROM employees;

-- round off
SELECT ROUND(AVG(salary), 2) AS avg_salary
FROM employees;

-- Group By
SELECT department, COUNT(*) AS total_employees
FROM employees GROUP BY department;

SELECT department, ROUND(AVG(salary),2) AS average_salary
FROM employees GROUP BY department;

SELECT department, SUM(salary) AS total_salary
FROM employees GROUP BY department;

SELECT department, MAX(salary) AS highest_salary
FROM employees GROUP BY department;

-- Having
SELECT department,
       COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

SELECT department,
       ROUND(AVG(salary),2) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 30000;

SELECT department,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

SELECT department,
       MAX(salary) AS highest_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 40000;

SELECT department,
       ROUND(AVG(salary),2) AS average_salary
FROM employees
WHERE salary > 25000
GROUP BY department
HAVING AVG(salary) > 30000;

SELECT department, MIN(joining_date) AS first_employee
FROM employees GROUP BY department;