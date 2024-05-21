
CREATE PROCEDURE [dbo].[usp_CoursesForMajorGet]
	@major varchar(15)
AS
BEGIN
	SELECT c.Code, c.Name, c.Summary, c.Credits FROM RequiredCourses rc INNER JOIN Courses c ON rc.Course = c.Code
		WHERE rc.Major = @major;
END