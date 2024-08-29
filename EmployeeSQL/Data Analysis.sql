--employee number, last name, first name, sex, salary 
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

--first name, last name, hire date in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--department manager, department number, department name, employee number, last name, first name
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

--department number for each employee with employee number, last name, first name, department name
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN  departments d ON de.dept_no = d.dept_no;

--first name, last name, sex of each employee who's first name is Hercules and last name begins with B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
  AND last_name LIKE 'B%';

--each employee in Sales, with their employee number, last name and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

--each employee in Sales and Development with employee number, last name, first name and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE d.dept_name IN ('Sales', 'Development');

--frequency in counts, in descending order, of all employee last names
SELECT last_name,
    COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;