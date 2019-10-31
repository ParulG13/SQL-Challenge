-- Create tables based on ERD
-- employees table
Drop TABLE if exists employees
CREATE TABLE employees (
 emp_no INT primary key NOT NULL,
 birth_date VARCHAR(12) not NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 gender VARCHAR(2) NOT NULL,
 hire_date DATE NOT NULL
);
-- import data from "data/employees.csv"
select * from employees

-- dept_emp table
drop TABLE if exists dept_emp
CREATE TABLE dept_emp (
 emp_no integer NOT NULL,
 dept_no VARCHAR(10) NOT NULL,
 from_date DATE not NULL,
 to_date DATE not NULL
);
-- import data from "data/dept_emp.csv"
select * from dept_emp
-- Modify table to add constraints
alter table dept_emp
	add id serial;
alter table dept_emp
	add constraint dept_emp_pk
		primary key (id);
alter table dept_emp
	add constraint emp_no_fk
		foreign key (emp_no) references employees;
alter table dept_emp
	add constraint dept_no_fk
		foreign key (dept_no) references departments;

-- departments table
drop TABLE if exists departments
CREATE TABLE departments (
    dept_no VARCHAR(12) primary key NOT NULL,
    dept_name VARCHAR(50) NOT NULL
);
-- import data from "data/departments.csv"
select * from departments

-- dept_mgr table
drop TABLE if exists dept_mgr
CREATE TABLE dept_mgr (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE not NULL,
    to_date DATE not NULL
);
-- import data from "data/dept_manager.csv"
select * from dept_mgr

-- Modify table to add constraints
alter table dept_mgr
	add id serial;
alter table dept_mgr
	add constraint dept_mgr_pk
		primary key (id);
alter table dept_mgr
	add constraint emp_no_fk
		foreign key (emp_no) references employees;
alter table dept_mgr
	add constraint dept_no_fk
		foreign key (dept_no) references departments;
-- salaries table
drop TABLE if exists salaries
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE not NULL,
    to_date DATE not NULL);
select * from salaries

-- Modify table to add constraints
alter table salaries
	add id serial;
alter table salaries
	add constraint salaries_pk
		primary key (id);
alter table salaries
	add constraint salaries_fk
		foreign key (emp_no) references employees;

-- titles table
drop TABLE if exists titles
CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    from_date DATE not NULL,
    to_date DATE not NULL);
select * from titles

-- Modify table to add constraints
alter table titles
	add id serial;
alter table titles
	add constraint titles_pk
		primary key (id);
alter table titles
	add constraint titles_fk
		foreign key (emp_no) references employees;