CREATE TYPE [dbo].[ut_University] AS TABLE (
    [Major]               VARCHAR (15) NULL,
    [SampleCurriculam]    TEXT         NULL,
    [DegreesAwarded]      INT          NULL,
    [DegreesAwardedBS]    INT          NULL,
    [DegreesAwardedMS]    INT          NULL,
    [DegreesAwardedPhD]   INT          NULL,
    [Male]                FLOAT (53)   NULL,
    [Female]              FLOAT (53)   NULL,
    [OtherGenders]        FLOAT (53)   NULL,
    [White]               FLOAT (53)   NULL,
    [AfricanAmerican]     FLOAT (53)   NULL,
    [AmericanIndian]      FLOAT (53)   NULL,
    [Asian]               FLOAT (53)   NULL,
    [OtherRaces]          FLOAT (53)   NULL,
    [AcceptanceRate]      FLOAT (53)   NULL,
    [AverageGPA]          FLOAT (53)   NULL,
    [StudentsTo1Faculty]  VARCHAR (50) NULL,
    [GraduationRate4Year] FLOAT (53)   NULL,
    [GraduationRate6Year] FLOAT (53)   NULL,
    [RetentionRate]       FLOAT (53)   NULL,
    [AverageClassSize]    TINYINT      NULL,
    [PlacementRate]       FLOAT (53)   NULL,
    [CostOfAttendance]    FLOAT (53)   NULL,
    [TuitionInState]      FLOAT (53)   NULL,
    [TuitionOutOfState]   FLOAT (53)   NULL,
    [BoardCosts]          FLOAT (53)   NULL,
    [FinancialAid]        TEXT         NULL,
    [Safety]              TEXT         NULL);





