CREATE PROCEDURE [dbo].[usp_AlumniForMajorGet]
	@major varchar(15) = NULL
AS
BEGIN
	SELECT * FROM Alumni a
		WHERE a.Major = COALESCE(@major, Major);
END