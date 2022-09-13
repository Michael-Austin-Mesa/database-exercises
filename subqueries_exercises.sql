USE employees;

-- Q1: Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT first_name, last_name, hire_date, emp_no
FROM employees
WHERE hire_date = 
(SELECT hire_date FROM employees 
WHERE emp_no = '101010');

-- Q2: Find all the titles ever held by all current employees with the first name Aamod.

SELECT *
FROM titles
WHERE emp_no IN 
(SELECT e.emp_no
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
WHERE e.first_name = 'Aamod'
AND de.to_date = '9999-01-01'
ORDER BY emp_no)
ORDER By emp_no, title;

/* SELECT e.emp_no
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
WHERE e.first_name = 'Aamod'
AND de.to_date = '9999-01-01'
ORDER BY emp_no; */

-- Q3: How many people in the employees table are no longer working for the company?
SELECT COUNT(*)
FROM employees
WHERE emp_no IN (SELECT emp_no
FROM dept_emp WHERE to_date < NOW());
-- Q3: 85108 employees have left the company

-- Q4: Find all the current department managers that are female. 
SELECT *
FROM employees
WHERE emp_no IN
(SELECT emp_no
FROM dept_manager
WHERE to_date > NOW())
AND gender = 'F';
-- Q4: Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil

-- Q5: Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT *
FROM employees AS e
JOIN salaries AS s
ON s.emp_no = e.emp_no
WHERE s.salary > (SELECT AVG(salary) FROM salaries)
AND s.to_date = '9999-01-01'
ORDER BY s.salary;


-- Q6: How many current salaries are within 1 standard deviation of the current highest salary?
-- What percentage of all salaries is this? STDDEV()

SELECT STD(salary) -- STD of all salaries is about 16905
FROM salaries;

SELECT COUNT(salary) AS salaries_one_STD_away_from_MAX
FROM salaries
WHERE salary >= 
(SELECT MAX(salary) FROM salaries WHERE to_date = '9999-01-01') - 
(SELECT STD(salary) FROM salaries WHERE to_date = '9999-01-01')
AND to_date = '9999-01-01';
-- Q6: 83 current salaries within 1 STD away from MAX

SELECT CONCAT(
((SELECT COUNT(salary)
FROM salaries
WHERE salary >= 
(SELECT MAX(salary) FROM salaries 
WHERE to_date = '9999-01-01') - 
(SELECT STD(salary) FROM salaries 
WHERE to_date = '9999-01-01')
AND to_date = '9999-01-01')/
COUNT(salary))*100,'%') AS percentage_of_salaries
FROM salaries;
-- Q6: 0.0029% of all salaries are within 1 STD of the MAX

-- BONUS 1: Find all the department names that currently have female managers.
SELECT dept_name
FROM departments
WHERE dept_no IN 
(SELECT dept_no 
FROM dept_manager AS dm
JOIN employees AS e
ON dm.emp_no = e.emp_no
WHERE e.gender = 'F' AND dm.to_date = '9999-01-01');

-- BONUS 2: 
