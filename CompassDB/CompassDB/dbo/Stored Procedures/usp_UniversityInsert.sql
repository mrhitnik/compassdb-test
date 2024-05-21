CREATE PROCEDURE [dbo].[usp_UniversityInsert]
	@paramsList ut_University READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				ELSE IF EXISTS(SELECT Major FROM University WHERE Major = @major)
					BEGIN
						UPDATE University
						SET University.[SampleCurriculam] = p.[SampleCurriculam], University.[FinancialAid] = p.[FinancialAid], University.[Safety] = p.[Safety], University.[DegreesAwarded] = p.[DegreesAwarded], 
							University.[DegreesAwardedBS] = p.[DegreesAwardedBS], University.[DegreesAwardedMS] = p.[DegreesAwardedMS], University.[DegreesAwardedPhD] = p.[DegreesAwardedPhD], 
							University.[CostOfAttendance] = p.[CostOfAttendance], University.[TuitionInState] = p.[TuitionInState], University.[TuitionOutOfState] = p.[TuitionOutOfState],
							University.[BoardCosts] = p.[BoardCosts], University.[Male] = p.[Male], University.[Female] = p.[Female], University.[OtherGenders] = p.[OtherGenders],
							University.[White] = p.[White], University.[AfricanAmerican] = p.[AfricanAmerican], University.[AmericanIndian] = p.[AmericanIndian], University.[Asian] = p.[Asian], 
							University.[OtherRaces] = p.[OtherRaces], University.[AcceptanceRate] = p.[AcceptanceRate], University.[AverageGPA] = p.[AverageGPA], 
							University.[StudentsTo1Faculty] = p.[StudentsTo1Faculty], University.[GraduationRate4Year] = p.[GraduationRate4Year], University.[GraduationRate6Year] = p.[GraduationRate6Year], University.[RetentionRate] = p.[RetentionRate],
							University.[PlacementRate] = p.[PlacementRate], University.[AverageClassSize] = p.[AverageClassSize]
						FROM @paramsList p WHERE p.Major = University.Major
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO University 
							([SampleCurriculam], Major, [FinancialAid], [Safety], [DegreesAwarded], [DegreesAwardedBS], [DegreesAwardedMS], [DegreesAwardedPhD], [CostOfAttendance], [TuitionInState], [TuitionOutOfState], 
								[BoardCosts], [Male], [Female], [OtherGenders],	[White], [AfricanAmerican], [AmericanIndian], [Asian], [OtherRaces], [AcceptanceRate], [AverageGPA], [StudentsTo1Faculty], [GraduationRate4Year], 
								[GraduationRate6Year],	[RetentionRate], [PlacementRate], [AverageClassSize])
							SELECT [SampleCurriculam], Major, [FinancialAid], [Safety], [DegreesAwarded], [DegreesAwardedBS], [DegreesAwardedMS], [DegreesAwardedPhD], [CostOfAttendance], [TuitionInState], [TuitionOutOfState],
								[BoardCosts], [Male], [Female], [OtherGenders],	[White], [AfricanAmerican], [AmericanIndian], [Asian], [OtherRaces], [AcceptanceRate], [AverageGPA], [StudentsTo1Faculty], [GraduationRate4Year],
								[GraduationRate6Year], [RetentionRate], [PlacementRate], [AverageClassSize]
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