
CREATE PROCEDURE [dbo].[usp_FacultyForDepartmentGet]
	@dept varchar(50) = NULL
AS
BEGIN
	SELECT * FROM Faculty f
		WHERE f.Department = COALESCE(@dept, Department);
END