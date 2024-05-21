
CREATE PROCEDURE [dbo].[usp_MajorsGet]
	@code varchar(10) = NULL,
	@name varchar(50) = NULL
AS
BEGIN
	SELECT * FROM Majors
		WHERE Code = coalesce(@code, Code) AND Name LIKE '%' + coalesce(@name, Name) + '%';
END
