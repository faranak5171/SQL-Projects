select job_id, format(avg(salary),'N2') avg_salary 
from [dbo].[employees]
group by job_id

DROP TABLE if EXISTS dbo.PivotAvgSalary


SELECT 'AverageSalary' as Salary_by_job_id,[3] as 'Title3',[4] as 'Title4',[5] as 'Title5'
INTO dbo.PivotAvgSalary
FROM
(
select job_id,salary
from dbo.[employees]
) as SourceTable
pivot
(
	avg(salary)
	for job_id in ([3],[4],[5])
) as pivot_salary