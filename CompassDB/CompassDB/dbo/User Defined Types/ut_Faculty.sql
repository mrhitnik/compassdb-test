CREATE TYPE [dbo].[ut_Faculty] AS TABLE (
    [Department]   VARCHAR (50)   NULL,
    [Name]         NVARCHAR (50)  NULL,
    [Link]         NVARCHAR (MAX) NULL,
    [PhotoUrl]     NVARCHAR (MAX) NULL,
    [Title]        VARCHAR (150)  NULL,
    [Phone]        VARCHAR (40)   NULL,
    [Email]        NVARCHAR (30)  NULL,
    [About]        TEXT           NULL,
    [Publications] TEXT           NULL,
    [Education]    TEXT           NULL);



