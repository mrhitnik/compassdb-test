CREATE TABLE [dbo].[University] (
    [Major]               VARCHAR (15) NOT NULL,
    [SampleCurriculam]    TEXT         NULL,
    [DegreesAwarded]      INT          DEFAULT ((0)) NULL,
    [DegreesAwardedBS]    INT          DEFAULT ((0)) NULL,
    [DegreesAwardedMS]    INT          DEFAULT ((0)) NULL,
    [DegreesAwardedPhD]   INT          DEFAULT ((0)) NULL,
    [Male]                FLOAT (53)   DEFAULT ((0)) NULL,
    [Female]              FLOAT (53)   DEFAULT ((0)) NULL,
    [OtherGenders]        FLOAT (53)   DEFAULT ((0)) NULL,
    [White]               FLOAT (53)   DEFAULT ((0)) NULL,
    [AfricanAmerican]     FLOAT (53)   DEFAULT ((0)) NULL,
    [AmericanIndian]      FLOAT (53)   DEFAULT ((0)) NULL,
    [Asian]               FLOAT (53)   DEFAULT ((0)) NULL,
    [OtherRaces]          FLOAT (53)   DEFAULT ((0)) NULL,
    [AcceptanceRate]      FLOAT (53)   DEFAULT ((0)) NULL,
    [AverageGPA]          FLOAT (53)   DEFAULT ((0)) NULL,
    [StudentsTo1Faculty]  VARCHAR (50) DEFAULT ((0)) NULL,
    [GraduationRate4Year] FLOAT (53)   DEFAULT ((0)) NULL,
    [GraduationRate6Year] FLOAT (53)   DEFAULT ((0)) NULL,
    [RetentionRate]       FLOAT (53)   DEFAULT ((0)) NULL,
    [AverageClassSize]    TINYINT      DEFAULT ((0)) NULL,
    [PlacementRate]       FLOAT (53)   DEFAULT ((0)) NULL,
    [CostOfAttendance]    FLOAT (53)   DEFAULT ((0)) NULL,
    [TuitionInState]      FLOAT (53)   DEFAULT ((0)) NULL,
    [TuitionOutOfState]   FLOAT (53)   DEFAULT ((0)) NULL,
    [BoardCosts]          FLOAT (53)   DEFAULT ((0)) NULL,
    [FinancialAid]        TEXT         NULL,
    [Safety]              TEXT         NULL,
    CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED ([Major] ASC),
    CONSTRAINT [FK_University_Majors] FOREIGN KEY ([Major]) REFERENCES [dbo].[Majors] ([Code])
);











