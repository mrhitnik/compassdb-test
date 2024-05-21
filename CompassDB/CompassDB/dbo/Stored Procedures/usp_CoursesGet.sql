
CREATE PROCEDURE [dbo].[usp_CoursesGet]
	@code varchar(15) = NULL,
	@name varchar(50) = NULL
AS
BEGIN
	SELECT * FROM Courses
		WHERE Code = coalesce(@code, Code) AND Name LIKE '%' + coalesce(@name, Name) + '%';
END