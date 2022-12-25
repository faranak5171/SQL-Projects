
/*
	Self join
*/

-- Return all employees in the samme department
Select 
	e1.last_name, 
	e2.last_name,
	ROW_NUMBER() over (order by e1.last_name) as [Row Number]
from employees as e1, employees as e2
where e1.employee_id <> e2.employee_id
and e1.department_id = e2.department_id