USE employees;
SHOW Tables;
/* 
Which table(s) do you think contain a numeric type column?
Answer: dept_emp, dept_manager, employees, salaries, titles

Which table(s) do you think contain a string type column?
Answer: departments, dept_emp, dept_manager, employees, titles

Which table(s) do you think contain a date type column?
Answer: dept_emp, dept_manager, employees, salaries, titles

What is the relationship between the employees and the departments tables?
Answer: The departments table has a column for dept_no which is shared in the dept_emp and dept_mananger tables.
In the dept_emp and dept_manager tables, there is a column named emp_no which is shared with the employees table. 
The employees are organized by dept_no, then organized by emp_no.
*/
DESCRIBE dept_manager;