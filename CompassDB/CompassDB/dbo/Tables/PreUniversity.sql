CREATE TABLE [dbo].[PreUniversity] (
    [Major]          VARCHAR (15) NOT NULL,
    [HighSchoolPrep] TEXT         NULL,
    [ClassTypes]     TEXT         NULL,
    CONSTRAINT [PK_PreUniversity] PRIMARY KEY CLUSTERED ([Major] ASC),
    CONSTRAINT [FK_PreUniversity_Majors] FOREIGN KEY ([Major]) REFERENCES [dbo].[Majors] ([Code])
);





