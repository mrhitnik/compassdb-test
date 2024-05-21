CREATE TABLE [dbo].[Courses] (
    [Name]             NVARCHAR (100) NOT NULL,
    [Code]             VARCHAR (15)   NOT NULL,
    [Summary]          TEXT           NULL,
    [Major]            VARCHAR (15)   NOT NULL,
    [Credits]          TINYINT        DEFAULT ((3)) NOT NULL,
    [Hours]            TINYINT        DEFAULT ((0)) NOT NULL,
    [TotalA]           FLOAT (53)     DEFAULT ((0)) NOT NULL,
    [TotalB]           FLOAT (53)     DEFAULT ((0)) NOT NULL,
    [TotalC]           FLOAT (53)     DEFAULT ((0)) NOT NULL,
    [TotalD]           FLOAT (53)     DEFAULT ((0)) NOT NULL,
    [TotalF]           FLOAT (53)     DEFAULT ((0)) NOT NULL,
    [TotalW]           FLOAT (53)     DEFAULT ((0)) NOT NULL,
    [TotalStudents]    INT            NOT NULL,
    [AverageClassSize] FLOAT (53)     NOT NULL,
    [RecommendedSem]   VARCHAR (20)   DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Courses_1] PRIMARY KEY CLUSTERED ([Code] ASC),
    CONSTRAINT [Courses_Code_Unique] UNIQUE NONCLUSTERED ([Code] ASC)
);











