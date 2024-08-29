CREATE TABLE employees (
    emp_no VARCHAR(10) PRIMARY KEY NOT NULL,
    emp_title VARCHAR(50) NOT NULL,
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date DATE 
);

CREATE INDEX idx_emp_title ON employees(emp_title);
CREATE INDEX idx_last_name ON employees(last_name);
CREATE INDEX idx_hire_date ON employees(hire_date);

CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE dept_emp (
    emp_no VARCHAR(10) NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no VARCHAR(10) NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no, dept_no) REFERENCES dept_emp(emp_no, dept_no)
);

CREATE TABLE salaries (
    emp_no VARCHAR(10),
    salary NUMERIC(10, 2) NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY NOT NULL,
    title VARCHAR(50)
);

SELECT * FROM employees
SELECT * FROM departments 
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM salaries 
SELECT * FROM titles