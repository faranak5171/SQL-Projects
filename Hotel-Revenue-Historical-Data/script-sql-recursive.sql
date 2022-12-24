/*
	Sql Recursive with join
	employees' hierarchy at organization
*/
with hier_emp as
(
	select employee_id,first_name,last_name,manager_id, 1 as manager_level,
	cast(cast(employee_id as varchar) + ',' as varchar(250)) as emp_connections,
	first_name as manager1,
	cast(null as varchar(50)) as manager2,
	cast(null as varchar(50)) as manager3,
	cast(null as varchar(50)) as manager4
	from dbo.employees where manager_id is null
	union all
	select e.employee_id,e.first_name,e.last_name,e.manager_id, manager_level+1 as manager_level,
	cast(emp_connections + cast(e.employee_id as varchar) + ',' as varchar(250)),
	case when manager_level=1 then hier_emp.first_name else hier_emp.manager1 end as manager1,
	case when manager_level=2 then e.first_name else hier_emp.manager2 end as manager2,
	case when manager_level=3 then e.first_name else hier_emp.manager3 end as manager3,
	case when manager_level=4 then e.first_name else hier_emp.manager4 end as manager4
	from hier_emp 
	inner join employees as e 
	on e.manager_id = hier_emp.employee_id
)
SELECT * from hier_emp