

CREATE PROCEDURE [dbo].[usp_PrerequisitesInsert]
	@paramsList ut_Prerequisites READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @course VARCHAR(15)
		DECLARE @prerequisite VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @invalidCourses AS VARCHAR(MAX) = ''
		DECLARE @invalidPrerequisites AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Course, Prerequisite FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @course, @prerequisite

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS(SELECT 1 FROM Courses WHERE Code = @course)
					BEGIN
						IF CHARINDEX(@course,@invalidCourses) <= 0
							BEGIN
								SET @invalidCourses = @invalidCourses + @course + ', '
							END
					END
				ELSE IF NOT EXISTS(SELECT 1 FROM Courses WHERE Code = @prerequisite)
					BEGIN
						IF CHARINDEX(@prerequisite,@invalidPrerequisites) <= 0
							BEGIN
								SET @invalidPrerequisites = @invalidPrerequisites + @prerequisite + ', '
							END
					END
				ELSE IF NOT EXISTS(SELECT 1 FROM Prerequisites WHERE Course = @course AND Prerequisite = @prerequisite)
					BEGIN
						INSERT INTO Prerequisites (Course, Prerequisite)
							VALUES (@course, @prerequisite);
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @course, @prerequisite
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Invalid Courses: ' + @invalidCourses + '; Invalid Prerequisites: ' + @invalidPrerequisites;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END