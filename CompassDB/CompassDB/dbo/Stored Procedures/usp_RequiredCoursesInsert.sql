CREATE PROCEDURE [dbo].[usp_RequiredCoursesInsert]
	@paramsList ut_RequiredCourses READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @major VARCHAR(15)
		DECLARE @course VARCHAR(15)
		DECLARE @semester INT
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(MAX) = ''
		DECLARE @invalidCourses AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major, Course, Semester FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major, @course, @semester

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS(SELECT 1 FROM Majors WHERE Code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				ELSE IF NOT EXISTS(SELECT 1 FROM Courses WHERE Code = @course)
					BEGIN
						IF CHARINDEX(@course,@invalidCourses) <= 0
							BEGIN
								SET @invalidCourses = @invalidCourses + @course + ', '
							END
					END
				ELSE IF NOT EXISTS(SELECT 1 FROM RequiredCourses WHERE Major = @major AND Course = @course)
					BEGIN
						INSERT INTO RequiredCourses 
							(Major, Course, Semester)
							VALUES (@major, @course, @semester);
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @major, @course, @semester
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Invalid Majors: ' + @invalidMajors + '; Invalid Courses: ' + @invalidCourses
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END