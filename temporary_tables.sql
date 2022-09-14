USE mirzakhani_1941;

-- Q1
/* CREATE TEMPORARY TABLE employees_with_departments AS (
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name 
FROM employees.employees e
JOIN employees.dept_emp de ON e.emp_no = de.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no
LIMIT 100
 ); */

CREATE TEMPORARY TABLE employees_with_departments(
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE to_date > CURTIME());

SELECT *
FROM employees_with_departments;

-- Q1a
ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);

-- Q1b
UPDATE employees_with_departments SET full_name = CONCAT(first_name,' ',last_name);

SELECT *
FROM employees_with_departments;

-- Q1c
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

SELECT *
FROM employees_with_departments;

-- Q2
USE mirzakhani_1941;

CREATE TEMPORARY TABLE my_db_payment AS (
SELECT *
FROM sakila.payment);

SELECT *
FROM my_db_payment;

-- ALTER TABLE my_db_payment MODIFY amount INT; -- change to INT
ALTER TABLE my_db_payment ADD cent_amount INT;
UPDATE my_db_payment SET cent_amount = (amount * 100); -- get cents by multiplying dollar value by 100

SELECT cent_amount
FROM my_db_payment;

-- Q3
USE mirzakhani_1941;
CREATE TEMPORARY TABLE my_db_salaries AS (
-- Returns the historic z-scores for each salary
-- Notice that there are 2 separate scalar subqueries involved
/* SELECT salary, 
    (salary - (SELECT AVG(salary) FROM employees.salaries))
    /
    (SELECT stddev(salary) FROM employees.salaries) AS zscore
FROM employees.employees e
JOIN employees.dept_emp de ON e.emp_no = de.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no
JOIN employees.salaries s ON e.emp_no = s.emp_no
LIMIT 100); */

SELECT salary, dept_name
FROM employees.employees e
JOIN employees.dept_emp de ON e.emp_no = de.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no
JOIN employees.salaries s ON e.emp_no = s.emp_no
LIMIT 100);

SELECT AVG(salary), 
    (salary - (SELECT AVG(salary) FROM employees.salaries))
    /
    (SELECT stddev(salary) FROM employees.salaries) AS zscore
FROM my_db_salaries;