CREATE PROCEDURE [dbo].[usp_AlumniInsert]
	@paramsList ut_Alumni READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @profileUrl NVARCHAR(MAX)
		DECLARE @major NVARCHAR(30)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major, ProfileUrl FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major, @profileUrl

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check if the major name is valid
				IF NOT EXISTS(SELECT Code FROM Majors WHERE code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				-- Check if the alumni profile already exists
				ELSE IF EXISTS(SELECT ProfileUrl FROM Alumni WHERE ProfileUrl = @profileUrl)
					BEGIN
						UPDATE Alumni
						SET Alumni.[Name] = p.[Name], Alumni.[Graduation] = p.[Graduation], Alumni.[PhotoUrl] = p.[PhotoUrl], Alumni.[Employment] = p.[Employment], 
						Alumni.[Major] = p.[Major], Alumni.[DateCollected] = p.[DateCollected]
						FROM @paramsList p WHERE p.ProfileUrl = Alumni.ProfileUrl
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO Alumni 
							([Name], [Graduation], [PhotoUrl], [Employment], [ProfileUrl], [Major], [DateCollected])
							SELECT [Name], [Graduation], [PhotoUrl], [Employment], [ProfileUrl], [Major], [DateCollected]
							FROM @paramsList WHERE ProfileUrl = @profileUrl
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @major, @profileUrl
			END

		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows; Invalid Majors: ' + @invalidMajors
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END