/*
	Create a temporary table to store the meal cost in 2020

	Temporary Tables are a great feature that lets you store and process intermediate results by using the same selection, update, and join capabilities
	that you can use with typical SQL Server tables.
*/

DROP TABLE IF EXISTS #temp_Cost_2020
CREATE table #temp_Cost_2020 
(
	Id int primary key identity(1,1),
	meal varchar(50),
	Cost float)

INSERT INTO #temp_Cost_2020
SELECT y.meal, mc.Cost from dbo.meal_cost mc
INNER join dbo.[2020] y
on mc.meal=y.meal

Select * from #temp_Cost_2020


Select meal,avg(cost) average_cost_2020, sum(cost) total_cost_2020, min(cost) min_cost
from #temp_Cost_2020
GROUP BY meal;

