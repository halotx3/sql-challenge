-- Dropping pre-existing tables if they exist
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Table Creation
CREATE TABLE departments (
	dept_no VARCHAR(25) PRIMARY KEY,
	dept_name VARCHAR(25)
);
CREATE TABLE employees (
	emp_no VARCHAR(25) PRIMARY KEY,
    birth_date date,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    gender VARCHAR(1),
    hire_date date
);
CREATE TABLE dept_emp (
	emp_no VARCHAR(25),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	dept_no VARCHAR(25),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    from_date date,
    to_date date
);
CREATE TABLE dept_manager (
	dept_no VARCHAR(25),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	emp_no VARCHAR(25),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    from_date date,
    to_date date
);

CREATE TABLE salaries (
	emp_no VARCHAR(25),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    salary INT,
    from_date date,
    to_date date
);
CREATE TABLE titles (
	emp_no VARCHAR(25),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    title VARCHAR(50),
    from_date date,
    to_date date
);