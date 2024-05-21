CREATE TABLE [dbo].[Prerequisites] (
    [Course]       VARCHAR (15) NOT NULL,
    [Prerequisite] VARCHAR (15) NOT NULL,
    CONSTRAINT [PK_Prerequisites_1] PRIMARY KEY CLUSTERED ([Course] ASC, [Prerequisite] ASC),
    CONSTRAINT [FK_Prerequisites_Courses] FOREIGN KEY ([Course]) REFERENCES [dbo].[Courses] ([Code]),
    CONSTRAINT [FK_Prerequisites_Courses_prerequisite] FOREIGN KEY ([Prerequisite]) REFERENCES [dbo].[Courses] ([Code])
);





