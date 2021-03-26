--1. List details of each employee
SELECT data_employees.emp_no,
data_employees.last_name,
data_employees.first_name,
data_employees.gender,
salaries.salary
FROM data_employees
LEFT JOIN salaries
ON data_employees.emp_no = salaries.emp_no
ORDER by emp_no;

--2. List first and last names, and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date 
FROM data_employees
WHERE DATE_PART ('year', hire_date) = 1986
ORDER BY emp_no;

--3. List manager of each dept  including dept #, dept name, manager's employee #, last name, first name
SELECT dept_mgr.emp_no, 
dept_mgr.dept_no,
department.dept_name,
data_employees.last_name,
data_employees.first_name
FROM dept_mgr 
INNER JOIN department
ON dept_mgr.dept_no = department.dept_no
LEFT JOIN data_employees
ON dept_mgr.emp_no = data_employees.emp_no
ORDER BY emp_no;

--4. List the dept of each employee including emp #, last name, first name, dept name
SELECT data_employees.emp_no,
data_employees.last_name,
data_employees.first_name,
dept_empl.dept_no,
department.dept_name
FROM data_employees
INNER JOIN dept_empl ON data_employees.emp_no = dept_empl.emp_no
INNER JOIN department ON department.dept_no = dept_empl.dept_no
ORDER BY emp_no;

--5. List first name, last name, gender  for employees whose first name is "Hercules"
--and last name begins with"B"
SELECT *
FROM data_employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the sales dept, incl empl #, last name, first name, dept name
SELECT 
data_employees.emp_no,
data_employees.last_name,
data_employees.first_name,
dept_empl.dept_no,
department.dept_name
FROM data_employees
LEFT JOIN dept_empl
ON data_employees.emp_no = dept_empl.emp_no
INNER JOIN department
ON department.dept_no = dept_empl.dept_no
WHERE department.dept_name = 'Sales';

--7. List all employees in the Sales & Dev depts, incl empl #, last name, first name, dept name
SELECT 
data_employees.emp_no,
data_employees.last_name,
data_employees.first_name,
dept_empl.dept_no,
department.dept_name
FROM data_employees
LEFT JOIN dept_empl
ON data_employees.emp_no = dept_empl.emp_no
INNER JOIN department
ON department.dept_no = dept_empl.dept_no
WHERE department.dept_name in ('Sales', 'Development');

--8. In descending order, list the frequency count of empl last names
SELECT last_name, COUNT(*) AS freq_count
FROM data_employees
GROUP BY last_name
ORDER BY freq_count DESC;
