
-- Display all the information of the EMP table?
select * from PortfoiloProject..Employment

-- Display unique Jobs from EMP table?
select distinct job from Employment

-- List the emps in the asc order of their Salaries?
select * from Employment order by salery asc

-- List the details of the emps in asc order of the Dptnos and desc of Jobs?
select * from Employment order by deptno ASC,job

-- Display all the unique job groups in the descending order?
select distinct job from Employment order by job desc

-- Display all the details of all ‘Mgrs’
select * from Employment where empno in (select mgr from Employment)

--List the emps who joined before 2020.
select * from Employment where hire_date < ('2020-01-01')

--List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.
select 
	empno, ename,salary, salary/30 as salery_day, salary*12 as Annual_Salary
from Employment order by Annual_Salary asc

--Display the Empno, Ename, job, Hiredate, work_experience in months of all managers
select 
	empno, ename, job, hire_date,datediff(month, getdate(),hire_date) as Work_Exp_Month
from Employment
where empno in (select mgr from Employment)

--Display the Empno, Ename, job, Hiredate, work_experience in years of all managers
select
	empno, ename, job, hire_date, datediff(year, getdate(), hire_date) as Work_Exp_Year
from Employment
where empno in (select mgr from Employment)

--List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.
select 
	empno, ename, salary, datediff(year, getdate(), hire_date) as Work_Exp_Year
from Employment
where mgr=7369


--Display all the details of the emps whose commision amount is more than their Sal.
select * from Employment where commision > salary

--List the emps in the asc order of Designations of those joined after the second half of 1981.
select *, year(hire_date) as Start_Year from Employment where hire_date > ('1981-06-30') order by hire_date asc

--List the emps along with their experience and Daily Salary is more than Rs.50
select * from Employment where (salary/30) > 50;

--List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.
select * from Employment where job in ('clerk','analyst') order by job desc

--List the Enames those are having five characters in their Names.
select ename from Employment where len(ename)=5

--List the Five character names starting with ‘S’ and ending with ‘H’.
select * from Employment where len(ename)=5 and ename like 's%h'

