/*
	CROSS JOIN - pair each row in a table with all the rows of another table.
*/


DROP TABLE IF EXISTS #temp_month
CREATE TABLE #temp_month
(
	id int primary key identity(1,1),
	month varchar(50)
)
INSERT INTO #temp_month (month) VALUES('Jan')
INSERT INTO #temp_month (month) VALUES('Feb')
INSERT INTO #temp_month (month) VALUES('Mar')
INSERT INTO #temp_month (month) VALUES('Apr')
INSERT INTO #temp_month (month) VALUES('May')
INSERT INTO #temp_month (month) VALUES('Jun')
INSERT INTO #temp_month (month) VALUES('July')
INSERT INTO #temp_month (month) VALUES('Aug')
INSERT INTO #temp_month (month) VALUES('Sep')
INSERT INTO #temp_month (month) VALUES('Oct')
INSERT INTO #temp_month (month) VALUES('Nov')
INSERT INTO #temp_month (month) VALUES('Desc')


DECLARE @result TABLE
(
	hotelname varchar(50),
	bb decimal(8,2),
	hb decimal(8,2),
	fb decimal(8,2), 
	sc decimal(8,2)
)
INSERT INTO @result
EXEC spReturnAllData @TableName='PivotMealCost'

DECLARE @result2 TABLE(id int,month varchar(20))
INSERT INTO @result2
EXEC spReturnAllData '#temp_month'

select 
	hotelname, 
	bb,
	CAST(bb/12 as decimal(8,2)) as BB_Month,
	hb,
	CAST(hb/12 as decimal(8,2)) as HB_Month,
	fb,
	CAST(fb/12 as decimal(8,2)) as FB_Month,
	sc,
	CAST(sc/12 as decimal(8,2)) as SC_Month
from @result CROSS JOIN @result2