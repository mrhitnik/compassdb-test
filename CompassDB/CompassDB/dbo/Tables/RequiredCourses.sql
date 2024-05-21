CREATE TABLE [dbo].[RequiredCourses] (
    [Major]    VARCHAR (15) NOT NULL,
    [Course]   VARCHAR (15) NOT NULL,
    [Semester] INT          NULL,
    CONSTRAINT [PK_RequiredCourses_1] PRIMARY KEY CLUSTERED ([Major] ASC, [Course] ASC),
    CONSTRAINT [FK_RequiredCourses_Courses] FOREIGN KEY ([Course]) REFERENCES [dbo].[Courses] ([Code]),
    CONSTRAINT [FK_RequiredCourses_Majors] FOREIGN KEY ([Major]) REFERENCES [dbo].[Majors] ([Code])
);





