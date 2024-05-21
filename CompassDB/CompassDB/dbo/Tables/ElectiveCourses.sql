CREATE TABLE [dbo].[ElectiveCourses] (
    [Major]  VARCHAR (15) NOT NULL,
    [Course] VARCHAR (15) NOT NULL,
    [Type]   VARCHAR (15) NULL,
    CONSTRAINT [PK_ElectiveCourses_1] PRIMARY KEY CLUSTERED ([Major] ASC, [Course] ASC),
    CONSTRAINT [FK_ElectiveCourses_Courses] FOREIGN KEY ([Course]) REFERENCES [dbo].[Courses] ([Code]),
    CONSTRAINT [FK_ElectiveCourses_Majors] FOREIGN KEY ([Major]) REFERENCES [dbo].[Majors] ([Code])
);





