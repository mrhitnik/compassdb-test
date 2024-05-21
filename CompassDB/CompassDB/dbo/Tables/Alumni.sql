CREATE TABLE [dbo].[Alumni] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Major]         VARCHAR (15)   NOT NULL,
    [Name]          NVARCHAR (50)  NOT NULL,
    [Graduation]    VARCHAR (15)   NULL,
    [Employment]    NVARCHAR (50)  NULL,
    [PhotoUrl]      NVARCHAR (MAX) NULL,
    [ProfileUrl]    NVARCHAR (MAX) NOT NULL,
    [DateCollected] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_Alumni] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Alumni_Majors] FOREIGN KEY ([Major]) REFERENCES [dbo].[Majors] ([Code])
);



