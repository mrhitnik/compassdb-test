CREATE TYPE [dbo].[ut_Alumni] AS TABLE (
    [Major]         VARCHAR (15)   NULL,
    [Name]          NVARCHAR (50)  NULL,
    [Graduation]    VARCHAR (15)   NULL,
    [Employment]    NVARCHAR (50)  NULL,
    [PhotoUrl]      NVARCHAR (MAX) NULL,
    [ProfileUrl]    NVARCHAR (MAX) NULL,
    [DateCollected] NVARCHAR (50)  NULL);



