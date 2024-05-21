

CREATE PROCEDURE [dbo].[usp_CoursePrerequisitesGet]
	@course varchar(15)
AS
BEGIN
	SELECT Prerequisite FROM Prerequisites WHERE Course = @course;
END