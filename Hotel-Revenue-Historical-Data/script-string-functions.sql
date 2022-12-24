/*
	String functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

SELECT trim(hotel) FROM dbo.[2018]

SELECT RTRIM(hotel) FROM dbo.[2018]

SELECT replace(deposit_type,'Without', 'No') FROM dbo.[2018]
where deposit_type='No Deposit'

select SUBSTRING(hotel,1,6) from dbo.[2018]

select hotel,lower(hotel) lowecase, upper(hotel) uppercase from dbo.[2018]