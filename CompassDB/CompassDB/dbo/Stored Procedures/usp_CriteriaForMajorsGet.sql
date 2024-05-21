CREATE PROCEDURE [dbo].[usp_CriteriaForMajorsGet]
	@majorsList ut_List READONLY
AS
BEGIN
	SELECT *
	FROM Majors m LEFT JOIN PreUniversity pre ON m.Code = pre.Major
		LEFT JOIN University u ON m.Code = u.Major
		LEFT JOIN PostUniversity post ON m.Code = post.Major
		LEFT JOIN StudentsInMajor sinm ON m.Code = sinm.Major
	WHERE m.Code IN (SELECT item FROM @majorsList)
END