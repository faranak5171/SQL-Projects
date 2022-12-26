/*
	TRY...CATCH : construct catches all execution errors
*/


IF OBJECT_ID ('spReturnEmpDepartment','P') IS NOT NULL
	BEGIN
		DROP PROCEDURE spReturnEmpDepartment
	END

GO
CREATE PROCEDURE spReturnEmpDepartment
	@DepartmentID int
AS
BEGIN
	SELECT * FROM dbo.employees where department_id=@DepartmentID
END



GO
BEGIN TRY
	exec spReturnEmpDepartment 10;
END TRY
BEGIN CATCH
	select * from dbo.employees;
END CATCH