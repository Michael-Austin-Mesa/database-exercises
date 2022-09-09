USE employees;

-- Q2
SELECT DISTINCT title
FROM titles;
-- Q2: 7 unique titles in companies history.

-- Q3
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- Q4
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name;

-- Q5
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- Q5: Names returned are Chleq, Lindqvist, Qiwen.

-- Q6
SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- Q7
SELECT first_name, COUNT(first_name), gender
FROM employees
WHERE first_name
IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
ORDER BY first_name;

-- Q8
SELECT COUNT(*) 
FROM (SELECT LOWER(
CONCAT(
SUBSTR(first_name, 1, 1), 
SUBSTR(last_name, 1, 4),
'_', 
SUBSTR(birth_date, 6, 2), 
SUBSTR(birth_date, 3, 2))) AS username,
-- first_name, last_name, birth_date,
COUNT(*)
FROM employees
-- WHERE COUNT(*) != 1
GROUP BY username HAVING COUNT(*) > 1 -- first_name, last_name, birth_date
ORDER BY COUNT(*) DESC) AS RESULT;
-- Q8 (Bonus): There are 13251 duplicate usesrnames.

-- Q9 (Bonus)
SELECT emp_no, AVG(salary) -- as avg_salary
FROM salaries
GROUP BY emp_no HAVING AVG(salary)
LIMIT 50;