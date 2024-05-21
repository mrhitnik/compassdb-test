
CREATE PROCEDURE [dbo].[usp_CoursesInsert]
	@paramsList ut_Courses READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @code VARCHAR(15)
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Code, Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @code, @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major) AND (@major NOT LIKE '%GEN')
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				ELSE IF EXISTS(SELECT Code FROM Courses WHERE Code = @code)
					BEGIN
						UPDATE Courses
						SET Courses.[Name] = p.[Name], Courses.Summary = p.Summary, Courses.Major = p.Major, Courses.Credits = p.Credits, Courses.[Hours] = p.[Hours],
							Courses.TotalA = p.TotalA, Courses.TotalB = p.TotalB, Courses.TotalC = p.TotalC, Courses.TotalD = p.TotalD, Courses.TotalF = p.TotalF,
							Courses.TotalW = p.TotalW, Courses.TotalStudents = p.TotalStudents, Courses.AverageClassSize = p.AverageClassSize, Courses.RecommendedSem = p.RecommendedSem
						FROM @paramsList p WHERE p.Code = @code AND Courses.Code = @code
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO Courses 
							([Name], Code, Summary, Major, Credits, [Hours], TotalA, TotalB, TotalC, TotalD, TotalF, TotalW, TotalStudents, AverageClassSize, RecommendedSem)
							SELECT [Name], Code, Summary, Major, Credits, [Hours], TotalA, TotalB, TotalC, TotalD, TotalF, TotalW, TotalStudents, AverageClassSize, RecommendedSem  
							FROM @paramsList WHERE Major = @major
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @code, @major
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows; Invalid Majors: ' + @invalidMajors
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END