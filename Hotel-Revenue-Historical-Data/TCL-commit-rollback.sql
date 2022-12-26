/*
	TCL - Transaction Control Unit
	Controls transactions (any operation performed on a table using DML) in a table
	
	COMMIT - used to save changes made to the table permanently
	ROLLBACK - get back to previous temporary status
	SAVEPOINT - mark a transaction

*/

USE HotelRevenue
GO

if exists ( select * from sys.tables where name='Categories' )
	begin
		drop table Categories
	end

CREATE TABLE Categories
(
	ID int primary key identity(1,1),
	Cat_Name varchar(50) default 'main'
)

INSERT INTO Categories (Cat_Name) VALUES ('Cloths')
INSERT INTO Categories (Cat_Name) VALUES ('Bags')
INSERT INTO Categories (Cat_Name) VALUES ('Shoes')

exec spReturnAllData 'Categories'

-- Lock the rows
BEGIN TRANSACTION
-- Change all the data accidently
update Categories set Cat_Name='Pants'
-- Get back to the previous change
rollback;

BEGIN tran
-- Change to DB
update Categories set Cat_Name='Pants' where ID =1

exec spReturnAllData 'Categories'
-- Count the number of active transaction
select @@TRANCOUNT as [Transaction Count]
-- Save the change
commit;