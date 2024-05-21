CREATE PROCEDURE [dbo].[usp_JobsForMajorGet]
	@major varchar(15) = NULL
AS
BEGIN
	SELECT * FROM JobTitles j
		WHERE j.Major = COALESCE(@major, Major);
END