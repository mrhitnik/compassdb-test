USE [master]
GO
/****** Object:  Database [Compass_db]    Script Date: 5/19/2023 1:38:43 AM ******/
CREATE DATABASE [Compass_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Compass_db', FILENAME = N'C:\Users\jjasan2\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Compass_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Compass_db_log', FILENAME = N'C:\Users\jjasan2\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Compass_db.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Compass_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Compass_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Compass_db] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Compass_db] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Compass_db] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Compass_db] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Compass_db] SET ARITHABORT ON 
GO
ALTER DATABASE [Compass_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Compass_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Compass_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Compass_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Compass_db] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Compass_db] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Compass_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Compass_db] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [Compass_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Compass_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Compass_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Compass_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Compass_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Compass_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Compass_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Compass_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Compass_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Compass_db] SET RECOVERY FULL 
GO
ALTER DATABASE [Compass_db] SET  MULTI_USER 
GO
ALTER DATABASE [Compass_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Compass_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Compass_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Compass_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Compass_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Compass_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Compass_db] SET QUERY_STORE = OFF
GO
USE [Compass_db]
GO
/****** Object:  UserDefinedTableType [dbo].[ut_Courses]    Script Date: 5/19/2023 1:38:43 AM ******/
CREATE TYPE [dbo].[ut_Courses] AS TABLE(
	[Name] [nvarchar](50) NULL,
	[Code] [varchar](15) NULL,
	[Summary] [text] NULL,
	[Major] [varchar](15) NULL,
	[Credits] [tinyint] NULL,
	[Hours] [tinyint] NULL,
	[TotalA] [float] NULL,
	[TotalB] [float] NULL,
	[TotalC] [float] NULL,
	[TotalD] [float] NULL,
	[TotalF] [float] NULL,
	[TotalW] [float] NULL,
	[TotalStudents] [int] NULL,
	[AverageClassSize] [smallint] NULL,
	[RecommendedSem] [varchar](20) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ut_List]    Script Date: 5/19/2023 1:38:43 AM ******/
CREATE TYPE [dbo].[ut_List] AS TABLE(
	[item] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ut_Majors]    Script Date: 5/19/2023 1:38:43 AM ******/
CREATE TYPE [dbo].[ut_Majors] AS TABLE(
	[Name] [nvarchar](50) NULL,
	[Code] [varchar](15) NULL,
	[CurriculamFlexibility] [float] NULL,
	[MinimumCredit] [int] NULL,
	[MinMathCourses] [int] NULL,
	[MinPhysicsCourses] [int] NULL,
	[MinChemistryCourses] [int] NULL,
	[MinGeneralCourses] [int] NULL,
	[MinElectiveCourses] [int] NULL,
	[GraduateSchoolAvailable] [bit] NULL,
	[TuitionInState] [int] NULL,
	[TuitionOutOfState] [int] NULL,
	[LabHours] [int] NULL,
	[Summary] [text] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ut_PostUniversity]    Script Date: 5/19/2023 1:38:43 AM ******/
CREATE TYPE [dbo].[ut_PostUniversity] AS TABLE(
	[Major] [varchar](15) NULL,
	[MedianSalaryPerYear] [int] NULL,
	[MedianSalaryPerHour] [float] NULL,
	[Requirements] [text] NULL,
	[WorkExperience] [text] NULL,
	[JobsCount] [int] NULL,
	[CurrentWorkforce] [int] NULL,
	[AverageAge] [varchar](50) NULL,
	[ExpectedGrowth] [float] NULL,
	[WorkEnvironment] [text] NULL,
	[WorkSchedule] [text] NULL,
	[Male] [float] NULL,
	[Female] [float] NULL,
	[OtherGenders] [float] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ut_PreUniversity]    Script Date: 5/19/2023 1:38:43 AM ******/
CREATE TYPE [dbo].[ut_PreUniversity] AS TABLE(
	[Major] [varchar](15) NULL,
	[HighSchoolPrep] [text] NULL,
	[ClassTypes] [text] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ut_StudentsInMajor]    Script Date: 5/19/2023 1:38:43 AM ******/
CREATE TYPE [dbo].[ut_StudentsInMajor] AS TABLE(
	[Major] [varchar](1) NULL,
	[Freshman] [float] NULL,
	[Transfer] [float] NULL,
	[White] [float] NULL,
	[AfricanAmerican] [float] NULL,
	[AmericanIndian] [float] NULL,
	[Asian] [float] NULL,
	[OtherRaces] [float] NULL,
	[Male] [float] NULL,
	[Female] [float] NULL,
	[OtherGenders] [float] NULL,
	[Total] [int] NULL,
	[AverageGPA] [float] NULL,
	[GraduatedIn5years] [int] NULL,
	[AverageSalary] [int] NULL,
	[RetensionYear1] [float] NULL,
	[RetensionYear2] [float] NULL,
	[RetensionYear3] [float] NULL,
	[RetensionYear4] [float] NULL,
	[FreshmanRetension] [float] NULL,
	[TransferRetension] [float] NULL,
	[AverageGPAFreshman] [float] NULL,
	[AverageGPATransfer] [float] NULL,
	[UGResearch] [float] NULL,
	[GPIPEligible] [float] NULL,
	[GPIPInterns] [float] NULL,
	[GraduatedWithJobs] [float] NULL,
	[JoinedGraduateSchool] [float] NULL,
	[StudentsTo1Faculty] [float] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ut_University]    Script Date: 5/19/2023 1:38:43 AM ******/
CREATE TYPE [dbo].[ut_University] AS TABLE(
	[Major] [varchar](15) NULL,
	[SampleCurriculam] [text] NULL,
	[DegreesAwarded] [int] NULL,
	[DegreesAwardedBS] [int] NULL,
	[DegreesAwardedMS] [int] NULL,
	[DegreesAwardedPhD] [int] NULL,
	[Male] [float] NULL,
	[Female] [float] NULL,
	[OtherGenders] [float] NULL,
	[White] [float] NULL,
	[AfricanAmerican] [float] NULL,
	[AmericanIndian] [float] NULL,
	[Asian] [float] NULL,
	[OtherRaces] [float] NULL,
	[AcceptanceRate] [float] NULL,
	[AverageGPA] [float] NULL,
	[StudentsTo1Faculty] [float] NULL,
	[GraduationRate4Year] [float] NULL,
	[GraduationRate6Year] [float] NULL,
	[RetentionRate] [float] NULL,
	[AverageClassSize] [tinyint] NULL,
	[PlacementRate] [float] NULL,
	[CostOfAttendance] [int] NULL,
	[TuitionInState] [int] NULL,
	[TuitionOutOfState] [int] NULL,
	[BoardCosts] [int] NULL,
	[FinancialAid] [text] NULL,
	[Safety] [text] NULL
)
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/19/2023 1:38:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[Summary] [text] NULL,
	[Major] [varchar](15) NOT NULL,
	[Credits] [tinyint] NOT NULL,
	[Hours] [tinyint] NOT NULL,
	[TotalA] [float] NOT NULL,
	[TotalB] [float] NOT NULL,
	[TotalC] [float] NOT NULL,
	[TotalD] [float] NOT NULL,
	[TotalF] [float] NOT NULL,
	[TotalW] [float] NOT NULL,
	[TotalStudents] [int] NOT NULL,
	[AverageClassSize] [smallint] NOT NULL,
	[RecommendedSem] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Courses_Code_Unique] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectiveCourses]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectiveCourses](
	[Id] [int] NOT NULL,
	[Major] [varchar](15) NOT NULL,
	[Course] [varchar](15) NOT NULL,
	[Type] [varchar](15) NULL,
 CONSTRAINT [PK_ElectiveCourses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitles]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitles](
	[Major] [varchar](15) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[Tasks] [text] NOT NULL,
	[Skills] [text] NOT NULL,
	[Knowledge] [text] NOT NULL,
	[Tools] [text] NOT NULL,
	[MedianPay] [int] NOT NULL,
 CONSTRAINT [PK_JobTitles] PRIMARY KEY CLUSTERED 
(
	[Major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Majors]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Majors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[ImgUrl] [varchar](100) NULL,
	[CurriculamFlexibility] [float] NULL,
	[MinimumCredit] [int] NOT NULL,
	[MinMathCourses] [int] NOT NULL,
	[MinPhysicsCourses] [int] NOT NULL,
	[MinChemistryCourses] [int] NOT NULL,
	[MinGeneralCourses] [int] NOT NULL,
	[MinElectiveCourses] [int] NOT NULL,
	[GraduateSchoolAvailable] [bit] NULL,
	[TuitionInState] [int] NOT NULL,
	[TuitionOutOfState] [int] NOT NULL,
	[LabHours] [int] NOT NULL,
	[Summary] [text] NULL,
 CONSTRAINT [PK_Majors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MajorsAndLocations]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MajorsAndLocations](
	[Id] [int] NOT NULL,
	[Major] [varchar](15) NOT NULL,
	[LocationId] [int] NOT NULL,
	[AverageSalary] [int] NOT NULL,
 CONSTRAINT [PK_MajorsAndLocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostUniversity]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostUniversity](
	[Major] [varchar](15) NOT NULL,
	[MedianSalaryPerYear] [int] NULL,
	[MedianSalaryPerHour] [float] NULL,
	[Requirements] [text] NULL,
	[WorkExperience] [text] NULL,
	[JobsCount] [int] NULL,
	[CurrentWorkforce] [int] NULL,
	[AverageAge] [varchar](50) NULL,
	[ExpectedGrowth] [float] NULL,
	[WorkEnvironment] [text] NULL,
	[WorkSchedule] [text] NULL,
	[Male] [float] NULL,
	[Female] [float] NULL,
	[OtherGenders] [float] NULL,
 CONSTRAINT [PK_PostUniversity] PRIMARY KEY CLUSTERED 
(
	[Major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prerequisites]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prerequisites](
	[Id] [int] NOT NULL,
	[Course] [varchar](15) NOT NULL,
	[PrerequisiteCourse] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Prerequisites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreUniversity]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreUniversity](
	[Major] [varchar](15) NOT NULL,
	[HighSchoolPrep] [text] NULL,
	[ClassTypes] [text] NULL,
 CONSTRAINT [PK_PreUniversity] PRIMARY KEY CLUSTERED 
(
	[Major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequiredCourses]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequiredCourses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Major] [varchar](15) NOT NULL,
	[Course] [varchar](15) NOT NULL,
 CONSTRAINT [PK_RequiredCourses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentsInMajor]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsInMajor](
	[Major] [varchar](15) NOT NULL,
	[Freshman] [float] NOT NULL,
	[Transfer] [float] NOT NULL,
	[White] [float] NOT NULL,
	[AfricanAmerican] [float] NOT NULL,
	[AmericanIndian] [float] NOT NULL,
	[Asian] [float] NOT NULL,
	[OtherRaces] [float] NOT NULL,
	[Male] [float] NOT NULL,
	[Female] [float] NOT NULL,
	[OtherGenders] [float] NOT NULL,
	[Total] [int] NOT NULL,
	[AverageGPA] [float] NOT NULL,
	[GraduatedIn5years] [int] NOT NULL,
	[AverageSalary] [int] NOT NULL,
	[RetensionYear1] [float] NOT NULL,
	[RetensionYear2] [float] NOT NULL,
	[RetensionYear3] [float] NOT NULL,
	[RetensionYear4] [float] NOT NULL,
	[FreshmanRetension] [float] NOT NULL,
	[TransferRetension] [float] NOT NULL,
	[AverageGPAFreshman] [float] NOT NULL,
	[AverageGPATransfer] [float] NOT NULL,
	[UGResearch] [float] NULL,
	[GPIPEligible] [float] NULL,
	[GPIPInterns] [float] NULL,
	[GraduatedWithJobs] [float] NOT NULL,
	[JoinedGraduateSchool] [float] NOT NULL,
	[StudentsTo1Faculty] [float] NOT NULL,
 CONSTRAINT [PK_StudentsInMajor] PRIMARY KEY CLUSTERED 
(
	[Major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[University]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[Major] [varchar](15) NOT NULL,
	[SampleCurriculam] [text] NULL,
	[DegreesAwarded] [int] NOT NULL,
	[DegreesAwardedBS] [int] NOT NULL,
	[DegreesAwardedMS] [int] NOT NULL,
	[DegreesAwardedPhD] [int] NOT NULL,
	[Male] [float] NOT NULL,
	[Female] [float] NOT NULL,
	[OtherGenders] [float] NOT NULL,
	[White] [float] NOT NULL,
	[AfricanAmerican] [float] NOT NULL,
	[AmericanIndian] [float] NOT NULL,
	[Asian] [float] NOT NULL,
	[OtherRaces] [float] NOT NULL,
	[AcceptanceRate] [float] NOT NULL,
	[AverageGPA] [float] NOT NULL,
	[StudentsTo1Faculty] [float] NOT NULL,
	[GraduationRate4Year] [float] NOT NULL,
	[GraduationRate6Year] [float] NOT NULL,
	[RetentionRate] [float] NOT NULL,
	[AverageClassSize] [tinyint] NOT NULL,
	[PlacementRate] [float] NOT NULL,
	[CostOfAttendance] [int] NOT NULL,
	[TuitionInState] [int] NOT NULL,
	[TuitionOutOfState] [int] NOT NULL,
	[BoardCosts] [int] NOT NULL,
	[FinancialAid] [text] NULL,
	[Safety] [text] NULL,
 CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED 
(
	[Major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((3)) FOR [Credits]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [Hours]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [TotalA]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [TotalB]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [TotalC]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [TotalD]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [TotalF]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [TotalW]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((1)) FOR [RecommendedSem]
GO
ALTER TABLE [dbo].[Majors] ADD  DEFAULT ((0)) FOR [MinimumCredit]
GO
ALTER TABLE [dbo].[Majors] ADD  DEFAULT ((0)) FOR [MinMathCourses]
GO
ALTER TABLE [dbo].[Majors] ADD  DEFAULT ((0)) FOR [MinPhysicsCourses]
GO
ALTER TABLE [dbo].[Majors] ADD  DEFAULT ((0)) FOR [MinChemistryCourses]
GO
ALTER TABLE [dbo].[Majors] ADD  DEFAULT ((0)) FOR [MinGeneralCourses]
GO
ALTER TABLE [dbo].[Majors] ADD  DEFAULT ((0)) FOR [MinElectiveCourses]
GO
ALTER TABLE [dbo].[Majors] ADD  DEFAULT ((0)) FOR [LabHours]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [Freshman]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [Transfer]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [White]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [AfricanAmerican]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [AmericanIndian]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [Asian]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [OtherRaces]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [Male]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [Female]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [OtherGenders]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [AverageGPA]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [GraduatedIn5years]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [AverageSalary]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [RetensionYear1]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [RetensionYear2]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [RetensionYear3]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [RetensionYear4]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [FreshmanRetension]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [TransferRetension]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [AverageGPAFreshman]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [AverageGPATransfer]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [GraduatedWithJobs]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [JoinedGraduateSchool]
GO
ALTER TABLE [dbo].[StudentsInMajor] ADD  DEFAULT ((0)) FOR [StudentsTo1Faculty]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [DegreesAwarded]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [DegreesAwardedBS]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [DegreesAwardedMS]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [DegreesAwardedPhD]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [Male]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [Female]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [OtherGenders]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [White]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [AfricanAmerican]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [AmericanIndian]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [Asian]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [OtherRaces]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [AcceptanceRate]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [AverageGPA]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [StudentsTo1Faculty]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [GraduationRate4Year]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [GraduationRate6Year]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [RetentionRate]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [AverageClassSize]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [PlacementRate]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [CostOfAttendance]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [TuitionInState]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [TuitionOutOfState]
GO
ALTER TABLE [dbo].[University] ADD  DEFAULT ((0)) FOR [BoardCosts]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Majors] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Code])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Majors]
GO
ALTER TABLE [dbo].[ElectiveCourses]  WITH CHECK ADD  CONSTRAINT [FK_ElectiveCourses_Courses] FOREIGN KEY([Course])
REFERENCES [dbo].[Courses] ([Code])
GO
ALTER TABLE [dbo].[ElectiveCourses] CHECK CONSTRAINT [FK_ElectiveCourses_Courses]
GO
ALTER TABLE [dbo].[ElectiveCourses]  WITH CHECK ADD  CONSTRAINT [FK_ElectiveCourses_Majors] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Code])
GO
ALTER TABLE [dbo].[ElectiveCourses] CHECK CONSTRAINT [FK_ElectiveCourses_Majors]
GO
ALTER TABLE [dbo].[JobTitles]  WITH CHECK ADD  CONSTRAINT [FK_JobTitles_Majors] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Code])
GO
ALTER TABLE [dbo].[JobTitles] CHECK CONSTRAINT [FK_JobTitles_Majors]
GO
ALTER TABLE [dbo].[MajorsAndLocations]  WITH CHECK ADD  CONSTRAINT [FK_MajorsAndLocations_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[MajorsAndLocations] CHECK CONSTRAINT [FK_MajorsAndLocations_Locations]
GO
ALTER TABLE [dbo].[MajorsAndLocations]  WITH CHECK ADD  CONSTRAINT [FK_MajorsAndLocations_Majors] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Code])
GO
ALTER TABLE [dbo].[MajorsAndLocations] CHECK CONSTRAINT [FK_MajorsAndLocations_Majors]
GO
ALTER TABLE [dbo].[PostUniversity]  WITH CHECK ADD  CONSTRAINT [FK_PostUniversity_Majors] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Code])
GO
ALTER TABLE [dbo].[PostUniversity] CHECK CONSTRAINT [FK_PostUniversity_Majors]
GO
ALTER TABLE [dbo].[Prerequisites]  WITH CHECK ADD  CONSTRAINT [FK_Prerequisites_Courses] FOREIGN KEY([Course])
REFERENCES [dbo].[Courses] ([Code])
GO
ALTER TABLE [dbo].[Prerequisites] CHECK CONSTRAINT [FK_Prerequisites_Courses]
GO
ALTER TABLE [dbo].[Prerequisites]  WITH CHECK ADD  CONSTRAINT [FK_Prerequisites_Courses_prerequisite] FOREIGN KEY([PrerequisiteCourse])
REFERENCES [dbo].[Courses] ([Code])
GO
ALTER TABLE [dbo].[Prerequisites] CHECK CONSTRAINT [FK_Prerequisites_Courses_prerequisite]
GO
ALTER TABLE [dbo].[PreUniversity]  WITH CHECK ADD  CONSTRAINT [FK_PreUniversity_Majors] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Code])
GO
ALTER TABLE [dbo].[PreUniversity] CHECK CONSTRAINT [FK_PreUniversity_Majors]
GO
ALTER TABLE [dbo].[RequiredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RequiredCourses_Courses] FOREIGN KEY([Course])
REFERENCES [dbo].[Courses] ([Code])
GO
ALTER TABLE [dbo].[RequiredCourses] CHECK CONSTRAINT [FK_RequiredCourses_Courses]
GO
ALTER TABLE [dbo].[RequiredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RequiredCourses_Majors] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Code])
GO
ALTER TABLE [dbo].[RequiredCourses] CHECK CONSTRAINT [FK_RequiredCourses_Majors]
GO
ALTER TABLE [dbo].[StudentsInMajor]  WITH CHECK ADD  CONSTRAINT [FK_StudentsInMajor_Majors] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Code])
GO
ALTER TABLE [dbo].[StudentsInMajor] CHECK CONSTRAINT [FK_StudentsInMajor_Majors]
GO
ALTER TABLE [dbo].[University]  WITH CHECK ADD  CONSTRAINT [FK_University_Majors] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Code])
GO
ALTER TABLE [dbo].[University] CHECK CONSTRAINT [FK_University_Majors]
GO
/****** Object:  StoredProcedure [dbo].[usp_CoursesGet]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CoursesGet]
	@id int = NULL,
	@code varchar(10) = NULL,
	@name varchar(50) = NULL
AS
BEGIN
	SELECT * FROM Courses
		WHERE Id = coalesce(@id, Id) AND Code = coalesce(@code, Code) AND Name LIKE '%' + coalesce(@name, Name) + '%';
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CoursesInsert]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CoursesInsert]
	@paramsList ut_Courses READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @code VARCHAR(15)
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(100) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Code, Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @code, @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major)
					BEGIN
						SET @invalidMajors = @invalidMajors + @major + ', '
					END
				ELSE IF EXISTS(SELECT Code FROM Courses WHERE Code = @code)
					BEGIN
						UPDATE Courses
						SET Courses.[Name] = p.[Name], Courses.Summary = p.Summary, Courses.Major = p.Major, Courses.Credits = p.Credits, Courses.[Hours] = p.[Hours],
							Courses.TotalA = p.TotalA, Courses.TotalB = p.TotalB, Courses.TotalC = p.TotalC, Courses.TotalD = p.TotalD, Courses.TotalF = p.TotalF,
							Courses.TotalW = p.TotalW, Courses.TotalStudents = p.TotalStudents, Courses.AverageClassSize = p.AverageClassSize, Courses.RecommendedSem = p.RecommendedSem
						FROM @paramsList p WHERE p.Code = @code AND Courses.Code = @code
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO Courses 
							([Name], Code, Summary, Major, Credits, [Hours], TotalA, TotalB, TotalC, TotalD, TotalF, TotalW, TotalStudents, AverageClassSize, RecommendedSem)
							SELECT [Name], Code, Summary, Major, Credits, [Hours], TotalA, TotalB, TotalC, TotalD, TotalF, TotalW, TotalStudents, AverageClassSize, RecommendedSem  
							FROM @paramsList WHERE Major = @major
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @code, @major
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows; Invalid Majors: ' + @invalidMajors
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CriteriaForMajorsGet]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CriteriaForMajorsGet]
	@majorsList ut_List READONLY
AS
BEGIN
	SELECT *
	FROM Majors m LEFT JOIN PreUniversity pre ON m.Code = pre.Major
		LEFT JOIN University u ON m.Code = u.Major
		LEFT JOIN PostUniversity post ON m.Code = post.Major
		LEFT JOIN StudentsInMajor sinm ON m.Code = sinm.Major
	WHERE m.Code IN (SELECT item FROM @majorsList)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_CriteriaGet]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CriteriaGet]
AS
	BEGIN TRY
		SELECT TABLE_NAME 'Table', COLUMN_NAME 'Criterion'
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME IN ('PreUniversity', 'University', 'PostUniversity', 'StudentsInMajor')
	END TRY
	BEGIN CATCH
		RETURN -99
	END CATCH
RETURN 1
GO
/****** Object:  StoredProcedure [dbo].[usp_MajorsGet]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_MajorsGet]
	@code varchar(10) = NULL,
	@name varchar(50) = NULL
AS
BEGIN
	SELECT * FROM Majors
		WHERE Code = coalesce(@code, Code) AND Name LIKE '%' + coalesce(@name, Name) + '%';
END
GO
/****** Object:  StoredProcedure [dbo].[usp_MajorsInsert]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_MajorsInsert]
	@paramsList ut_Majors READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @code VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Code FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @code

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF EXISTS(SELECT Code FROM Majors WHERE Code = @code)
					BEGIN
						UPDATE Majors
						SET Majors.[Name] = p.[Name], Majors.CurriculamFlexibility = p.CurriculamFlexibility, Majors.MinimumCredit = p.MinimumCredit,
							Majors.MinMathCourses = p.MinMathCourses, Majors.MinPhysicsCourses = p.MinPhysicsCourses, Majors.MinChemistryCourses = p.MinChemistryCourses,
							Majors.MinGeneralCourses = p.MinGeneralCourses, Majors.MinElectiveCourses = p.MinElectiveCourses, Majors.GraduateSchoolAvailable = p.GraduateSchoolAvailable,
							Majors.TuitionInState = p.TuitionInState, Majors.TuitionOutOfState = p.TuitionOutOfState, Majors.LabHours = p.LabHours, Majors.Summary =p.Summary
						FROM @paramsList p WHERE p.Code = Majors.Code
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
					INSERT INTO Majors 
						([Name], [Code], [CurriculamFlexibility], [MinimumCredit], [MinMathCourses], [MinPhysicsCourses], [MinChemistryCourses], [MinGeneralCourses],       
							[MinElectiveCourses], [GraduateSchoolAvailable], [TuitionInState], [TuitionOutOfState], [LabHours], [Summary])               
						SELECT [Name], [Code], [CurriculamFlexibility], [MinimumCredit], [MinMathCourses], [MinPhysicsCourses], [MinChemistryCourses], [MinGeneralCourses],       
							[MinElectiveCourses], [GraduateSchoolAvailable], [TuitionInState], [TuitionOutOfState], [LabHours], [Summary]  
						FROM @paramsList WHERE Code = @code
						SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @code
			END

		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows;' 

	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PostUniversityInsert]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PostUniversityInsert]
	@paramsList ut_PostUniversity READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(100) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS(SELECT 1 FROM Majors WHERE Code = @major)
					BEGIN
						SET @invalidMajors = @invalidMajors + @major + ', '
					END
				ELSE IF EXISTS(SELECT 1 FROM PostUniversity WHERE Major = @major)
					BEGIN
						UPDATE PostUniversity
						SET PostUniversity.[AverageAge] = p.[AverageAge], PostUniversity.[MedianSalaryPerYear] = p.[MedianSalaryPerYear], PostUniversity.[WorkExperience] = p.[WorkExperience], PostUniversity.[JobsCount] = p.[JobsCount], 
							PostUniversity.[CurrentWorkforce] = p.[CurrentWorkforce], PostUniversity.[Requirements] = p.[Requirements], PostUniversity.[WorkEnvironment] = p.[WorkEnvironment], 
							PostUniversity.[WorkSchedule] = p.[WorkSchedule], PostUniversity.[MedianSalaryPerHour] = p.[MedianSalaryPerHour], PostUniversity.[ExpectedGrowth] = p.[ExpectedGrowth],
							PostUniversity.[Male] = p.[Male], PostUniversity.[Female] = p.[Female], PostUniversity.[OtherGenders] = p.[OtherGenders]
						FROM @paramsList p WHERE p.Major = PostUniversity.Major
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO PostUniversity 
							([Major], [AverageAge], [MedianSalaryPerYear], [WorkExperience], [JobsCount], [CurrentWorkforce], [Requirements], [WorkEnvironment], [WorkSchedule], [MedianSalaryPerHour], [ExpectedGrowth], 
								[Male], [Female], [OtherGenders])
							SELECT [Major], [AverageAge], [MedianSalaryPerYear], [WorkExperience], [JobsCount], [CurrentWorkforce], [Requirements], [WorkEnvironment], [WorkSchedule], [MedianSalaryPerHour], [ExpectedGrowth],
								[Male], [Female], [OtherGenders]
							FROM @paramsList WHERE Major = @major
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @major
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows; Invalid Majors: ' + @invalidMajors
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_PreUniversityInsert]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_PreUniversityInsert]
	@paramsList ut_PreUniversity READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(100) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major)
					BEGIN
						SET @invalidMajors = @invalidMajors + @major + ', '
					END
				ELSE IF EXISTS(SELECT Major FROM PreUniversity WHERE Major = @major)
					BEGIN
						UPDATE PreUniversity
						SET PreUniversity.[HighSchoolPrep] = p.[HighSchoolPrep], PreUniversity.[ClassTypes] = p.[ClassTypes]
						FROM @paramsList p WHERE p.Major = PreUniversity.Major
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO PreUniversity 
							([HighSchoolPrep], Major, [ClassTypes])
							SELECT [HighSchoolPrep], Major, [ClassTypes]
							FROM @paramsList WHERE Major = @major
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @major
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows; Invalid Majors: ' + @invalidMajors
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_StudentsInMajorInsert]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_StudentsInMajorInsert]
	@paramsList ut_StudentsInMajor READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(100) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major)
					BEGIN
						SET @invalidMajors = @invalidMajors + @major + ', '
					END
				ELSE IF EXISTS(SELECT Major FROM StudentsInMajor WHERE Major = @major)
					BEGIN
						UPDATE StudentsInMajor
						SET StudentsInMajor.[Freshman] = p.[Freshman], StudentsInMajor.[Transfer] = p.[Transfer], StudentsInMajor.[White] = p.[White], StudentsInMajor.[AfricanAmerican] = p.[AfricanAmerican], StudentsInMajor.[AmericanIndian] = p.[AmericanIndian],
							StudentsInMajor.[Asian] = p.[Asian], StudentsInMajor.[OtherRaces] = p.[OtherRaces], StudentsInMajor.[Male] = p.[Male], StudentsInMajor.[Female] = p.[Female], StudentsInMajor.[OtherGenders] = p.[OtherGenders],
							StudentsInMajor.[Total] = p.[Total], StudentsInMajor.[GraduatedIn5years] = p.[GraduatedIn5years], StudentsInMajor.[AverageSalary] = p.[AverageSalary], StudentsInMajor.[AverageGPA] = p.[AverageGPA],
							StudentsInMajor.[RetensionYear1] = p.[RetensionYear1], StudentsInMajor.[RetensionYear2] = p.[RetensionYear2], StudentsInMajor.[RetensionYear3] = p.[RetensionYear3], StudentsInMajor.[RetensionYear4] = p.[RetensionYear4], 
							StudentsInMajor.[FreshmanRetension] = p.[FreshmanRetension], StudentsInMajor.[TransferRetension] = p.[TransferRetension], StudentsInMajor.[AverageGPAFreshman] = p.[AverageGPAFreshman], 
							StudentsInMajor.[AverageGPATransfer] = p.[AverageGPATransfer], StudentsInMajor.[UGResearch] = p.[UGResearch], StudentsInMajor.[GPIPEligible] = p.[GPIPEligible], StudentsInMajor.[GPIPInterns] = p.[GPIPInterns],
							StudentsInMajor.[GraduatedWithJobs] = p.[GraduatedWithJobs], StudentsInMajor.[JoinedGraduateSchool] = p.[JoinedGraduateSchool], StudentsInMajor.[StudentsTo1Faculty] = p.[StudentsTo1Faculty]
						FROM @paramsList p WHERE p.Major = StudentsInMajor.Major
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO StudentsInMajor 
							([Freshman], Major, [Transfer], [White], [AfricanAmerican], [AmericanIndian], [Asian], [OtherRaces], [Male], [Female], [OtherGenders], [Total], [GraduatedIn5years], [AverageSalary], [AverageGPA],
								[RetensionYear1], [RetensionYear2], [RetensionYear3], [RetensionYear4], [FreshmanRetension], [TransferRetension], [AverageGPAFreshman], [AverageGPATransfer], [UGResearch], [GPIPEligible],
								[GPIPInterns], [GraduatedWithJobs], [JoinedGraduateSchool], [StudentsTo1Faculty])
							SELECT [Freshman], Major, [Transfer], [White], [AfricanAmerican], [AmericanIndian], [Asian], [OtherRaces], [Male], [Female], [OtherGenders], [Total], [GraduatedIn5years], [AverageSalary], [AverageGPA],
								[RetensionYear1], [RetensionYear2], [RetensionYear3], [RetensionYear4], [FreshmanRetension], [TransferRetension], [AverageGPAFreshman], [AverageGPATransfer], [UGResearch], [GPIPEligible],
								[GPIPInterns], [GraduatedWithJobs], [JoinedGraduateSchool], [StudentsTo1Faculty]
							FROM @paramsList WHERE Major = @major
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @major
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows; Invalid Majors: ' + @invalidMajors
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UniversityInsert]    Script Date: 5/19/2023 1:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UniversityInsert]
	@paramsList ut_University READONLY
AS
BEGIN
	BEGIN TRY
		-- Check for duplicate code before inserting --
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(100) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major)
					BEGIN
						SET @invalidMajors = @invalidMajors + @major + ', '
					END
				ELSE IF EXISTS(SELECT Major FROM University WHERE Major = @major)
					BEGIN
						UPDATE University
						SET University.[SampleCurriculam] = p.[SampleCurriculam], University.[FinancialAid] = p.[FinancialAid], University.[Safety] = p.[Safety], University.[DegreesAwarded] = p.[DegreesAwarded], 
							University.[DegreesAwardedBS] = p.[DegreesAwardedBS], University.[DegreesAwardedMS] = p.[DegreesAwardedMS], University.[DegreesAwardedPhD] = p.[DegreesAwardedPhD], 
							University.[CostOfAttendance] = p.[CostOfAttendance], University.[TuitionInState] = p.[TuitionInState], University.[TuitionOutOfState] = p.[TuitionOutOfState],
							University.[BoardCosts] = p.[BoardCosts], University.[Male] = p.[Male], University.[Female] = p.[Female], University.[OtherGenders] = p.[OtherGenders],
							University.[White] = p.[White], University.[AfricanAmerican] = p.[AfricanAmerican], University.[AmericanIndian] = p.[AmericanIndian], University.[Asian] = p.[Asian], 
							University.[OtherRaces] = p.[OtherRaces], University.[AcceptanceRate] = p.[AcceptanceRate], University.[AverageGPA] = p.[AverageGPA], 
							University.[StudentsTo1Faculty] = p.[StudentsTo1Faculty], University.[GraduationRate4Year] = p.[GraduationRate4Year], University.[GraduationRate6Year] = p.[GraduationRate6Year], University.[RetentionRate] = p.[RetentionRate],
							University.[PlacementRate] = p.[PlacementRate], University.[AverageClassSize] = p.[AverageClassSize]
						FROM @paramsList p WHERE p.Major = University.Major
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO University 
							([SampleCurriculam], Major, [FinancialAid], [Safety], [DegreesAwarded], [DegreesAwardedBS], [DegreesAwardedMS], [DegreesAwardedPhD], [CostOfAttendance], [TuitionInState], [TuitionOutOfState], 
								[BoardCosts], [Male], [Female], [OtherGenders],	[White], [AfricanAmerican], [AmericanIndian], [Asian], [OtherRaces], [AcceptanceRate], [AverageGPA], [StudentsTo1Faculty], [GraduationRate4Year], 
								[GraduationRate6Year],	[RetentionRate], [PlacementRate], [AverageClassSize])
							SELECT [SampleCurriculam], Major, [FinancialAid], [Safety], [DegreesAwarded], [DegreesAwardedBS], [DegreesAwardedMS], [DegreesAwardedPhD], [CostOfAttendance], [TuitionInState], [TuitionOutOfState],
								[BoardCosts], [Male], [Female], [OtherGenders],	[White], [AfricanAmerican], [AmericanIndian], [Asian], [OtherRaces], [AcceptanceRate], [AverageGPA], [StudentsTo1Faculty], [GraduationRate4Year],
								[GraduationRate6Year], [RetentionRate], [PlacementRate], [AverageClassSize]
							FROM @paramsList WHERE Major = @major
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @major
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows; Invalid Majors: ' + @invalidMajors
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [Compass_db] SET  READ_WRITE 
GO
