/*
	Sql server unpivot

	SELECT column_names
	FROM pivot_table_name
	unpivot
	(
		ColumnToBeAggregated
		FOR Pivot_column IN (PivotColumnValues)
	)
*/

select * 
from dbo.PivotMealCost
unpivot
(
	cost
	for meal in (BB,HB,FB,SC)
) as x

