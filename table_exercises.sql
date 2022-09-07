USE employees;
SHOW Tables;

/* 
What different data types are present on this table? 
Answer: int, date, varchar(), enum(), date
*/
DESCRIBE employees;

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
The employees are organized by dept_no, then organized by emp_no. The tables are referenced to one another but not directly linked.
*/
SHOW CREATE TABLE dept_manager;
/* CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/