declare @fname varchar(30)
declare @salary int

declare cur_emp cursor for 
select first_name, salary from employees

open cur_emp
fetch next from cur_emp into @fname, @salary

while (@@FETCH_STATUS = 0)
begin
	print 'First name is ' + @fname + ' and salary amount is ' + cast(@salary as varchar(30))

	fetch next from cur_emp into @fname, @salary
end

close cur_emp
deallocate cur_emp