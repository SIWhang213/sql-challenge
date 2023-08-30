-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no AS "employee number",
	   e.last_name AS "last name", 
	   e.first_name AS "first name",
       e.sex,
       s.salary
FROM "Employees" e
JOIN "Salaries" s ON e.emp_no = s.emp_no;
	
-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT last_name AS "last name",
	   first_name AS "first name",
       hire_date AS "hire date"
FROM "Employees"
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
	
-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no AS "department number",
       d.dept_name AS "department name",
       dm.emp_no AS "employee number",
       e.last_name AS "last name",
	   e.first_name AS "first name"
FROM "Dept_manager" dm
JOIN "Employees" e ON dm.emp_no = e.emp_no
JOIN "Departments" d ON dm.dept_no = d.dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no AS "department number",
       e.emp_no AS "employee number",
	   e.last_name AS "last name",
       e.first_name AS "first name",
       d.dept_name AS "department name"
FROM "Dept_emp" de
JOIN "Employees" e ON de.emp_no = e.emp_no
JOIN "Departments" d ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name AS "first name",
       last_name AS "last name",
       sex
FROM "Employees"
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no AS "employee number",
       e.last_name AS "last name",
       e.first_name AS "first name"
FROM "Dept_emp" de
JOIN "Employees" e ON de.emp_no = e.emp_no
JOIN "Departments" d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee number",
       e.last_name AS "last name",
       e.first_name AS "first name",
       d.dept_name AS "department name"
FROM "Dept_emp" de
JOIN "Employees" e ON de.emp_no = e.emp_no
JOIN "Departments" d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM "Employees"
GROUP BY last_name
ORDER BY frequency DESC;