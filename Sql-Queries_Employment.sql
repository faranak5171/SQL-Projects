
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


--Display all the details of the emps whose Comm. Is more than their Sal.
A) select * from emp where comm. > sal;
2.12. List the emps in the asc order of Designations of those joined after the
second half of 1981.
A) select * from emp where hiredate > (’30-jun-81’) and
to_char(hiredate,’YYYY’) = 1981 order by job asc;
2.13. List the emps along with their Exp and Daily Sal is more than Rs.100.
A) select * from emp where (sal/30) >100;
2.14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc
order.
A) select * from emp where job = ‘CLERK’ or job = ‘ANALYST’ order by job
desc;
2.15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-
80 in asc order of seniority.
A) select * from emp where hiredate in (’01-may-81’,’03-dec-81’,’17-dec-
81’,’19-jan-80’) order by hiredate asc;
2.16. List the emp who are working for the Deptno 10 or20.
A) select * from emp where deptno = 10 or deptno = 20 ;
2.17. List the emps who are joined in the year 81.
A) select * from emp where hiredate between ’01-jan-81’ and ’31-dec-81’;
2.18. List the emps who are joined in the month of Aug 1980.
C) select * from emp where hiredate between ’01-aug-80’ and ’31-aug-80’;
(OR)
select * from emp where to_char(hiredate,’mon-yyyy’) =’aug-1980;
2.19. List the emps Who Annual sal ranging from 22000 and 45000.
A) select * from emp where 12*sal between 22000 and 45000;
2.20. List the Enames those are having five characters in their Names.
A) select ename from emp where length (ename) = 5;
2.21. List the Enames those are starting with ‘S’ and with five characters.
A) select ename from emp where ename like ‘S%’ and length (ename) = 5;
2.22. List the emps those are having four chars and third character must be ‘r’.
A) select * from emp where length(ename) = 4 and ename like ‘__R%’;
2.23. List the Five character names starting with ‘S’ and ending with ‘H’.
A) select * from emp where length(ename) = 5 and ename like ‘S%H’;