/*
	Sql server pivot 

	SELECT column_names
	FROM table_name
	PIVOT
	(
		AggregateFunction(ColumnToBeAggregated)
		FOR PivotColumn in (PivotColumnValues)
	) As alias
*/

drop table if EXISTS #temp_meal_cost
create table #temp_meal_cost
(
	hote_name varchar(50),
	meal_type varchar(10),
	meal_cost float
)

--Insert data to temporary table
INSERT INTO #temp_meal_cost
select h.hotel, h.meal, mc.Cost from dbo.[2018] as h
inner join dbo.meal_cost as mc
on mc.meal =h.meal

-- Create pivot table
SELECT * 
into dbo.PivotMealCost
from #temp_meal_cost
pivot
(
	sum(meal_cost)
	for meal_type in (BB,HB,FB,SC)
) as pivot_meal_cost

