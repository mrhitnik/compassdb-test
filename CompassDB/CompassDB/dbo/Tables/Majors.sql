CREATE TABLE [dbo].[Majors] (
    [Name]                    NVARCHAR (50) NOT NULL,
    [Code]                    VARCHAR (15)  NOT NULL,
    [ImgUrl]                  VARCHAR (100) NULL,
    [CurriculamFlexibility]   FLOAT (53)    NULL,
    [MinimumCredit]           INT           DEFAULT ((0)) NOT NULL,
    [MinMathCourses]          INT           DEFAULT ((0)) NOT NULL,
    [MinPhysicsCourses]       INT           DEFAULT ((0)) NOT NULL,
    [MinChemistryCourses]     INT           DEFAULT ((0)) NOT NULL,
    [MinGeneralCourses]       INT           DEFAULT ((0)) NOT NULL,
    [MinElectiveCourses]      INT           DEFAULT ((0)) NOT NULL,
    [GraduateSchoolAvailable] BIT           NULL,
    [TuitionInState]          INT           NOT NULL,
    [TuitionOutOfState]       INT           NOT NULL,
    [LabHours]                INT           DEFAULT ((0)) NOT NULL,
    [Summary]                 TEXT          NULL,
    [Department]              VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_Majors_1] PRIMARY KEY CLUSTERED ([Code] ASC),
    UNIQUE NONCLUSTERED ([Code] ASC)
);













