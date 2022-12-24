/*
	CTE - Common Table Expression
	CTE is used to manipulate the complex subquerries data and do recursive queries.
	Calculate the revenue of each hotel within 3 years
*/

with hotels_3years as(
select * from dbo.[2018]
union 
select * from dbo.[2019]
union
select * from dbo.[2020])
select arrival_date_year,hotel,mc.meal,mc.Cost, ms.market_segment, round(sum((stays_in_week_nights + stays_in_weekend_nights)*adr),2) as total_revenue
from hotels_3years
LEFT JOIN dbo.market_segment as ms
on ms.market_segment = hotels_3years.market_segment
LEFT JOIN dbo.meal_cost as mc
on mc.meal = hotels_3years.meal
group by arrival_date_year, hotel, ms.market_segment, mc.meal, mc.cost
ORDER BY arrival_date_year,hotel


--  employees' hierarchy at organization
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