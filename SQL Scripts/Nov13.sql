USE [master]
GO
/****** Object:  Database [Compass_db]    Script Date: 11/13/2023 4:27:38 PM ******/
CREATE DATABASE [Compass_db]
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

/*************** Types to be used in stored procedures to accept objects as parameter **************/
/* The name of the type is the same as table corresponding to the structure of the object */
/* the type names start with 'ut' to denote them as 'User defined type'  */

/****** Object:  UserDefinedTableType [dbo].[ut_Alumni]    Script Date: 11/13/2023 4:27:38 PM ******/
CREATE TYPE [dbo].[ut_Alumni] AS TABLE(
	[Major] [varchar](15) NULL,
	[Name] [nvarchar](50) NULL,
	[Graduation] [varchar](15) NULL,
	[Employment] [nvarchar](100) NULL,
	[PhotoUrl] [nvarchar](max) NULL,
	[ProfileUrl] [nvarchar](max) NULL,
	[DateCollected] [nvarchar](50) NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[ut_Courses]    Script Date: 11/13/2023 4:27:38 PM ******/
CREATE TYPE [dbo].[ut_Courses] AS TABLE(
	[Name] [nvarchar](100) NULL,
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
	[AverageClassSize] [float] NULL,
	[RecommendedSem] [varchar](20) NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[ut_Faculty]    Script Date: 11/13/2023 4:27:38 PM ******/
CREATE TYPE [dbo].[ut_Faculty] AS TABLE(
	[Department] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Link] [nvarchar](max) NULL,
	[PhotoUrl] [nvarchar](max) NULL,
	[Title] [varchar](150) NULL,
	[Phone] [varchar](40) NULL,
	[Email] [nvarchar](50) NULL,
	[About] [text] NULL,
	[Publications] [text] NULL,
	[Education] [text] NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[ut_JobTitles]    Script Date: 11/13/2023 4:27:38 PM ******/
CREATE TYPE [dbo].[ut_JobTitles] AS TABLE(
	[Major] [varchar](15) NULL,
	[Title] [varchar](100) NULL,
	[Tasks] [text] NULL,
	[Skills] [text] NULL,
	[Knowledge] [text] NULL,
	[Abilities] [text] NULL,
	[MedianPay] [varchar](50) NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[ut_List]    Script Date: 11/13/2023 4:27:38 PM ******/
CREATE TYPE [dbo].[ut_List] AS TABLE(
	[item] [nvarchar](max) NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[ut_Majors]    Script Date: 11/13/2023 4:27:38 PM ******/
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
	[Summary] [text] NULL,
	[Department] [varchar](50) NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[ut_PostUniversity]    Script Date: 11/13/2023 4:27:38 PM ******/
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
	[OtherGenders] [float] NULL,
	[DegreesAwards] [int] NULL,
	[DegreesGrowth] [float] NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[ut_Prerequisites]    Script Date: 11/13/2023 4:27:38 PM ******/
CREATE TYPE [dbo].[ut_Prerequisites] AS TABLE(
	[Course] [varchar](15) NULL,
	[Prerequisite] [varchar](15) NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[ut_PreUniversity]    Script Date: 11/13/2023 4:27:38 PM ******/
CREATE TYPE [dbo].[ut_PreUniversity] AS TABLE(
	[Major] [varchar](15) NULL,
	[HighSchoolPrep] [text] NULL,
	[ClassTypes] [text] NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[ut_RequiredCourses]    Script Date: 11/13/2023 4:27:38 PM ******/
CREATE TYPE [dbo].[ut_RequiredCourses] AS TABLE(
	[Major] [varchar](15) NULL,
	[Course] [varchar](15) NULL,
	[Semester] [int] NULL
)
GO

/****** Object:  UserDefinedTableType [dbo].[ut_StudentsInMajor]    Script Date: 11/13/2023 4:27:38 PM ******/
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

/****** Object:  UserDefinedTableType [dbo].[ut_University]    Script Date: 11/13/2023 4:27:38 PM ******/
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
	[StudentsTo1Faculty] [varchar](50) NULL,
	[GraduationRate4Year] [float] NULL,
	[GraduationRate6Year] [float] NULL,
	[RetentionRate] [float] NULL,
	[AverageClassSize] [tinyint] NULL,
	[PlacementRate] [float] NULL,
	[CostOfAttendance] [float] NULL,
	[TuitionInState] [float] NULL,
	[TuitionOutOfState] [float] NULL,
	[BoardCosts] [float] NULL,
	[FinancialAid] [text] NULL,
	[Safety] [text] NULL
)
GO

/****************************** Tables to store data *****************************/

/****** Object:  Table [dbo].[Alumni]    Script Date: 11/13/2023 4:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* To store the alumni data. Contains the basic details of the alumni along with the name of the image file in PhotoURL 
	and LinkedIn in ProfileURL */

CREATE TABLE [dbo].[Alumni](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Major] [varchar](15) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Graduation] [varchar](15) NULL,
	[Employment] [nvarchar](100) NULL,
	[PhotoUrl] [nvarchar](max) NULL,
	[ProfileUrl] [nvarchar](max) NOT NULL,
	[DateCollected] [nvarchar](50) NULL,
 CONSTRAINT [PK_Alumni] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Courses]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Name] [nvarchar](100) NOT NULL,
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
	[AverageClassSize] [float] NOT NULL,
	[RecommendedSem] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Courses_1] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Courses_Code_Unique] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ElectiveCourses]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Contains the mapping between the majors and their elective courses. Both the Major and Course should contain the corresponding codes from the Major and Course tables 
	We are currently not using this table */

CREATE TABLE [dbo].[ElectiveCourses](
	[Major] [varchar](15) NOT NULL,
	[Course] [varchar](15) NOT NULL,
	[Type] [varchar](15) NULL,
 CONSTRAINT [PK_ElectiveCourses_1] PRIMARY KEY CLUSTERED 
(
	[Major] ASC,
	[Course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Faculty]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Details of the faculties along with the 'Link' to their official university page and 'PhotoUrl' to the path containg their photo. 
	'Department' shows the department they are part of. Multiple majors can be in the same Department. Use the department code used
	in the Majors table */

CREATE TABLE [dbo].[Faculty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Link] [nvarchar](max) NULL,
	[PhotoUrl] [nvarchar](max) NULL,
	[Title] [varchar](150) NOT NULL,
	[Phone] [varchar](40) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[About] [text] NULL,
	[Publications] [text] NULL,
	[Education] [text] NULL,
	[Department] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[JobTitles]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Contains the details about the possible jobs in different majors. Every major can have multiple possible jobs.
	Currently this table contains only one job title for each major. */

CREATE TABLE [dbo].[JobTitles](
	[Major] [varchar](15) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Tasks] [text] NOT NULL,
	[Skills] [text] NOT NULL,
	[Knowledge] [text] NOT NULL,
	[Abilities] [text] NOT NULL,
	[MedianPay] [varchar](50) NOT NULL,
 CONSTRAINT [PK_JobTitles] PRIMARY KEY CLUSTERED 
(
	[Major] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Locations]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Can be used to store the locations of different available jobs. We are currently not using this table. */

CREATE TABLE [dbo].[Locations](
	[Id] [int] NOT NULL,
	[Name] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Majors]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Used to store the details of available majors. 'ImgUrl is used to store the url to the path containing the image for the Major.
	We are not currently using the 'ImgUrl'. 'CurriculamFlexibility' represents the flexibility of the course. This value is not
	calculated in the database, but directly fetched from the excel sheet, along with the other values. Every major has a 'Department'
	and multiple majors can be part of the same department. Faculty information is fetched using the 'Department' value. */

CREATE TABLE [dbo].[Majors](
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
	[Department] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Majors_1] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MajorsAndLocations]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For storing the salary for different majors in different location. Not using this table currently */
CREATE TABLE [dbo].[MajorsAndLocations](
	[Major] [varchar](15) NOT NULL,
	[LocationId] [int] NOT NULL,
	[AverageSalary] [int] NOT NULL,
 CONSTRAINT [PK_MajorsAndLocations_1] PRIMARY KEY CLUSTERED 
(
	[Major] ASC,
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PostUniversity]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Table for saving the data related to post graduation. Majority of the attributes like Male, Female ratios are not used currently. */
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
	[DegreesAwards] [int] NULL,
	[DegreesGrowth] [float] NULL,
 CONSTRAINT [PK_PostUniversity] PRIMARY KEY CLUSTERED 
(
	[Major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Prerequisites]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Table for storing the prerequisite courses for different courses. The code for the courses is used in both the columns. */
CREATE TABLE [dbo].[Prerequisites](
	[Course] [varchar](15) NOT NULL,
	[Prerequisite] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Prerequisites_1] PRIMARY KEY CLUSTERED 
(
	[Course] ASC,
	[Prerequisite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PreUniversity]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Table for saving the data related to before joining the university. This table is not used currently. */
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

/****** Object:  Table [dbo].[RequiredCourses]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Table for storing the required courses for a major, along the desired semester to pick the course. */
CREATE TABLE [dbo].[RequiredCourses](
	[Major] [varchar](15) NOT NULL,
	[Course] [varchar](15) NOT NULL,
	[Semester] [int] NULL,
 CONSTRAINT [PK_RequiredCourses_1] PRIMARY KEY CLUSTERED 
(
	[Major] ASC,
	[Course] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[StudentsInMajor]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Table for saving the data related to students in a major. Majority of the attributes like Male, Female ratios are not used currently. */
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

/****** Object:  Table [dbo].[University]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* Table for saving the data related to students in a major. Majority of the attributes like Male, Female ratios are not used currently.
	A lot of the attributes are similar to the one in the table StudentsInMajor. */
CREATE TABLE [dbo].[University](
	[Major] [varchar](15) NOT NULL,
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
	[StudentsTo1Faculty] [varchar](50) NULL,
	[GraduationRate4Year] [float] NULL,
	[GraduationRate6Year] [float] NULL,
	[RetentionRate] [float] NULL,
	[AverageClassSize] [tinyint] NULL,
	[PlacementRate] [float] NULL,
	[CostOfAttendance] [float] NULL,
	[TuitionInState] [float] NULL,
	[TuitionOutOfState] [float] NULL,
	[BoardCosts] [float] NULL,
	[FinancialAid] [text] NULL,
	[Safety] [text] NULL,
 CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED 
(
	[Major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/* Default values for attributes in tables */

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

/* Foriegn key references between tables. */

ALTER TABLE [dbo].[Alumni]  WITH CHECK ADD  CONSTRAINT [FK_Alumni_Majors] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Code])
GO
ALTER TABLE [dbo].[Alumni] CHECK CONSTRAINT [FK_Alumni_Majors]
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
ALTER TABLE [dbo].[Prerequisites]  WITH CHECK ADD  CONSTRAINT [FK_Prerequisites_Courses_prerequisite] FOREIGN KEY([Prerequisite])
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

/****** Object:  StoredProcedure [dbo].[usp_AlumniForMajorGet]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For fetching all the alumni for a major. In the absence of the major parameter, all alumni for all the majors are returned. */

CREATE PROCEDURE [dbo].[usp_AlumniForMajorGet]
	@major varchar(15) = NULL
AS
BEGIN
	SELECT * FROM Alumni a
		WHERE a.Major = COALESCE(@major, Major);
END
GO

/****** Object:  StoredProcedure [dbo].[usp_AlumniInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the alumni data to the Alumni table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_AlumniInsert]
	@paramsList ut_Alumni READONLY
AS
BEGIN
	BEGIN TRY
		DECLARE @profileUrl NVARCHAR(MAX)
		DECLARE @major NVARCHAR(30)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major, ProfileUrl FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major, @profileUrl

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check if the major name is valid
				IF NOT EXISTS(SELECT Code FROM Majors WHERE code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				-- Check if the alumni profile already exists
				ELSE IF EXISTS(SELECT ProfileUrl FROM Alumni WHERE ProfileUrl = @profileUrl)
					BEGIN
						UPDATE Alumni
						SET Alumni.[Name] = p.[Name], Alumni.[Graduation] = p.[Graduation], Alumni.[PhotoUrl] = p.[PhotoUrl], Alumni.[Employment] = p.[Employment], 
						Alumni.[Major] = p.[Major], Alumni.[DateCollected] = p.[DateCollected]
						FROM @paramsList p WHERE p.ProfileUrl = Alumni.ProfileUrl
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO Alumni 
							([Name], [Graduation], [PhotoUrl], [Employment], [ProfileUrl], [Major], [DateCollected])
							SELECT [Name], [Graduation], [PhotoUrl], [Employment], [ProfileUrl], [Major], [DateCollected]
							FROM @paramsList WHERE ProfileUrl = @profileUrl
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @major, @profileUrl
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

/****** Object:  StoredProcedure [dbo].[usp_CoursePrerequisitesGet]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For fetching all the prerequisites for a course. */

CREATE PROCEDURE [dbo].[usp_CoursePrerequisitesGet]
	@course varchar(15)
AS
BEGIN
	SELECT Prerequisite FROM Prerequisites WHERE Course = @course;
END
GO

/****** Object:  StoredProcedure [dbo].[usp_CoursesForMajorGet]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For fetching all the required courses for a major. */

CREATE PROCEDURE [dbo].[usp_CoursesForMajorGet]
	@major varchar(15)
AS
BEGIN
	SELECT c.Code, c.Name, c.Summary, c.Credits, rc.Semester FROM RequiredCourses rc INNER JOIN Courses c ON rc.Course = c.Code
		WHERE rc.Major = @major;
END
GO

/****** Object:  StoredProcedure [dbo].[usp_CoursesGet]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For fetching all the courses containing a particular substring (@name) in its name; or the course with a particular code.
	In the absence of the parameters, all courses are returned. */

CREATE PROCEDURE [dbo].[usp_CoursesGet]
	@code varchar(15) = NULL,
	@name varchar(50) = NULL
AS
BEGIN
	SELECT * FROM Courses
		WHERE Code = coalesce(@code, Code) AND Name LIKE '%' + coalesce(@name, Name) + '%';
END
GO

/****** Object:  StoredProcedure [dbo].[usp_CoursesInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the courses data to the Courses table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_CoursesInsert]
	@paramsList ut_Courses READONLY
AS
BEGIN
	BEGIN TRY
		DECLARE @code VARCHAR(15)
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Code, Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @code, @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check whether the major code is valid.
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major) AND (@major NOT LIKE '%GEN')
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				-- Check whether the courses with the same code already exists.
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
							FROM @paramsList WHERE Code = @code
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

/****** Object:  StoredProcedure [dbo].[usp_CriteriaForMajorsGet]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For fetching all the criterias for the list of majors. */

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

/****** Object:  StoredProcedure [dbo].[usp_CriteriaGet]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For fetching all the avaliable criterias (column names of tables like 'PreUniversity', 'University', 'PostUniversity', 'StudentsInMajor').
	Currently we are not using this SP. */

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

/****** Object:  StoredProcedure [dbo].[usp_FacultyForDepartmentGet]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For fetching all the faculties for a department. In the absence of the dept parameter, all faculties for all the departments are returned. */

CREATE PROCEDURE [dbo].[usp_FacultyForDepartmentGet]
	@dept varchar(50) = NULL
AS
BEGIN
	SELECT * FROM Faculty f
		WHERE f.Department = COALESCE(@dept, Department);
END
GO

/****** Object:  StoredProcedure [dbo].[usp_FacultyInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the faculty data to the Faculty table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_FacultyInsert]
	@paramsList ut_Faculty READONLY
AS
BEGIN
	BEGIN TRY
		DECLARE @email NVARCHAR(30)
		DECLARE @dept NVARCHAR(30)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidDepts AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Department, Email FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @dept, @email

		-- Fetch all the available departments to #departments
		SELECT DISTINCT Department INTO #departments FROM Majors

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check if the department name is valid
				IF NOT EXISTS(SELECT Department FROM #departments WHERE Department = @dept)
					BEGIN
						IF CHARINDEX(@dept,@invalidDepts) <= 0
							BEGIN
								SET @invalidDepts = @invalidDepts + @dept + ', '
							END
					END
				-- Check if the faculty email already exists for that particular departments. Same faculty can be in multiple departments.
				ELSE IF EXISTS(SELECT Email FROM Faculty WHERE Email = @email AND Department = @dept)
					BEGIN
						UPDATE Faculty
						SET Faculty.[Name] = p.[Name], Faculty.[Link] = p.[Link], Faculty.[PhotoUrl] = p.[PhotoUrl], Faculty.[Title] = p.[Title], Faculty.[Phone] = p.[Phone],
							Faculty.[About] = p.[About], Faculty.[Publications] = p.[Publications], Faculty.[Education] = p.[Education]
						FROM @paramsList p WHERE p.Email = Faculty.Email AND p.Department = Faculty.Department
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO Faculty 
							([Name], Email, [Link], [PhotoUrl], [Title], [Phone], [About], [Publications], [Education], [Department])
							SELECT [Name], Email, [Link], [PhotoUrl], [Title], [Phone], [About], [Publications], [Education], [Department]
							FROM @paramsList WHERE Email = @email AND Department = @dept
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @dept, @email
			END
		
		DROP TABLE #departments

		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated ' + STR(@updateCount) + ' rows; Invalid Departments: ' + @invalidDepts
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[usp_JobsForMajorGet]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For fetching all the jobs available for a major. In the absence of the major parameter, all available jobs for all the majors are returned. */

CREATE PROCEDURE [dbo].[usp_JobsForMajorGet]
	@major varchar(15) = NULL
AS
BEGIN
	SELECT * FROM JobTitles j
		WHERE j.Major = COALESCE(@major, Major);
END
GO

/****** Object:  StoredProcedure [dbo].[usp_JobTitlesInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the job data to the JobTitles table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_JobTitlesInsert]
	@paramsList ut_JobTitles READONLY
AS
BEGIN
	BEGIN TRY
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
				-- Check whether the major is valid
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				-- Currently we are considering only one job for each major. This has to be modified for implementing our initial idea of adding multiple jobtitles for a major.  
				ELSE IF EXISTS(SELECT Major FROM JobTitles WHERE Major = @major)
					BEGIN
						UPDATE JobTitles
						SET JobTitles.Title = p.Title, JobTitles.Tasks = p.Tasks, JobTitles.Skills = p.Skills, JobTitles.Knowledge = p.Knowledge, 
							JobTitles.Abilities = p.Abilities, JobTitles.MedianPay = p.MedianPay
						FROM @paramsList p WHERE p.Major = JobTitles.Major
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO JobTitles 
							(Title, Major, Tasks, Skills, Knowledge, Abilities, MedianPay)
							SELECT Title, Major, Tasks, Skills, Knowledge, Abilities, MedianPay
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

/****** Object:  StoredProcedure [dbo].[usp_MajorsGet]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For fetching all the majors containing a particular substring (@name) in its name; or the major with a particular code.
	In the absence of the parameters, all majors are returned. */

CREATE PROCEDURE [dbo].[usp_MajorsGet]
	@code varchar(10) = NULL,
	@name varchar(50) = NULL
AS
BEGIN
	SELECT * FROM Majors
		WHERE Code = coalesce(@code, Code) AND Name LIKE '%' + coalesce(@name, Name) + '%';
END
GO

/****** Object:  StoredProcedure [dbo].[usp_MajorsInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the majors data to the Majors table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_MajorsInsert]
	@paramsList ut_Majors READONLY
AS
BEGIN
	BEGIN TRY
		DECLARE @code VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Code FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @code

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check whether the major is already inserted.
				IF EXISTS(SELECT Code FROM Majors WHERE Code = @code)
					BEGIN
						UPDATE Majors
						SET Majors.[Name] = p.[Name], Majors.CurriculamFlexibility = p.CurriculamFlexibility, Majors.MinimumCredit = p.MinimumCredit,
							Majors.MinMathCourses = p.MinMathCourses, Majors.MinPhysicsCourses = p.MinPhysicsCourses, Majors.MinChemistryCourses = p.MinChemistryCourses,
							Majors.MinGeneralCourses = p.MinGeneralCourses, Majors.MinElectiveCourses = p.MinElectiveCourses, Majors.GraduateSchoolAvailable = p.GraduateSchoolAvailable,
							Majors.TuitionInState = p.TuitionInState, Majors.TuitionOutOfState = p.TuitionOutOfState, Majors.LabHours = p.LabHours, Majors.Summary =p.Summary, Majors.Department =p.Department
						FROM @paramsList p WHERE p.Code = Majors.Code
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
					INSERT INTO Majors 
						([Name], [Code], [CurriculamFlexibility], [MinimumCredit], [MinMathCourses], [MinPhysicsCourses], [MinChemistryCourses], [MinGeneralCourses],       
							[MinElectiveCourses], [GraduateSchoolAvailable], [TuitionInState], [TuitionOutOfState], [LabHours], [Summary], [Department])               
						SELECT [Name], [Code], [CurriculamFlexibility], [MinimumCredit], [MinMathCourses], [MinPhysicsCourses], [MinChemistryCourses], [MinGeneralCourses],       
							[MinElectiveCourses], [GraduateSchoolAvailable], [TuitionInState], [TuitionOutOfState], [LabHours], [Summary], [Department]  
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

/****** Object:  StoredProcedure [dbo].[usp_PostUniversityInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the PostUniversity data to the PostUniversity table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_PostUniversityInsert]
	@paramsList ut_PostUniversity READONLY
AS
BEGIN
	BEGIN TRY
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
				-- Check whether the major is valid.
				IF NOT EXISTS(SELECT 1 FROM Majors WHERE Code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				-- Check whether the table already contains the data for that major.
				ELSE IF EXISTS(SELECT 1 FROM PostUniversity WHERE Major = @major)
					BEGIN
						UPDATE PostUniversity
						SET PostUniversity.[AverageAge] = p.[AverageAge], PostUniversity.[MedianSalaryPerYear] = p.[MedianSalaryPerYear], PostUniversity.[WorkExperience] = p.[WorkExperience], PostUniversity.[JobsCount] = p.[JobsCount], 
							PostUniversity.[CurrentWorkforce] = p.[CurrentWorkforce], PostUniversity.[Requirements] = p.[Requirements], PostUniversity.[WorkEnvironment] = p.[WorkEnvironment], 
							PostUniversity.[WorkSchedule] = p.[WorkSchedule], PostUniversity.[MedianSalaryPerHour] = p.[MedianSalaryPerHour], PostUniversity.[ExpectedGrowth] = p.[ExpectedGrowth],
							PostUniversity.[Male] = p.[Male], PostUniversity.[Female] = p.[Female], PostUniversity.[OtherGenders] = p.[OtherGenders], PostUniversity.DegreesAwards = p.DegreesAwards,
							PostUniversity.DegreesGrowth = p.DegreesGrowth
						FROM @paramsList p WHERE p.Major = PostUniversity.Major
						SET @updateCount = @updateCount + 1
					END
				ELSE
					BEGIN
						INSERT INTO PostUniversity 
							([Major], [AverageAge], [MedianSalaryPerYear], [WorkExperience], [JobsCount], [CurrentWorkforce], [Requirements], [WorkEnvironment], [WorkSchedule], [MedianSalaryPerHour], [ExpectedGrowth], 
								[Male], [Female], [OtherGenders], DegreesAwards, DegreesGrowth)
							SELECT [Major], [AverageAge], [MedianSalaryPerYear], [WorkExperience], [JobsCount], [CurrentWorkforce], [Requirements], [WorkEnvironment], [WorkSchedule], [MedianSalaryPerHour], [ExpectedGrowth],
								[Male], [Female], [OtherGenders], DegreesAwards, DegreesGrowth
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

/****** Object:  StoredProcedure [dbo].[usp_PrerequisitesInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the Prerequisites data to the Prerequisites table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_PrerequisitesInsert]
	@paramsList ut_Prerequisites READONLY
AS
BEGIN
	BEGIN TRY
		DECLARE @course VARCHAR(15)
		DECLARE @prerequisite VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @invalidCourses AS VARCHAR(MAX) = ''
		DECLARE @invalidPrerequisites AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Course, Prerequisite FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @course, @prerequisite

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check whether the course is valid.
				IF NOT EXISTS(SELECT 1 FROM Courses WHERE Code = @course)
					BEGIN
						IF CHARINDEX(@course,@invalidCourses) <= 0
							BEGIN
								SET @invalidCourses = @invalidCourses + @course + ', '
							END
					END
				-- Check whether the prerequisite course is valid.
				ELSE IF NOT EXISTS(SELECT 1 FROM Courses WHERE Code = @prerequisite)
					BEGIN
						IF CHARINDEX(@prerequisite,@invalidPrerequisites) <= 0
							BEGIN
								SET @invalidPrerequisites = @invalidPrerequisites + @prerequisite + ', '
							END
					END
				ELSE IF NOT EXISTS(SELECT 1 FROM Prerequisites WHERE Course = @course AND Prerequisite = @prerequisite)
					BEGIN
						INSERT INTO Prerequisites (Course, Prerequisite)
							VALUES (@course, @prerequisite);
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @course, @prerequisite
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Invalid Courses: ' + @invalidCourses + '; Invalid Prerequisites: ' + @invalidPrerequisites;
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[usp_PreUniversityInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the PreUniversity data to the PreUniversity table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_PreUniversityInsert]
	@paramsList ut_PreUniversity READONLY
AS
BEGIN
	BEGIN TRY
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check whether the major is valid.
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				-- Check whether the course already exists in the table.
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

/****** Object:  StoredProcedure [dbo].[usp_RequiredCoursesInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the RequiredCourses data to the RequiredCourses table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_RequiredCoursesInsert]
	@paramsList ut_RequiredCourses READONLY
AS
BEGIN
	BEGIN TRY
		DECLARE @major VARCHAR(15)
		DECLARE @course VARCHAR(15)
		DECLARE @semester INT
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(MAX) = ''
		DECLARE @invalidCourses AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major, Course, Semester FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major, @course, @semester

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check whether the major is valid.
				IF NOT EXISTS(SELECT 1 FROM Majors WHERE Code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				-- Check whether the course is valid.
				ELSE IF NOT EXISTS(SELECT 1 FROM Courses WHERE Code = @course)
					BEGIN
						IF CHARINDEX(@course,@invalidCourses) <= 0
							BEGIN
								SET @invalidCourses = @invalidCourses + @course + ', '
							END
					END
				-- Check whether the course is already added for that major.
				ELSE IF EXISTS(SELECT 1 FROM RequiredCourses WHERE Major = @major AND Course = @course)
					BEGIN
						UPDATE RequiredCourses SET Semester = @semester WHERE Major = @major AND Course = @course;
						SET @updateCount = @updateCount + 1
					END
				ELSE IF NOT EXISTS(SELECT 1 FROM RequiredCourses WHERE Major = @major AND Course = @course)
					BEGIN
						INSERT INTO RequiredCourses 
							(Major, Course, Semester)
							VALUES (@major, @course, @semester);
							SET @insertCount = @insertCount + 1
					END
				FETCH NEXT FROM codeCursor INTO @major, @course, @semester
			END
				
		CLOSE codeCursor;
		DEALLOCATE codeCursor
		
		SELECT 'Inserted ' + STR(@insertCount) + ' rows; Updated' + STR(@updateCount) +' rows; Invalid Majors: ' + @invalidMajors + '; Invalid Courses: ' + @invalidCourses
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END
GO

/****** Object:  StoredProcedure [dbo].[usp_StudentsInMajorInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the StudentsInMajor data to the StudentsInMajor table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_StudentsInMajorInsert]
	@paramsList ut_StudentsInMajor READONLY
AS
BEGIN
	BEGIN TRY
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check whether the Major is valid.
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				-- Check whether the data is already added for that major.
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

/****** Object:  StoredProcedure [dbo].[usp_UniversityInsert]    Script Date: 11/13/2023 4:27:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* For inserting the University data to the University table from an excel sheet. */

CREATE PROCEDURE [dbo].[usp_UniversityInsert]
	@paramsList ut_University READONLY
AS
BEGIN
	BEGIN TRY
		DECLARE @major VARCHAR(15)
		DECLARE @insertCount AS SMALLINT = 0
		DECLARE @updateCount AS SMALLINT = 0
		DECLARE @invalidMajors AS VARCHAR(MAX) = ''

		DECLARE codeCursor CURSOR STATIC FOR
			SELECT Major FROM @paramsList

		OPEN codeCursor
		FETCH NEXT FROM codeCursor INTO @major

		WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Check whether the major is valid.
				IF NOT EXISTS(SELECT Code FROM Majors WHERE Code = @major)
					BEGIN
						IF CHARINDEX(@major,@invalidMajors) <= 0
							BEGIN
								SET @invalidMajors = @invalidMajors + @major + ', '
							END
					END
				-- Check whether the data is already added for that major.
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
