﻿CREATE TABLE [dbo].[StudentsInMajor] (
    [Major]                VARCHAR (15) NOT NULL,
    [Freshman]             FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [Transfer]             FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [White]                FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [AfricanAmerican]      FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [AmericanIndian]       FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [Asian]                FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [OtherRaces]           FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [Male]                 FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [Female]               FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [OtherGenders]         FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [Total]                INT          DEFAULT ((0)) NOT NULL,
    [AverageGPA]           FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [GraduatedIn5years]    INT          DEFAULT ((0)) NOT NULL,
    [AverageSalary]        INT          DEFAULT ((0)) NOT NULL,
    [RetensionYear1]       FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [RetensionYear2]       FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [RetensionYear3]       FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [RetensionYear4]       FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [FreshmanRetension]    FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [TransferRetension]    FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [AverageGPAFreshman]   FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [AverageGPATransfer]   FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [UGResearch]           FLOAT (53)   NULL,
    [GPIPEligible]         FLOAT (53)   NULL,
    [GPIPInterns]          FLOAT (53)   NULL,
    [GraduatedWithJobs]    FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [JoinedGraduateSchool] FLOAT (53)   DEFAULT ((0)) NOT NULL,
    [StudentsTo1Faculty]   FLOAT (53)   DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_StudentsInMajor] PRIMARY KEY CLUSTERED ([Major] ASC),
    CONSTRAINT [FK_StudentsInMajor_Majors] FOREIGN KEY ([Major]) REFERENCES [dbo].[Majors] ([Code])
);



