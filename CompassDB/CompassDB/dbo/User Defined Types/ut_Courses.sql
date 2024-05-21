CREATE TYPE [dbo].[ut_Courses] AS TABLE (
    [Name]             NVARCHAR (100) NULL,
    [Code]             VARCHAR (15)   NULL,
    [Summary]          TEXT           NULL,
    [Major]            VARCHAR (15)   NULL,
    [Credits]          TINYINT        NULL,
    [Hours]            TINYINT        NULL,
    [TotalA]           FLOAT (53)     NULL,
    [TotalB]           FLOAT (53)     NULL,
    [TotalC]           FLOAT (53)     NULL,
    [TotalD]           FLOAT (53)     NULL,
    [TotalF]           FLOAT (53)     NULL,
    [TotalW]           FLOAT (53)     NULL,
    [TotalStudents]    INT            NULL,
    [AverageClassSize] FLOAT (53)     NULL,
    [RecommendedSem]   VARCHAR (20)   NULL);





