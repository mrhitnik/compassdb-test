CREATE TYPE [dbo].[ut_Majors] AS TABLE (
    [Name]                    NVARCHAR (50) NULL,
    [Code]                    VARCHAR (15)  NULL,
    [CurriculamFlexibility]   FLOAT (53)    NULL,
    [MinimumCredit]           INT           NULL,
    [MinMathCourses]          INT           NULL,
    [MinPhysicsCourses]       INT           NULL,
    [MinChemistryCourses]     INT           NULL,
    [MinGeneralCourses]       INT           NULL,
    [MinElectiveCourses]      INT           NULL,
    [GraduateSchoolAvailable] BIT           NULL,
    [TuitionInState]          INT           NULL,
    [TuitionOutOfState]       INT           NULL,
    [LabHours]                INT           NULL,
    [Summary]                 TEXT          NULL,
    [Department]              VARCHAR (50)  NULL);



