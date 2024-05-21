CREATE TABLE [dbo].[PostUniversity] (
    [Major]               VARCHAR (15) NOT NULL,
    [MedianSalaryPerYear] INT          NULL,
    [MedianSalaryPerHour] FLOAT (53)   NULL,
    [Requirements]        TEXT         NULL,
    [WorkExperience]      TEXT         NULL,
    [JobsCount]           INT          NULL,
    [CurrentWorkforce]    INT          NULL,
    [AverageAge]          VARCHAR (50) NULL,
    [ExpectedGrowth]      FLOAT (53)   NULL,
    [WorkEnvironment]     TEXT         NULL,
    [WorkSchedule]        TEXT         NULL,
    [Male]                FLOAT (53)   NULL,
    [Female]              FLOAT (53)   NULL,
    [OtherGenders]        FLOAT (53)   NULL,
    [DegreesAwards]       INT          NULL,
    [DegreesGrowth]       FLOAT (53)   NULL,
    CONSTRAINT [PK_PostUniversity] PRIMARY KEY CLUSTERED ([Major] ASC),
    CONSTRAINT [FK_PostUniversity_Majors] FOREIGN KEY ([Major]) REFERENCES [dbo].[Majors] ([Code])
);









