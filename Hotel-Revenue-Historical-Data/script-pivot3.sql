--2018
SELECT hotel as Total_Passengers_2018,January,February,March,April,May,June,July,August,September,October,November,December
FROM
(
select hotel, arrival_date_year,arrival_date_month,adults+children as num_passengers 
from [dbo].[2018]
) as SourceTable
PIVOT
(
	sum(num_passengers)
	for arrival_date_month in (January,February,March,April,May,June,July,August,September,October,November,December)
) as pivot_pass



-- 2019
SELECT hotel as Total_Passengers_2019,January,February,March,April,May,June,July,August,September,October,November,December
FROM
(
select hotel, arrival_date_year,arrival_date_month,adults+children as num_passengers 
from [dbo].[2019]
) as SourceTable
PIVOT
(
	sum(num_passengers)
	for arrival_date_month in (January,February,March,April,May,June,July,August,September,October,November,December)
) as pivot_pass


--2020
SELECT hotel as Total_Passengers_2020,January,February,March,April,May,June,July,August,September,October,November,December
FROM
(
select hotel, arrival_date_year,arrival_date_month,adults+children as num_passengers 
from [dbo].[2020]
) as SourceTable
PIVOT
(
	sum(num_passengers)
	for arrival_date_month in (January,February,March,April,May,June,July,August,September,October,November,December)
) as pivot_pass