USE join_example_db;

-- Join Example: 4 results, 0 nulls
SELECT users.name AS user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

-- Left Join Example: 6 results, 2 are null
SELECT users.name AS user_name, roles.name as role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- Right Join Example: 5 results, 1 is null
SELECT users.name AS user_name, roles.name as role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

USE employees;

-- Q2: Write a query that shows each department along with the name of the current manager for that department.
SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY dept_name;

-- Q3: Find the name of all departments currently managed by women.
SELECT d.dept_name AS Department_Name, 
CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager, gender
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F'
ORDER BY dept_name;

-- Q4: Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS Title, COUNT(t.emp_no) AS Title_Count
FROM titles AS t
JOIN dept_emp AS de
  ON de.emp_no = t.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND d.dept_name = 'Customer Service' AND t.to_date = '9999-01-01'
GROUP BY t.title -- HAVING de.to_date = '9999-01-01'
ORDER BY t.title;

-- Q5: Find the current salary of all current managers.
SELECT d.dept_name AS Department_Name, 
CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager,
salary AS Current_Salary
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
JOIN salaries as s
ON dm.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
ORDER BY dept_name;

-- Q6: Find the number of current employees in each department.
SELECT d.dept_no, d.dept_name, COUNT(de.emp_no) AS num_employees
FROM departments AS d
JOIN dept_emp AS de
ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
GROUP BY dept_no
ORDER BY dept_no;

-- Q7: Which department has the highest average salary? Hint: Use current not historic information.
SELECT d.dept_name, AVG(salary) AS average_salary
FROM departments AS d
JOIN dept_emp AS de
ON de.dept_no = d.dept_no
JOIN salaries AS s
ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- Q8: Who is the highest paid employee in the Marketing department?
SELECT e.first_name, e.last_name -- MAX(salary)
FROM employees AS e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON de.dept_no = d.dept_no
JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01' AND d.dept_name = 'Marketing'
GROUP BY first_name, last_name
ORDER BY MAX(salary) DESC
LIMIT 1;

-- Q9: Which current department manager has the highest salary?
SELECT d.dept_name AS Department_Name, 
CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager,
salary AS Current_Salary
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = dm.dept_no
JOIN salaries as s
ON dm.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY Department_Manager, Department_Name, salary
ORDER BY MAX(salary) DESC
LIMIT 1;

-- Q10: Determine the average salary for each department. 
SELECT 
    dept_name, ROUND(AVG(salary)) AS average_salary
FROM
    salaries AS s
        JOIN
    dept_emp AS de ON de.emp_no = s.emp_no
        JOIN
    departments AS d ON de.dept_no = d.dept_no
GROUP BY dept_name
ORDER BY average_salary DESC;
