USE employees;

SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;
/* Q2: Zykh, Zyda, Zwicker, Zweizig, Zumaque, 
Zultner, Zucker, Zuberek, Zschoche, Zonker. */

SELECT first_name, last_name
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5;
/* Q3: Alselm Cappello, Utz Mandell, Bouchung Schreiter, 
Baocai Kushner, Petter Stroustrup. */

SELECT first_name, last_name
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;
/* Q4: OFFSET is related to our page number by 
going over a page's results (which is determined by LIMIT)
in multiples of the designated LIMIT. For example,
if we are using LIMIT at 5 on 'page 1', then we OFFSET the next page by 5 to
get the next set of 5 results. This next page would be our 'page 2'.
We do this so we are not overbearing our query with huge amounts of data multiple times.
*/