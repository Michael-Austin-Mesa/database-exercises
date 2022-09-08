USE employees;


-- Q2
SELECT CONCAT(first_name, ' ' ,last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

-- Q3
SELECT CONCAT(UPPER(first_name),' ',UPPER(last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

-- Q4
SELECT CONCAT(first_name, ' ' ,last_name) AS full_name, datediff(CURDATE(), hire_date) AS days_employed
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY days_employed DESC;

-- Q5
SELECT MIN(salary), MAX(salary) 
FROM salaries;

-- Q6
SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(last_name, 1, 4)),'_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) AS username, first_name, last_name, birth_date
FROM employees
LIMIT 10;