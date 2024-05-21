CREATE PROCEDURE [dbo].[usp_PostUniversityInsert]
	@paramsList ut_PostUniversity READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(100) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS(SELECT 1 FROM Majors WHERE Code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				ELSE IF EXISTS(SELECT 1 FROM PostUniversity WHERE Major = @major)
					BEGIN
						UPDATE PostUniversity
						SET PostUniversity.[AverageAge] = p.[AverageAge], PostUniversity.[MedianSalaryPerYear] = p.[MedianSalaryPerYear], PostUniversity.[WorkExperience] = p.[WorkExperience], PostUniversity.[JobsCount] = p.[JobsCount], 
							PostUniversity.[CurrentWorkforce] = p.[CurrentWorkforce], PostUniversity.[Requirements] = p.[Requirements], PostUniversity.[WorkEnvironment] = p.[WorkEnvironment], 
							PostUniversity.[WorkSchedule] = p.[WorkSchedule], PostUniversity.[MedianSalaryPerHour] = p.[MedianSalaryPerHour], PostUniversity.[ExpectedGrowth] = p.[ExpectedGrowth],
							PostUniversity.[Male] = p.[Male], PostUniversity.[Female] = p.[Female], PostUniversity.[OtherGenders] = p.[OtherGenders], PostUniversity.DegreesAwards = p.DegreesAwards,
							PostUniversity.DegreesGrowth = p.DegreesGrowth
						FROM @paramsList p WHERE p.Major = PostUniversity.Major
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO PostUniversity 
							([Major], [AverageAge], [MedianSalaryPerYear], [WorkExperience], [JobsCount], [CurrentWorkforce], [Requirements], [WorkEnvironment], [WorkSchedule], [MedianSalaryPerHour], [ExpectedGrowth], 
								[Male], [Female], [OtherGenders], DegreesAwards, DegreesGrowth)
							SELECT [Major], [AverageAge], [MedianSalaryPerYear], [WorkExperience], [JobsCount], [CurrentWorkforce], [Requirements], [WorkEnvironment], [WorkSchedule], [MedianSalaryPerHour], [ExpectedGrowth],
								[Male], [Female], [OtherGenders], DegreesAwards, DegreesGrowth
							FROM @paramsList WHERE Major = @major
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @major
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows; Invalid Majors: ' + @invalidMajors
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END