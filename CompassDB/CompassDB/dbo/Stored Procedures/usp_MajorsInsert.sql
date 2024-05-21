CREATE PROCEDURE [dbo].[usp_MajorsInsert]
	@paramsList ut_Majors READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @code VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Code FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @code

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF EXISTS(SELECT Code FROM Majors WHERE Code = @code)
					BEGIN
						UPDATE Majors
						SET Majors.[Name] = p.[Name], Majors.CurriculamFlexibility = p.CurriculamFlexibility, Majors.MinimumCredit = p.MinimumCredit,
							Majors.MinMathCourses = p.MinMathCourses, Majors.MinPhysicsCourses = p.MinPhysicsCourses, Majors.MinChemistryCourses = p.MinChemistryCourses,
							Majors.MinGeneralCourses = p.MinGeneralCourses, Majors.MinElectiveCourses = p.MinElectiveCourses, Majors.GraduateSchoolAvailable = p.GraduateSchoolAvailable,
							Majors.TuitionInState = p.TuitionInState, Majors.TuitionOutOfState = p.TuitionOutOfState, Majors.LabHours = p.LabHours, Majors.Summary =p.Summary, Majors.Department =p.Department
						FROM @paramsList p WHERE p.Code = Majors.Code
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
					INSERT INTO Majors 
						([Name], [Code], [CurriculamFlexibility], [MinimumCredit], [MinMathCourses], [MinPhysicsCourses], [MinChemistryCourses], [MinGeneralCourses],       
							[MinElectiveCourses], [GraduateSchoolAvailable], [TuitionInState], [TuitionOutOfState], [LabHours], [Summary], [Department])               
						SELECT [Name], [Code], [CurriculamFlexibility], [MinimumCredit], [MinMathCourses], [MinPhysicsCourses], [MinChemistryCourses], [MinGeneralCourses],       
							[MinElectiveCourses], [GraduateSchoolAvailable], [TuitionInState], [TuitionOutOfState], [LabHours], [Summary], [Department]  
						FROM @paramsList WHERE Code = @code
						SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @code
			END

		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows;' 

	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END