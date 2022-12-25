/*
	Stored Procedures
*/

CREATE PROCEDURE spReturnPostalCode
	@State_Province varchar(50),
	@City varchar(50),
	@PostalCode int OUTPUT
AS
BEGIN
	SELECT
		@PostalCode = postal_code
	FROM dbo.locations
	WHERE state_province = @State_Province
	AND city = @City
END



DECLARE @Post int
EXEC dbo.spReturnPostalCode 
@State_Province = 'Texas',
@City ='Southlake',
@PostalCode = @Post OUTPUT
select @Post as [Postal Code]