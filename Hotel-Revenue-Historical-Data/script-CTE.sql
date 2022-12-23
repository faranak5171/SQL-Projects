/*
	CTE - Common Table Expression
	manipulate the complex subquerries data
	Calculate the revenue of each hotel within 3 years
*/

with hotel_3years as(
select * from dbo.[2018]
union 
select * from dbo.[2019]
union
select * from dbo.[2020])

select arrival_date_year,hotel,mc.meal,mc.Cost, ms.market_segment, round(sum((stays_in_week_nights + stays_in_weekend_nights)*adr),2) as total_revenue
from hotel_3years
LEFT JOIN dbo.market_segment as ms
on ms.market_segment = hotel_3years.market_segment
LEFT JOIN dbo.meal_cost as mc
on mc.meal = hotel_3years.meal
group by arrival_date_year, hotel, ms.market_segment, mc.meal, mc.cost
ORDER BY arrival_date_year,hotel