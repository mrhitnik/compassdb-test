
CREATE PROCEDURE [dbo].[usp_CriteriaGet]
AS
	BEGIN TRY
		SELECT TABLE_NAME 'Table', COLUMN_NAME 'Criterion'
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME IN ('PreUniversity', 'University', 'PostUniversity', 'StudentsInMajor')
	END TRY
	BEGIN CATCH
		RETURN -99
	END CATCH
RETURN 1