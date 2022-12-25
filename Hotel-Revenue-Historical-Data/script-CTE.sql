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
