CREATE TABLE [dbo].[Faculty] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (50)  NOT NULL,
    [Link]         NVARCHAR (MAX) NULL,
    [PhotoUrl]     NVARCHAR (MAX) NULL,
    [Title]        VARCHAR (150)  NOT NULL,
    [Phone]        VARCHAR (40)   NULL,
    [Email]        NVARCHAR (30)  NOT NULL,
    [About]        TEXT           NULL,
    [Publications] TEXT           NULL,
    [Education]    TEXT           NULL,
    [Department]   VARCHAR (50)   NOT NULL,
    CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED ([Id] ASC)
);



