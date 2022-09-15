USE employees;

-- Q1
SELECT DISTINCT first_name, last_name, from_date, to_date,
CASE 
WHEN to_date > NOW() THEN '1'
WHEN to_date < NOW() THEN '0'
END AS is_current_employee
FROM dept_emp
JOIN employees USING(emp_no);

-- Q2
SELECT first_name, last_name,
CASE
WHEN last_name LIKE 'A%' OR last_name LIKE 'B%' OR last_name LIKE 'C%' OR
	 last_name LIKE 'D%' OR last_name LIKE 'E%' OR last_name LIKE 'F%' OR
	 last_name LIKE 'G%' OR last_name LIKE 'H%' 
     THEN 'A-H'
     
WHEN last_name LIKE 'I%' OR last_name LIKE 'J%' OR last_name LIKE 'K%' OR
	 last_name LIKE 'L%' OR last_name LIKE 'M%' OR last_name LIKE 'N%' OR
	 last_name LIKE 'O%' OR last_name LIKE 'P%' OR last_name LIKE 'Q%' 
     THEN 'I-Q'
     
WHEN last_name LIKE 'R%' OR last_name LIKE 'S%' OR last_name LIKE 'T%' OR
	 last_name LIKE 'U%' OR last_name LIKE 'V%' OR last_name LIKE 'W%' OR
	 last_name LIKE 'X%' OR last_name LIKE 'Y%' OR last_name LIKE 'Z%' 
     THEN 'R-Z'
  END AS alpha_group
FROM employees;
  
-- Q3
SELECT 
COUNT(CASE WHEN birth_date LIKE '199%' THEN birth_date END ) AS born_in_90s,
COUNT(CASE WHEN birth_date LIKE '198%' THEN birth_date END ) AS born_in_80s,
COUNT(CASE WHEN birth_date LIKE '197%' THEN birth_date END ) AS born_in_70s,
COUNT(CASE WHEN birth_date LIKE '196%' THEN birth_date END ) AS born_in_60s,
COUNT(CASE WHEN birth_date LIKE '195%' THEN birth_date END ) AS born_in_50s,
COUNT(CASE WHEN birth_date LIKE '194%' THEN birth_date END ) AS born_in_40s
FROM employees;

SELECT dept_name
FROM departments;

-- Q4
SELECT dept_name,
   CASE
       WHEN dept_name IN ('research', 'development') THEN 'R&D'
       WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
       WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
       ELSE dept_name
   END AS dept_group
FROM departments;

SELECT
AVG(CASE WHEN dept_name IN ('research', 'development') THEN salary END) AS rd_avg_salary,
AVG(CASE WHEN dept_name IN ('sales', 'marketing') THEN salary END) AS sm_avg_salary,
AVG(CASE WHEN dept_name IN ('Production', 'Quality Management') THEN salary END) AS pqm_avg_salary,
AVG(CASE WHEN dept_name IN ('Finance', 'HR') THEN salary END) AS fhr_avg_salary,
AVG(CASE WHEN dept_name IN ('Customer Service') THEN salary END) AS cs_avg_salary
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)
WHERE salaries.to_date > NOW();