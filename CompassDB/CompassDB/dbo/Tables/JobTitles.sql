CREATE TABLE [dbo].[JobTitles] (
    [Major]     VARCHAR (15)  NOT NULL,
    [Title]     VARCHAR (100) NOT NULL,
    [Tasks]     TEXT          NOT NULL,
    [Skills]    TEXT          NOT NULL,
    [Knowledge] TEXT          NOT NULL,
    [Abilities] TEXT          NOT NULL,
    [MedianPay] VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_JobTitles] PRIMARY KEY CLUSTERED ([Major] ASC, [Title] ASC),
    CONSTRAINT [FK_JobTitles_Majors] FOREIGN KEY ([Major]) REFERENCES [dbo].[Majors] ([Code])
);







