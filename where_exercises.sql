USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
/* Q2: 709 records returned. */

SELECT *
FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya';
/* Q3: 709 records returned just like Q2. */

SELECT *
FROM employees
WHERE gender != 'F'
AND (first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya');
/* Q4: 441 records returned. */

SELECT DISTINCT *
FROM employees
WHERE last_name
LIKE 'E%';
/* Q5: 7330 records returned of employees whose last name starts with E. */

SELECT DISTINCT *
FROM employees
WHERE (last_name
LIKE '%e' 
AND last_name NOT LIKE 'E%');
/*WHERE (last_name
LIKE 'E%' ;
OR last_name LIKE '%e'); */
/* Q6: 30723 records returned of employees whose names start with E or end with e. 
23393 records returned of employes whose names end with e but do not start with E.
*/

SELECT DISTINCT *
FROM employees
WHERE last_name LIKE 'E%e';
SELECT DISTINCT *
FROM employees
WHERE last_name LIKE '%e';
/* Q7: 899 records returned of employees whose names start AND end with e. 
24292 records returned of employees whose names end with e regardless of starting with e.
*/

SELECT Count(hire_date)
FROM employees
/*WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';*/
WHERE hire_date LIKE '199%';
/* Q8: 135214 employees hired in the 90's. Count function used here since rows returned exceeded 50000. */

SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';
/* Q9: 842 employees hired with a birthday on Christmas. */

SELECT * /* Count(hire_date) */
FROM employees
W/*HERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'*/
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25';
/* Q10: 362 employees hired in the 90s with a birthday on Christmas. */

SELECT *
FROM employees
WHERE last_name LIKE '%q%';
/* Q11: 1873 employees with q in their last name. */

SELECT *
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';
/* Q12: 547 employees with q in their last name but excluding the combination 'qu'. */