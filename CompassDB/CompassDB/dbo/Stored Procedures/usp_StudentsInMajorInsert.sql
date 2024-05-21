CREATE PROCEDURE [dbo].[usp_StudentsInMajorInsert]
	@paramsList ut_StudentsInMajor READONLY
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
				ELSE IF EXISTS(SELECT Major FROM StudentsInMajor WHERE Major = @major)
					BEGIN
						UPDATE StudentsInMajor
						SET StudentsInMajor.[Freshman] = p.[Freshman], StudentsInMajor.[Transfer] = p.[Transfer], StudentsInMajor.[White] = p.[White], StudentsInMajor.[AfricanAmerican] = p.[AfricanAmerican], StudentsInMajor.[AmericanIndian] = p.[AmericanIndian],
							StudentsInMajor.[Asian] = p.[Asian], StudentsInMajor.[OtherRaces] = p.[OtherRaces], StudentsInMajor.[Male] = p.[Male], StudentsInMajor.[Female] = p.[Female], StudentsInMajor.[OtherGenders] = p.[OtherGenders],
							StudentsInMajor.[Total] = p.[Total], StudentsInMajor.[GraduatedIn5years] = p.[GraduatedIn5years], StudentsInMajor.[AverageSalary] = p.[AverageSalary], StudentsInMajor.[AverageGPA] = p.[AverageGPA],
							StudentsInMajor.[RetensionYear1] = p.[RetensionYear1], StudentsInMajor.[RetensionYear2] = p.[RetensionYear2], StudentsInMajor.[RetensionYear3] = p.[RetensionYear3], StudentsInMajor.[RetensionYear4] = p.[RetensionYear4], 
							StudentsInMajor.[FreshmanRetension] = p.[FreshmanRetension], StudentsInMajor.[TransferRetension] = p.[TransferRetension], StudentsInMajor.[AverageGPAFreshman] = p.[AverageGPAFreshman], 
							StudentsInMajor.[AverageGPATransfer] = p.[AverageGPATransfer], StudentsInMajor.[UGResearch] = p.[UGResearch], StudentsInMajor.[GPIPEligible] = p.[GPIPEligible], StudentsInMajor.[GPIPInterns] = p.[GPIPInterns],
							StudentsInMajor.[GraduatedWithJobs] = p.[GraduatedWithJobs], StudentsInMajor.[JoinedGraduateSchool] = p.[JoinedGraduateSchool], StudentsInMajor.[StudentsTo1Faculty] = p.[StudentsTo1Faculty]
						FROM @paramsList p WHERE p.Major = StudentsInMajor.Major
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO StudentsInMajor 
							([Freshman], Major, [Transfer], [White], [AfricanAmerican], [AmericanIndian], [Asian], [OtherRaces], [Male], [Female], [OtherGenders], [Total], [GraduatedIn5years], [AverageSalary], [AverageGPA],
								[RetensionYear1], [RetensionYear2], [RetensionYear3], [RetensionYear4], [FreshmanRetension], [TransferRetension], [AverageGPAFreshman], [AverageGPATransfer], [UGResearch], [GPIPEligible],
								[GPIPInterns], [GraduatedWithJobs], [JoinedGraduateSchool], [StudentsTo1Faculty])
							SELECT [Freshman], Major, [Transfer], [White], [AfricanAmerican], [AmericanIndian], [Asian], [OtherRaces], [Male], [Female], [OtherGenders], [Total], [GraduatedIn5years], [AverageSalary], [AverageGPA],
								[RetensionYear1], [RetensionYear2], [RetensionYear3], [RetensionYear4], [FreshmanRetension], [TransferRetension], [AverageGPAFreshman], [AverageGPATransfer], [UGResearch], [GPIPEligible],
								[GPIPInterns], [GraduatedWithJobs], [JoinedGraduateSchool], [StudentsTo1Faculty]
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