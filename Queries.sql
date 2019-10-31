-- employee number, last name, first name, gender, and salary
select e.emp_no,e.first_name,e.last_name,e.gender,s.salary
from employees as e, salaries as s
where e.emp_no = s.emp_no

--List employees who were hired in 1986
select emp_no,first_name,last_name,hire_date from employees 
where hire_date
Between '1986-01-01' 
And '1986-12-31'

--List the manager of each department with
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates
Select d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name,m.from_date,  m.to_date
From departments d
Join dept_mgr m
On d.dept_no = m.dept_no
Join employees e
On e.emp_no = m.emp_no;

-- List the department of each employee with
-- employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name ,d.dept_name
from employees as e,dept_emp as de, departments as d
where e.emp_no = de.emp_no and de.dept_no = d.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
select * 
from employees 
where first_name = 'Hercules' 
and last_name like 'B%'

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name
select e.emp_no,e.first_name,e.last_name, d.dept_name
from employees as e, dept_emp as de , departments as d
where e.emp_no = de.emp_no 
and de.dept_no = d.dept_no
and d.dept_name = 'Sales' 

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name,d.dept_name
from employees as e, dept_emp as de, departments as d
where de.emp_no = e.emp_no and de.dept_no = d.dept_no
and (d.dept_name = 'Sales' or d.dept_name = 'Development')
-- This has better performance
select e.emp_no, e.last_name, e.first_name,d.dept_name
from employees as e 
join dept_emp as de
on de.emp_no = e.emp_no
join departments as d
on de.dept_no = d.dept_no
where  d.dept_name = 'Sales' or d.dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name
SELECT e.last_name, COUNT(e.emp_no) as "last_name_count"
FROM employees as e
GROUP BY e.last_name
ORDER BY COUNT(e.emp_no) DESC

-- average salary by title
select title from titles group by title

--Epilogue
select first_name,last_name from employees 
where emp_no = 499942