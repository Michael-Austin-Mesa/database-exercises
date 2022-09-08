USE employees;

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC;
/* Q2: First row name is Irena Reutenauer. Last row name is Vidya Simmen. */

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC, last_name ASC;
/* Q3: First row name is Irena Acton. Last row name is Vidya Zweizig. */

SELECT last_name, first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name ASC, first_name ASC;
/* Q4: First row name is Irena Acton. Last row name is Maya Zyda. */

SELECT DISTINCT *
FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY emp_no ASC;
/* Q5: 899 employees returned. First employee is emp_no: 10021, name: Ramzi Erde. 
Last employee is emp_no: 499648, name: Erde Tadahiro. */

SELECT DISTINCT *
FROM employees
WHERE last_name LIKE 'E%e'
ORDER BY hire_date DESC;
/* Q6: 899 employees returned. Newest employee name is Eldridge Teiji. 
Oldest employee name is Erde Sergi. */

SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;
/* Q7: 362 employees returned. Oldest employee hired last is named Bernini Khun. 
Youngest employee hired first is named Douadi Pettis. */