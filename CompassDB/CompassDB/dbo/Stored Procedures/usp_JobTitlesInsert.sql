
CREATE PROCEDURE [dbo].[usp_JobTitlesInsert]
	@paramsList ut_JobTitles READONLY
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
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				ELSE IF EXISTS(SELECT Major FROM JobTitles WHERE Major = @major)
					BEGIN
						UPDATE JobTitles
						SET JobTitles.Title = p.Title, JobTitles.Tasks = p.Tasks, JobTitles.Skills = p.Skills, JobTitles.Knowledge = p.Knowledge, 
							JobTitles.Abilities = p.Abilities, JobTitles.MedianPay = p.MedianPay
						FROM @paramsList p WHERE p.Major = JobTitles.Major
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO JobTitles 
							(Title, Major, Tasks, Skills, Knowledge, Abilities, MedianPay)
							SELECT Title, Major, Tasks, Skills, Knowledge, Abilities, MedianPay
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