CREATE TABLE [dbo].[MajorsAndLocations] (
    [Major]         VARCHAR (15) NOT NULL,
    [LocationId]    INT          NOT NULL,
    [AverageSalary] INT          NOT NULL,
    CONSTRAINT [PK_MajorsAndLocations_1] PRIMARY KEY CLUSTERED ([Major] ASC, [LocationId] ASC),
    CONSTRAINT [FK_MajorsAndLocations_Locations] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Locations] ([Id]),
    CONSTRAINT [FK_MajorsAndLocations_Majors] FOREIGN KEY ([Major]) REFERENCES [dbo].[Majors] ([Code])
);





