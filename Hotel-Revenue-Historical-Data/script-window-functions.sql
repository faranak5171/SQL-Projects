/*
	Window Function performs a calculation across a set of table rows that are somehow related to the current row. 
	Unlike regular aggregate functions, use of a window function does not cause rows to become grouped into a single output row 
	the window function is able to access more than just the current row of the query result.

	Functions:
		Aggregate - COUNT,SUM,AVG,MIN,MAX
		Offset - FIRST_VALUE, LAST_VALUE, LEAD, LAG
		Statistical - PERCENT_RANK, CUME_DIST, PERCENTILE_COUNT, PERCENTILE_DISC
		Ranking - ROW_NUMBER, RANK, DENSE_RANK, NTILE

	Window Frames: filtered portion of partition
		Rows
		Range
		Preceding
		Current
		Following
*/

-- Without using window function
with CTE
as
(
select job_id,sum(salary) as Total_Salary_JobID, count(salary) as Count_Employee_JobID 
from [dbo].[employees]
group by job_id
) 
select * FROM CTE
inner join dbo.employees as e
on e.job_id = cte.job_id



-- window function, Aggregation functions, Ranking, frames
SELECT 
	first_name,
	last_name,
	job_id,
	salary,
	ROW_NUMBER() over (ORDER BY salary DESC) as RowNum_By_Salary,
	RANK() over (order by salary DESC) as Rank_By_Salary,
	DENSE_RANK() over (order by salary DESC) as Dense_Rank_By_Salary,
	NTILE(4) over (order by salary) as BucketNum,
	sum(salary) over (partition by job_id) as Total_Salary_JobID,
	sum(salary) over (order by salary ROWS BETWEEN UNBOUNDED PRECEDING and CURRENT ROW) as [Running Total Salary],
	sum(salary) over (order by salary ROWS BETWEEN 2 PRECEDING and CURRENT ROW) as [Running 2 Preceding salary],
	CAST(avg(salary) over (order by salary ROWS BETWEEN UNBOUNDED PRECEDING and CURRENT ROW) as DECIMAL(8,2)) as [Running Avg Salary],
	sum(salary) over () as Total_Paid_Salary,
	count(job_id) over (partition by job_id) as Count_Employee_JobID
FROM dbo.employees
order by salary

