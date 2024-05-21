CREATE PROCEDURE [dbo].[usp_FacultyInsert]
	@paramsList ut_Faculty READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @email NVARCHAR(30)
		DECLARE @dept NVARCHAR(30)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidDepts AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Department, Email FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @dept, @email

		SELECT DISTINCT Department INTO #departments FROM Majors

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check if the department name is valid
				IF NOT EXISTS(SELECT Department FROM #departments WHERE Department = @dept)
					BEGIN
						IF CHARINDEX(@dept,@invalidDepts) <= 0
							BEGIN
								SET @invalidDepts = @invalidDepts + @dept + ', '
							END
					END
				-- Check if the faculty email already exists
				ELSE IF EXISTS(SELECT Email FROM Faculty WHERE Email = @email)
					BEGIN
						UPDATE Faculty
						SET Faculty.[Name] = p.[Name], Faculty.[Link] = p.[Link], Faculty.[PhotoUrl] = p.[PhotoUrl], Faculty.[Title] = p.[Title], Faculty.[Phone] = p.[Phone],
							Faculty.[About] = p.[About], Faculty.[Publications] = p.[Publications], Faculty.[Education] = p.[Education], Faculty.[Department] = p.[Department]
						FROM @paramsList p WHERE p.Email = Faculty.Email
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO Faculty 
							([Name], Email, [Link], [PhotoUrl], [Title], [Phone], [About], [Publications], [Education], [Department])
							SELECT [Name], Email, [Link], [PhotoUrl], [Title], [Phone], [About], [Publications], [Education], [Department]
							FROM @paramsList WHERE Email = @email
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @dept, @email
			END
		
		DROP TABLE #departments

		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows; Invalid Departments: ' + @invalidDepts
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END