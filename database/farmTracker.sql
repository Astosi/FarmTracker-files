USE [master]
GO
/****** Object:  Database [farmTracker]    Script Date: 11/4/2020 5:40:11 PM ******/
CREATE DATABASE [farmTracker]
 CONTAINMENT = NONE
GO
ALTER DATABASE [farmTracker] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [farmTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [farmTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [farmTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [farmTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [farmTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [farmTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [farmTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [farmTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [farmTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [farmTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [farmTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [farmTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [farmTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [farmTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [farmTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [farmTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [farmTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [farmTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [farmTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [farmTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [farmTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [farmTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [farmTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [farmTracker] SET RECOVERY FULL 
GO
ALTER DATABASE [farmTracker] SET  MULTI_USER 
GO
ALTER DATABASE [farmTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [farmTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [farmTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [farmTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [farmTracker] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'farmTracker', N'ON'
GO
ALTER DATABASE [farmTracker] SET QUERY_STORE = OFF
GO
USE [farmTracker]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [farmTracker]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/4/2020 5:40:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[CUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[subCategoryFlag] [bit] NULL,
	[subCategoryOfCUID] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoryOfProperties]    Script Date: 11/4/2020 5:40:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoryOfProperties](
	[PUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[TUID] [int] NOT NULL,
	[CUID] [int] NOT NULL,
 CONSTRAINT [PK_CategoryOfProperties] PRIMARY KEY CLUSTERED 
(
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[codeType]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[codeType](
	[CTUID] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](16) NOT NULL,
 CONSTRAINT [PK_codeType] PRIMARY KEY CLUSTERED 
(
	[CTUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[collaborators]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collaborators](
	[FUID] [uniqueidentifier] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[RUID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_collaborators] PRIMARY KEY CLUSTERED 
(
	[FUID] ASC,
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COPTypes]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COPTypes](
	[TUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_COPTypes] PRIMARY KEY CLUSTERED 
(
	[TUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COPValues]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COPValues](
	[value] [nvarchar](50) NOT NULL,
	[PUID] [int] NOT NULL,
 CONSTRAINT [PK_COPValues] PRIMARY KEY CLUSTERED 
(
	[value] ASC,
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cRoles]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cRoles](
	[RUID] [uniqueidentifier] NOT NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[basicRoleFlag] [bit] NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
	[can_create_property] [bit] NULL,
 CONSTRAINT [PK_cRoles] PRIMARY KEY CLUSTERED 
(
	[RUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entityCOPValues]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entityCOPValues](
	[EUID] [uniqueidentifier] NOT NULL,
	[PUID] [int] NOT NULL,
	[value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EntityCOPValues] PRIMARY KEY CLUSTERED 
(
	[EUID] ASC,
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entityDetails]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entityDetails](
	[DUID] [uniqueidentifier] NOT NULL,
	[EUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[cost] [money] NULL,
	[remainderDate] [datetime] NULL,
	[remainderCompletedFlag] [bit] NULL,
	[remainderCompletedDate] [datetime] NULL,
	[remainderCompletedByUUID] [uniqueidentifier] NULL,
	[createdDate] [datetime] NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_entityDetail] PRIMARY KEY CLUSTERED 
(
	[DUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entityOfFP]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entityOfFP](
	[EUID] [uniqueidentifier] NOT NULL,
	[CUID] [int] NOT NULL,
	[PUID] [uniqueidentifier] NOT NULL,
	[ID] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[count] [int] NULL,
	[purchasedDate] [datetime] NULL,
	[cost] [money] NULL,
	[soldFlag] [bit] NOT NULL,
	[soldDate] [datetime] NULL,
	[soldPrice] [money] NULL,
	[soldDetail] [nvarchar](max) NULL,
	[soldByUUID] [uniqueidentifier] NULL,
	[createdDate] [datetime] NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_EntityOfFP] PRIMARY KEY CLUSTERED 
(
	[EUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farmProperties]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farmProperties](
	[PUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[TUID] [int] NOT NULL,
	[FUID] [uniqueidentifier] NOT NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_farmProperties] PRIMARY KEY CLUSTERED 
(
	[PUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farmPropertyType]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farmPropertyType](
	[TUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_farmPropertyType] PRIMARY KEY CLUSTERED 
(
	[TUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[farms]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[farms](
	[FUID] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[createdByUUID] [uniqueidentifier] NOT NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_farms] PRIMARY KEY CLUSTERED 
(
	[FUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[generatedUCodes]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[generatedUCodes](
	[GUC] [uniqueidentifier] NOT NULL,
	[forUUID] [uniqueidentifier] NULL,
	[forIP] [varchar](15) NULL,
	[createdDate] [datetime] NOT NULL,
	[expirationDate] [datetime] NOT NULL,
	[isValid] [bit] NOT NULL,
	[CTUID] [int] NOT NULL,
 CONSTRAINT [PK_generatedUCodes] PRIMARY KEY CLUSTERED 
(
	[GUC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[incomeAndExpeneses]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[incomeAndExpeneses](
	[IEUID] [uniqueidentifier] NOT NULL,
	[FUID] [uniqueidentifier] NOT NULL,
	[incomeFlag] [bit] NOT NULL,
	[date] [datetime] NULL,
	[head] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[cost] [money] NOT NULL,
	[createdByUUID] [uniqueidentifier] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_incomeAndExpeneses] PRIMARY KEY CLUSTERED 
(
	[IEUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[memberType]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberType](
	[MTUID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](16) NULL,
	[farmLimit] [int] NULL,
	[propertyLimit] [int] NULL,
	[entityLimit] [int] NULL,
	[collaboratorLimit] [int] NULL,
	[AdLimit] [int] NULL,
	[supportFlag] [bit] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_memberType] PRIMARY KEY CLUSTERED 
(
	[MTUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[RUID] [int] IDENTITY(1,1) NOT NULL,
	[createdByUUID] [uniqueidentifier] NULL,
	[name] [varchar](50) NOT NULL,
	[sysRoleFlag] [bit] NOT NULL,
	[can_enter_admin_dashboard] [bit] NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[RUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sessions]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sessions](
	[SUID] [uniqueidentifier] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
	[isValid] [bit] NOT NULL,
	[createdDate] [datetime] NULL,
	[lastUsedDate] [datetime] NULL,
 CONSTRAINT [PK_sessions] PRIMARY KEY CLUSTERED 
(
	[SUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[signIn_logs]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[signIn_logs](
	[LUID] [uniqueidentifier] NOT NULL,
	[ipAdd] [varchar](15) NULL,
	[country] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[location] [varchar](50) NULL,
	[hostname] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[attemptedPassword] [varchar](24) NOT NULL,
	[attemptedResult] [bit] NOT NULL,
	[UUID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_signIn_logs] PRIMARY KEY CLUSTERED 
(
	[LUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[UUID] [uniqueidentifier] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [char](24) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[emailActivated] [bit] NULL,
	[phoneNumber] [varchar](16) NULL,
	[phoneNumberActivated] [bit] NULL,
	[name] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[profilPic] [nvarchar](50) NULL,
	[createdDate] [datetime] NULL,
	[deletedFlag] [bit] NOT NULL,
	[deletedDate] [datetime] NULL,
	[deletedByUUID] [uniqueidentifier] NULL,
	[RUID] [int] NOT NULL,
	[MTUID] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (1, N'All', 0, NULL)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (2, N'Anilmal', 1, 1)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (3, N'Plant', 1, 1)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (4, N'Aquarium Fishes', 1, 2)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (5, N'Freshwater', 1, 4)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (6, N'Saltwater', 1, 4)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (7, N'Cichlids', 1, 5)
INSERT [dbo].[categories] ([CUID], [name], [subCategoryFlag], [subCategoryOfCUID]) VALUES (8, N'Blue Dolphin', 1, 7)
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[categoryOfProperties] ON 

INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (1, N'weight', 2, 2)
INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (2, N'height', 2, 1)
INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (3, N'health', 1, 1)
INSERT [dbo].[categoryOfProperties] ([PUID], [name], [TUID], [CUID]) VALUES (4, N'birthDate', 1, 1)
SET IDENTITY_INSERT [dbo].[categoryOfProperties] OFF
SET IDENTITY_INSERT [dbo].[codeType] ON 

INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (3, N'eMail')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (1, N'forgotten')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (5, N'other')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (2, N'phoneNumber')
INSERT [dbo].[codeType] ([CTUID], [type]) VALUES (4, N'signUp')
SET IDENTITY_INSERT [dbo].[codeType] OFF
INSERT [dbo].[collaborators] ([FUID], [UUID], [RUID]) VALUES (N'b4428cb5-491b-eb11-a49c-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', N'2b572f9d-651b-eb11-a49c-201a06a548bb')
SET IDENTITY_INSERT [dbo].[COPTypes] ON 

INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (3, N'bool')
INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (2, N'int')
INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (4, N'select')
INSERT [dbo].[COPTypes] ([TUID], [name]) VALUES (1, N'string')
SET IDENTITY_INSERT [dbo].[COPTypes] OFF
INSERT [dbo].[COPValues] ([value], [PUID]) VALUES (N'Dead', 3)
INSERT [dbo].[COPValues] ([value], [PUID]) VALUES (N'Diseased', 3)
INSERT [dbo].[COPValues] ([value], [PUID]) VALUES (N'Healty', 3)
INSERT [dbo].[cRoles] ([RUID], [createdByUUID], [name], [basicRoleFlag], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [can_create_property]) VALUES (N'2b572f9d-651b-eb11-a49c-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', N'Manager', 1, CAST(N'2020-10-31T10:41:21.770' AS DateTime), 0, NULL, NULL, 1)
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'044d2005-541b-eb11-a49c-201a06a548bb', 4, N'2020-10-30')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'02455853-b01b-eb11-a49c-201a06a548bb', 2, N'20')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'02455853-b01b-eb11-a49c-201a06a548bb', 4, N'2019-11-01')
INSERT [dbo].[entityCOPValues] ([EUID], [PUID], [value]) VALUES (N'89188898-391c-eb11-a49d-201a06a548bb', 2, N'20')
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'ba6d1ab2-581b-eb11-a49c-201a06a548bb', N'981122b8-531b-eb11-a49c-201a06a548bb', N'Blue Dolphine 2 is pregnant', N'Give birth after 15 days', NULL, CAST(N'2020-11-14T20:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-10-31T09:08:53.407' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'6eb5d6d1-171c-eb11-a49d-201a06a548bb', N'02455853-b01b-eb11-a49c-201a06a548bb', N'Detail', N'Description Description Description Description Description', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-11-01T07:57:00.523' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'965c1a4a-181c-eb11-a49d-201a06a548bb', N'02455853-b01b-eb11-a49c-201a06a548bb', N'Remainder', N'Description Description Description Description Description', NULL, CAST(N'2020-11-20T00:00:00.000' AS DateTime), NULL, NULL, NULL, CAST(N'2020-11-01T08:00:22.293' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityDetails] ([DUID], [EUID], [name], [description], [cost], [remainderDate], [remainderCompletedFlag], [remainderCompletedDate], [remainderCompletedByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'a61d078c-3d1c-eb11-a49d-201a06a548bb', N'02455853-b01b-eb11-a49c-201a06a548bb', N'Detail', N'Description Description Description Description Description', NULL, NULL, NULL, NULL, NULL, CAST(N'2020-11-01T12:27:04.277' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'981122b8-531b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 1', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:33:16.040' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'044d2005-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin Babies', N'Babies of Blue Dolphin 1', 100, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:35:25.210' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7d94f42e-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 2', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:36:35.390' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7e94f42e-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 3', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:36:37.903' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7c133539-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 4', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:36:52.590' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7d133539-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 5', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:37:01.100' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'51567445-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 6', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:37:13.137' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'52567445-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 7', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:37:19.623' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'91ba4b4c-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 8', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:37:24.613' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'92ba4b4c-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 9', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:37:30.890' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f728c255-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 10', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:37:40.490' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f828c255-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 11', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:37:46.187' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f928c255-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 12', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:37:48.680' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'0c98325c-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 13', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:37:51.293' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'0d98325c-541b-eb11-a49c-201a06a548bb', 8, N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin 14', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T08:37:54.763' AS DateTime), N'46783cc6-e515-eb11-a495-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'02455853-b01b-eb11-a49c-201a06a548bb', 8, N'1c61593e-af1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T19:36:10.140' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'4dff18b0-b01b-eb11-a49c-201a06a548bb', 8, N'1c61593e-af1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T19:38:45.753' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7daa9cf8-b01b-eb11-a49c-201a06a548bb', 8, N'1c61593e-af1b-eb11-a49c-201a06a548bb', NULL, N'Blue Dolphin', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-10-31T19:40:47.413' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[entityOfFP] ([EUID], [CUID], [PUID], [ID], [name], [description], [count], [purchasedDate], [cost], [soldFlag], [soldDate], [soldPrice], [soldDetail], [soldByUUID], [createdDate], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'89188898-391c-eb11-a49d-201a06a548bb', 8, N'f7d5686a-381c-eb11-a49d-201a06a548bb', NULL, N'Blue Dolphin', NULL, 1, NULL, 0.0000, 0, NULL, NULL, NULL, NULL, CAST(N'2020-11-01T11:58:47.270' AS DateTime), N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [TUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'a8a6b0cf-4c1b-eb11-a49c-201a06a548bb', N'Filed_1', N'desc desc desc desc desc desc desc', 1, N'b4428cb5-491b-eb11-a49c-201a06a548bb', N'46783cc6-e515-eb11-a495-201a06a548bb', CAST(N'2020-10-31T07:44:40.100' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [TUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'ffcb13f1-4c1b-eb11-a49c-201a06a548bb', N'Filed_2', N'desc desc desc desc desc desc desc', 1, N'b4428cb5-491b-eb11-a49c-201a06a548bb', N'46783cc6-e515-eb11-a495-201a06a548bb', CAST(N'2020-10-31T07:44:45.100' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [TUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'b1997bfc-4c1b-eb11-a49c-201a06a548bb', N'Ranch_1', N'desc desc desc desc desc desc desc', 2, N'b4428cb5-491b-eb11-a49c-201a06a548bb', N'46783cc6-e515-eb11-a495-201a06a548bb', CAST(N'2020-10-31T07:45:04.233' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [TUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'b2997bfc-4c1b-eb11-a49c-201a06a548bb', N'Ranch_2', N'desc desc desc desc desc desc desc', 2, N'b4428cb5-491b-eb11-a49c-201a06a548bb', N'46783cc6-e515-eb11-a495-201a06a548bb', CAST(N'2020-10-31T07:45:08.880' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [TUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'51dbf912-4d1b-eb11-a49c-201a06a548bb', N'Ranch_3', N'desc desc desc desc desc desc desc', 2, N'b4428cb5-491b-eb11-a49c-201a06a548bb', N'46783cc6-e515-eb11-a495-201a06a548bb', CAST(N'2020-10-31T07:45:41.970' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [TUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'9f82f778-a61b-eb11-a49c-201a06a548bb', N'Field 1', N'desc desc desc desc desc desc', 1, N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-10-31T18:25:38.290' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [TUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'b78b7bd1-a61b-eb11-a49c-201a06a548bb', N'Field 2', N'desc desc desc desc desc desc', 1, N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-10-31T18:28:06.797' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [TUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'7cb8d62e-af1b-eb11-a49c-201a06a548bb', N'Ranch', N'desc desc desc desc desc desc', 1, N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-10-31T19:27:59.397' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [TUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'1c61593e-af1b-eb11-a49c-201a06a548bb', N'Ranch2', N'desc desc desc desc desc desc', 2, N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-10-31T19:28:25.420' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farmProperties] ([PUID], [name], [description], [TUID], [FUID], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'f7d5686a-381c-eb11-a49d-201a06a548bb', N'Ranch', N'desc desc desc desc desc desc', 2, N'78977bf6-351c-eb11-a49d-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-11-01T11:50:20.390' AS DateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[farmPropertyType] ON 

INSERT [dbo].[farmPropertyType] ([TUID], [name]) VALUES (1, N'Field')
INSERT [dbo].[farmPropertyType] ([TUID], [name]) VALUES (2, N'Ranch')
SET IDENTITY_INSERT [dbo].[farmPropertyType] OFF
INSERT [dbo].[farms] ([FUID], [name], [description], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'b4428cb5-491b-eb11-a49c-201a06a548bb', N'Farm1', N'description description description description', N'46783cc6-e515-eb11-a495-201a06a548bb', CAST(N'2020-10-31T07:21:36.733' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farms] ([FUID], [name], [description], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'2bfd58e2-701b-eb11-a49c-201a06a548bb', N'MyFarm', NULL, N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-10-31T12:02:02.270' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farms] ([FUID], [name], [description], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'daa20d80-9c1b-eb11-a49c-201a06a548bb', N'Farm Name', N'desc desc desc desc desc desc desc', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-10-31T17:14:15.213' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farms] ([FUID], [name], [description], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', N'Farm 2', N'desc desc desc desc desc desc desc', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-10-31T17:18:36.520' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farms] ([FUID], [name], [description], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'c382306b-a11b-eb11-a49c-201a06a548bb', N'Farm 3', N'desc desc desc desc desc desc desc', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-10-31T17:49:27.693' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[farms] ([FUID], [name], [description], [createdByUUID], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'78977bf6-351c-eb11-a49d-201a06a548bb', N'Farm 4', N'desc desc desc desc desc desc desc', N'e07e65e7-1815-eb11-a494-201a06a548bb', CAST(N'2020-11-01T11:32:46.907' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'4adb8416-a43e-4e66-a077-012381223598', N'3ca79942-a91e-eb11-a4a2-201a06a548bb', NULL, CAST(N'2020-11-04T14:23:09.060' AS DateTime), CAST(N'2020-11-11T14:23:09.060' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'10c7adb2-a4a6-4447-9ae5-0b5f7923ebfb', NULL, N'::1', CAST(N'2020-10-27T09:58:53.663' AS DateTime), CAST(N'2020-10-27T10:03:53.663' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'd96c8e58-77c7-49ab-802c-0f2fa5915aa9', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:04.120' AS DateTime), CAST(N'2020-10-26T20:29:04.120' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'b00d8c58-0e85-406d-a22a-1148461fa439', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:23:43.553' AS DateTime), CAST(N'2020-10-26T20:28:43.553' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'dbca077e-90c2-48ad-bfdb-1290337b0c2d', NULL, N'::1', CAST(N'2020-10-27T09:58:52.333' AS DateTime), CAST(N'2020-10-27T10:03:52.333' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'8a3b959e-9063-40df-9e25-1de405f72bfc', NULL, N'::1', CAST(N'2020-10-27T10:05:59.947' AS DateTime), CAST(N'2020-10-27T10:10:59.947' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'c0993cc8-a52f-4e9a-a7d3-261f3c205fdd', N'34157dd6-a81e-eb11-a4a2-201a06a548bb', NULL, CAST(N'2020-11-04T14:20:07.680' AS DateTime), CAST(N'2020-11-11T14:20:07.680' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'f7770024-2ccd-48e4-9c49-3e3f3183a1a5', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:04.580' AS DateTime), CAST(N'2020-10-26T20:29:04.580' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'eba4a819-fa68-45f3-b70a-4063641ec0da', NULL, N'::1', CAST(N'2020-11-04T14:27:09.700' AS DateTime), CAST(N'2020-11-04T14:32:09.700' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'50562fdc-c260-4f18-8541-465a2f40a32f', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:05.063' AS DateTime), CAST(N'2020-10-26T20:29:05.063' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'7a544f19-7603-4b81-a09b-491dc11b64a5', NULL, N'::1', CAST(N'2020-10-26T20:52:20.030' AS DateTime), CAST(N'2020-10-26T20:57:20.030' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'e1a66629-5fec-40a5-a522-560c3bbdd6c7', NULL, N'::1', CAST(N'2020-11-04T14:15:06.480' AS DateTime), CAST(N'2020-11-04T14:20:06.480' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'b1cfefab-10e8-463b-b3f0-73a601696c9f', NULL, N'::1', CAST(N'2020-11-04T14:15:16.843' AS DateTime), CAST(N'2020-11-04T14:20:16.843' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'01ebd01f-8838-42b6-80ed-818f49fe7495', NULL, N'198.162.1.1', CAST(N'2020-10-26T20:24:03.587' AS DateTime), CAST(N'2020-10-26T20:29:03.587' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'315e91c6-f22e-418c-85cd-8463ded7a573', N'a37310d2-a91e-eb11-a4a2-201a06a548bb', NULL, CAST(N'2020-11-04T14:27:09.753' AS DateTime), CAST(N'2020-11-11T14:27:09.753' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'1c4ba74b-08ab-4fee-9ef2-84eca092e5b6', NULL, N'::1', CAST(N'2020-10-27T09:58:53.040' AS DateTime), CAST(N'2020-10-27T10:03:53.040' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'600879c5-0a92-4bbd-a492-8f445422f0be', NULL, N'::1', CAST(N'2020-11-04T14:20:02.763' AS DateTime), CAST(N'2020-11-04T14:25:02.763' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'c4c2dea5-4051-434f-8422-9b83a7388582', NULL, N'::1', CAST(N'2020-10-26T20:47:06.413' AS DateTime), CAST(N'2020-10-26T20:52:06.413' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'8f4c38cb-9646-47ac-a155-b5e18c86728a', NULL, N'::1', CAST(N'2020-10-27T09:58:51.610' AS DateTime), CAST(N'2020-10-27T10:03:51.610' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'a5702df8-f995-451f-8648-bbb580e17241', N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', NULL, CAST(N'2020-11-04T14:17:01.843' AS DateTime), CAST(N'2020-11-11T14:17:01.843' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'100cb461-f1b4-4180-af56-c22044a035a0', N'ca89830c-341c-eb11-a49d-201a06a548bb', NULL, CAST(N'2020-11-01T11:19:04.953' AS DateTime), CAST(N'2020-11-08T11:19:04.953' AS DateTime), 1, 3)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'3234753f-7961-43c3-abe8-c38e8c4f6adc', NULL, N'::1', CAST(N'2020-11-04T14:23:08.970' AS DateTime), CAST(N'2020-11-04T14:28:08.970' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'6d542355-df98-4ac9-9fd1-c8d73b39ec4a', NULL, N'::1', CAST(N'2020-10-27T09:58:39.367' AS DateTime), CAST(N'2020-10-27T10:03:39.367' AS DateTime), 1, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'978f6aa0-1c4c-4060-886a-d43ccfcb9c9f', NULL, N'::1', CAST(N'2020-11-04T14:16:57.567' AS DateTime), CAST(N'2020-11-04T14:21:57.567' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'fc8ebda4-34d4-4593-8286-e00f5fe34d5d', NULL, N'::1', CAST(N'2020-11-01T11:18:28.623' AS DateTime), CAST(N'2020-11-01T11:23:28.623' AS DateTime), 0, 4)
INSERT [dbo].[generatedUCodes] ([GUC], [forUUID], [forIP], [createdDate], [expirationDate], [isValid], [CTUID]) VALUES (N'd0c4145e-0a1b-4d6c-8aa5-e13c98565671', NULL, N'::1', CAST(N'2020-11-04T14:23:25.853' AS DateTime), CAST(N'2020-11-04T14:28:25.853' AS DateTime), 1, 4)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'9cf498fa-1e1c-eb11-a49d-201a06a548bb', N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', 1, CAST(N'2020-11-01T00:00:00.000' AS DateTime), N'Income 1', NULL, 100.5000, N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'73763e06-1f1c-eb11-a49d-201a06a548bb', N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', 1, CAST(N'2020-11-01T00:00:00.000' AS DateTime), N'Income 2', NULL, 250.0000, N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'10540e3b-1f1c-eb11-a49d-201a06a548bb', N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', 0, CAST(N'2020-11-01T00:00:00.000' AS DateTime), N'Expense 1', NULL, 250.0000, N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'be50cd43-1f1c-eb11-a49d-201a06a548bb', N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', 0, CAST(N'2020-11-01T00:00:00.000' AS DateTime), N'Expense 2', NULL, 50.7500, N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'36bb93ca-1f1c-eb11-a49d-201a06a548bb', N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', 1, CAST(N'2020-11-01T00:00:00.000' AS DateTime), N'Income 3', NULL, 95.0000, N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
INSERT [dbo].[incomeAndExpeneses] ([IEUID], [FUID], [incomeFlag], [date], [head], [description], [cost], [createdByUUID], [deletedFlag], [deletedDate], [deletedByUUID]) VALUES (N'17b5e565-3e1c-eb11-a49d-201a06a548bb', N'b0afcd1b-9d1b-eb11-a49c-201a06a548bb', 1, CAST(N'2020-11-01T00:00:00.000' AS DateTime), N'Income 3', NULL, 95.0000, N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[memberType] ON 

INSERT [dbo].[memberType] ([MTUID], [name], [farmLimit], [propertyLimit], [entityLimit], [collaboratorLimit], [AdLimit], [supportFlag], [price]) VALUES (1, N'user', 0, 0, 0, 0, 0, 0, 0.0000)
INSERT [dbo].[memberType] ([MTUID], [name], [farmLimit], [propertyLimit], [entityLimit], [collaboratorLimit], [AdLimit], [supportFlag], [price]) VALUES (2, N'farmer', 1, 5, 15, 3, 1, 0, 0.0000)
INSERT [dbo].[memberType] ([MTUID], [name], [farmLimit], [propertyLimit], [entityLimit], [collaboratorLimit], [AdLimit], [supportFlag], [price]) VALUES (3, N'limitless', 9999, 9999, 9999, 9999, 9999, 1, 1000.0000)
SET IDENTITY_INSERT [dbo].[memberType] OFF
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([RUID], [createdByUUID], [name], [sysRoleFlag], [can_enter_admin_dashboard]) VALUES (1, NULL, N'admin', 1, 1)
INSERT [dbo].[roles] ([RUID], [createdByUUID], [name], [sysRoleFlag], [can_enter_admin_dashboard]) VALUES (2, NULL, N'user', 1, 0)
SET IDENTITY_INSERT [dbo].[roles] OFF
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'9ce2f2a3-9618-eb11-a498-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-27T20:54:44.967' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'32f0e9c3-061a-eb11-a49a-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-29T16:49:53.393' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'97415d2a-091a-eb11-a49a-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-29T17:07:04.270' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'c091d736-0d1a-eb11-a49a-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-29T17:36:03.190' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'd77be9e4-0e1a-eb11-a49a-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-29T17:48:04.730' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'44debb8d-0f1a-eb11-a49a-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-10-29T17:52:47.963' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'f1d64800-1c1e-eb11-a4a1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-11-03T21:32:00.957' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'910139c3-1e1e-eb11-a4a1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-11-03T21:51:44.850' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'c8162694-1f1e-eb11-a4a1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-11-03T21:57:40.900' AS DateTime), NULL)
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'8d4894c4-261e-eb11-a4a1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-03T22:49:03.133' AS DateTime), CAST(N'2020-11-03T23:38:25.803' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'ff1df4e2-311e-eb11-a4a1-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-11-04T00:08:38.940' AS DateTime), CAST(N'2020-11-04T08:51:37.887' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'dd3104e8-7d1e-eb11-a4a2-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 1, CAST(N'2020-11-04T09:12:49.040' AS DateTime), CAST(N'2020-11-04T09:13:04.160' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'4f515223-7e1e-eb11-a4a2-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-04T09:14:28.477' AS DateTime), CAST(N'2020-11-04T09:14:41.877' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'817be78c-7e1e-eb11-a4a2-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-04T09:17:25.407' AS DateTime), CAST(N'2020-11-04T09:18:00.057' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'473ef2bf-801e-eb11-a4a2-201a06a548bb', N'e07e65e7-1815-eb11-a494-201a06a548bb', 0, CAST(N'2020-11-04T09:33:10.287' AS DateTime), CAST(N'2020-11-04T09:47:17.823' AS DateTime))
INSERT [dbo].[sessions] ([SUID], [UUID], [isValid], [createdDate], [lastUsedDate]) VALUES (N'a29b86f5-a91e-eb11-a4a2-201a06a548bb', N'a37310d2-a91e-eb11-a4a2-201a06a548bb', 0, CAST(N'2020-11-04T14:28:09.373' AS DateTime), CAST(N'2020-11-04T14:28:32.580' AS DateTime))
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'71bc6f0c-d517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T21:48:57.663' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'999de7d7-d617-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T22:01:48.547' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'6415abeb-d617-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T22:02:21.910' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'6515abeb-d617-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T22:02:22.763' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'6615abeb-d617-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T22:02:23.483' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'6715abeb-d617-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T22:02:24.103' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9029551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:43:59.613' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9129551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:44:06.130' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9229551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:44:07.000' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9329551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:44:07.727' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9429551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:44:08.430' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9529551e-e517-eb11-a497-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-26T23:44:09.113' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8378179b-051a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T16:41:35.160' AS DateTime), N'cVeCxZwFYem2zg89Uiwy8Q==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e98a3da4-061a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T16:49:00.057' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'26da3113-071a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T16:52:06.213' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a4f8cf3e-071a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T16:53:19.570' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'2d509ca5-071a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T16:56:11.850' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'b4101824-091a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T17:06:53.557' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'b0e5dd1f-0d1a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T17:35:24.443' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'0ed5bec7-0e1a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T17:47:15.607' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'10c91b7f-0f1a-eb11-a49a-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-29T17:52:23.230' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'c02b8e6b-971b-eb11-a49c-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-31T16:37:53.093' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd16beb53-b11b-eb11-a49c-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-10-31T19:43:20.340' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3e6fe8a6-121c-eb11-a49d-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-01T07:20:00.837' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a1aeb2c9-1d1c-eb11-a49d-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-01T08:39:43.657' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a73762fc-341c-eb11-a49d-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-01T11:25:47.087' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8539c55b-381c-eb11-a49d-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-01T11:49:55.820' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e85c93a1-001e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T18:16:02.870' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9090b81c-061e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T18:55:17.363' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'49d58f49-0d1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T19:46:39.083' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'444f7b7e-101e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T20:09:36.363' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'85849ea9-101e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T20:10:48.887' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4013683a-111e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T20:14:51.647' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'272d715b-111e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T20:15:47.223' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3a091042-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:26:39.463' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3b091042-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:26:44.317' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3c091042-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:26:46.330' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9e6b035c-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:27:23.150' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'f2bb1581-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:28:25.340' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'f3bb1581-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:28:33.573' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8eea31bb-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:30:02.840' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8fea31bb-1b1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:30:07.170' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'efd64800-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:31:58.573' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'f0d64800-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:32:00.910' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'83c22250-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:34:12.717' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'87e12a5d-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:34:34.587' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e02a839d-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:36:22.537' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'bcc00bbe-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:37:17.120' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'309cc0dc-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:38:08.633' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'3458d8e3-1c1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:38:20.543' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7b298c0d-1d1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:39:30.500' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7c298c0d-1d1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:39:36.247' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7ad9ce02-1e1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:46:21.967' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'cdf0eea6-1e1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:50:57.330' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'74b9b7b9-1e1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:51:28.857' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'900139c3-1e1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:51:44.807' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'ff839c0a-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:53:44.563' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a5a94f46-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:55:24.727' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'82b3cb60-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:56:09.170' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'13d3d56c-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:56:29.357' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'c6162694-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:57:35.107' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'c7162694-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:57:40.850' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'e5058f9d-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:57:51.107' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'9083f7b8-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:58:37.087' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd37c28ce-1f1e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T21:59:12.647' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'00fb66cb-221e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T22:20:36.303' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'7a792adb-221e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T22:21:02.947' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'5663e7b3-261e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T22:48:34.770' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'8c4894c4-261e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-03T22:49:03.043' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'fe1df4e2-311e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T00:08:38.173' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'eb567a90-321e-eb11-a4a1-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T00:13:29.437' AS DateTime), N'', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'5ab08862-641e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:10:07.177' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'78a36cd9-641e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:13:26.670' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'2478ea74-651e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:17:47.540' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'93c18bdb-651e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:20:39.723' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a23773dd-661e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:27:52.393' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'0743924a-671e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T06:30:55.487' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'd4495c23-791e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:38:39.860' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'47ae282d-791e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:38:57.170' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'151ffe5b-791e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:40:15.720' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'81086aa1-791e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:42:12.100' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'14c2f704-7a1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:44:59.303' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'15c2f704-7a1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:45:03.780' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'09ad55e8-7a1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:51:20.760' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'451b89f2-7a1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:51:37.883' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'31a13ffe-7a1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T08:51:57.533' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'dc3104e8-7d1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:12:48.573' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'509c35f1-7d1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:13:04.137' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4e515223-7e1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:14:28.050' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'807be78c-7e1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:17:25.353' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'787694a1-7e1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:18:00.047' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'463ef2bf-801e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:33:09.833' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'4f9f6cc7-801e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:33:22.530' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'af60e9b3-821e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:47:08.620' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'88985abb-821e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:47:21.277' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'77628fc4-821e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:47:36.720' AS DateTime), N'qPXxZ/RPSWTmyZje6CcRDA==', 0, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'78628fc4-821e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T09:47:43.843' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'e07e65e7-1815-eb11-a494-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'28ab6491-a91e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T14:25:21.010' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'34157dd6-a81e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'a19b86f5-a91e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T14:28:09.230' AS DateTime), N'Qpf0SxOVUjUkWySXOZ16kw==', 1, N'a37310d2-a91e-eb11-a4a2-201a06a548bb')
INSERT [dbo].[signIn_logs] ([LUID], [ipAdd], [country], [city], [location], [hostname], [date], [attemptedPassword], [attemptedResult], [UUID]) VALUES (N'12e9fe00-aa1e-eb11-a4a2-201a06a548bb', N'::1', NULL, NULL, NULL, NULL, CAST(N'2020-11-04T14:28:28.483' AS DateTime), N'/QOPx/MZ5I8xFdkr9b2++Q==', 1, N'a37310d2-a91e-eb11-a4a2-201a06a548bb')
GO
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'e07e65e7-1815-eb11-a494-201a06a548bb', N'doguskar', N'Qpf0SxOVUjUkWySXOZ16kw==', N'dogus.kar@hotmail.com', 0, NULL, 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-10-24T10:41:28.387' AS DateTime), 0, NULL, NULL, 1, 3)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'70f13c78-e515-eb11-a495-201a06a548bb', N'dogus.kar', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar98@gmail.com', 0, NULL, 0, N'Dogus', N'Kar', NULL, CAST(N'2020-10-24T10:41:28.387' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'46783cc6-e515-eb11-a495-201a06a548bb', N'farmer1', N'Qpf0SxOVUjUkWySXOZ16kw==', N'farmer1@gmail.com', 0, NULL, 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-10-24T10:43:39.247' AS DateTime), 0, NULL, NULL, 2, 2)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'ca89830c-341c-eb11-a49d-201a06a548bb', N'example', N'Qpf0SxOVUjUkWySXOZ16kw==', N'example@example.com', 0, NULL, 0, N'Example', N'Example', NULL, CAST(N'2020-11-01T11:19:04.873' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'b4a3b867-a81e-eb11-a4a2-201a06a548bb', N'doguskar1', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar1@hotmail.com', 0, NULL, 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-11-04T14:17:01.840' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'34157dd6-a81e-eb11-a4a2-201a06a548bb', N'doguskar2', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar2@hotmail.com', 0, NULL, 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-11-04T14:20:07.677' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'3ca79942-a91e-eb11-a4a2-201a06a548bb', N'doguskar3', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar3@hotmail.com', 0, NULL, 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-11-04T14:23:09.057' AS DateTime), 0, NULL, NULL, 2, 1)
INSERT [dbo].[users] ([UUID], [username], [password], [email], [emailActivated], [phoneNumber], [phoneNumberActivated], [name], [surname], [profilPic], [createdDate], [deletedFlag], [deletedDate], [deletedByUUID], [RUID], [MTUID]) VALUES (N'a37310d2-a91e-eb11-a4a2-201a06a548bb', N'doguskar4', N'Qpf0SxOVUjUkWySXOZ16kw==', N'doguskar4@hotmail.com', 0, NULL, 0, N'Doğuş', N'Kar', NULL, CAST(N'2020-11-04T14:27:09.750' AS DateTime), 0, NULL, NULL, 2, 1)
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_codeType]    Script Date: 11/4/2020 5:40:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_codeType] ON [dbo].[codeType]
(
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_COPTypes]    Script Date: 11/4/2020 5:40:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_COPTypes] ON [dbo].[COPTypes]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_farmPropertyType]    Script Date: 11/4/2020 5:40:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_farmPropertyType] ON [dbo].[farmPropertyType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_users]    Script Date: 11/4/2020 5:40:13 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [IX_users] UNIQUE NONCLUSTERED 
(
	[UUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[categories] ADD  CONSTRAINT [DF_Categories_subCategoryFlag]  DEFAULT ((0)) FOR [subCategoryFlag]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_RUID]  DEFAULT (newsequentialid()) FOR [RUID]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_basicRoleFlag]  DEFAULT ((0)) FOR [basicRoleFlag]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[cRoles] ADD  CONSTRAINT [DF_cRoles_can_create_property]  DEFAULT ((0)) FOR [can_create_property]
GO
ALTER TABLE [dbo].[entityCOPValues] ADD  CONSTRAINT [DF_EntityCOPValues_EUID]  DEFAULT (newsequentialid()) FOR [EUID]
GO
ALTER TABLE [dbo].[entityDetails] ADD  CONSTRAINT [DF_entityDetail_DUID]  DEFAULT (newsequentialid()) FOR [DUID]
GO
ALTER TABLE [dbo].[entityDetails] ADD  CONSTRAINT [DF_entityDetail_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[entityDetails] ADD  CONSTRAINT [DF_entityDetails_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_EntityOfFP_EUID]  DEFAULT (newsequentialid()) FOR [EUID]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_entityOfFP_soldFlag]  DEFAULT ((0)) FOR [soldFlag]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_EntityOfFP_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[entityOfFP] ADD  CONSTRAINT [DF_entityOfFP_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_PUID]  DEFAULT (newsequentialid()) FOR [PUID]
GO
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[farmProperties] ADD  CONSTRAINT [DF_farmProperties_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_FUID]  DEFAULT (newsequentialid()) FOR [FUID]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[farms] ADD  CONSTRAINT [DF_farms_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_GUC]  DEFAULT (newid()) FOR [GUC]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[generatedUCodes] ADD  CONSTRAINT [DF_generatedUCodes_valid]  DEFAULT ((1)) FOR [isValid]
GO
ALTER TABLE [dbo].[incomeAndExpeneses] ADD  CONSTRAINT [DF_incomeAndExpeneses_IEUID]  DEFAULT (newsequentialid()) FOR [IEUID]
GO
ALTER TABLE [dbo].[incomeAndExpeneses] ADD  CONSTRAINT [DF_incomeAndExpeneses_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_sysRoleFlag]  DEFAULT ((0)) FOR [sysRoleFlag]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_can_enter_admin_dashboard]  DEFAULT ((0)) FOR [can_enter_admin_dashboard]
GO
ALTER TABLE [dbo].[sessions] ADD  CONSTRAINT [DF_sessions_suid]  DEFAULT (newsequentialid()) FOR [SUID]
GO
ALTER TABLE [dbo].[sessions] ADD  CONSTRAINT [DF_sessions_valid]  DEFAULT ((1)) FOR [isValid]
GO
ALTER TABLE [dbo].[sessions] ADD  CONSTRAINT [DF_sessions_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[signIn_logs] ADD  CONSTRAINT [DF_signIn_logs_LUID]  DEFAULT (newsequentialid()) FOR [LUID]
GO
ALTER TABLE [dbo].[signIn_logs] ADD  CONSTRAINT [DF_signIn_logs_date]  DEFAULT (getutcdate()) FOR [date]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_uuid]  DEFAULT (newsequentialid()) FOR [UUID]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_emailActivated]  DEFAULT ((0)) FOR [emailActivated]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_phoneNumberActivated]  DEFAULT ((0)) FOR [phoneNumberActivated]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_createdDate]  DEFAULT (getutcdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_deletedFlag]  DEFAULT ((0)) FOR [deletedFlag]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_RUID]  DEFAULT ((2)) FOR [RUID]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_MTUID]  DEFAULT ((1)) FOR [MTUID]
GO
ALTER TABLE [dbo].[categoryOfProperties]  WITH CHECK ADD  CONSTRAINT [FK_CategoryOfProperties_Categories] FOREIGN KEY([CUID])
REFERENCES [dbo].[categories] ([CUID])
GO
ALTER TABLE [dbo].[categoryOfProperties] CHECK CONSTRAINT [FK_CategoryOfProperties_Categories]
GO
ALTER TABLE [dbo].[categoryOfProperties]  WITH CHECK ADD  CONSTRAINT [FK_CategoryOfProperties_COPTypes] FOREIGN KEY([TUID])
REFERENCES [dbo].[COPTypes] ([TUID])
GO
ALTER TABLE [dbo].[categoryOfProperties] CHECK CONSTRAINT [FK_CategoryOfProperties_COPTypes]
GO
ALTER TABLE [dbo].[collaborators]  WITH CHECK ADD  CONSTRAINT [FK_collaborators_cRoles] FOREIGN KEY([RUID])
REFERENCES [dbo].[cRoles] ([RUID])
GO
ALTER TABLE [dbo].[collaborators] CHECK CONSTRAINT [FK_collaborators_cRoles]
GO
ALTER TABLE [dbo].[collaborators]  WITH CHECK ADD  CONSTRAINT [FK_collaborators_farms] FOREIGN KEY([FUID])
REFERENCES [dbo].[farms] ([FUID])
GO
ALTER TABLE [dbo].[collaborators] CHECK CONSTRAINT [FK_collaborators_farms]
GO
ALTER TABLE [dbo].[collaborators]  WITH CHECK ADD  CONSTRAINT [FK_collaborators_users] FOREIGN KEY([UUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[collaborators] CHECK CONSTRAINT [FK_collaborators_users]
GO
ALTER TABLE [dbo].[COPValues]  WITH CHECK ADD  CONSTRAINT [FK_COPValues_COPValues] FOREIGN KEY([PUID])
REFERENCES [dbo].[categoryOfProperties] ([PUID])
GO
ALTER TABLE [dbo].[COPValues] CHECK CONSTRAINT [FK_COPValues_COPValues]
GO
ALTER TABLE [dbo].[cRoles]  WITH CHECK ADD  CONSTRAINT [FK_cRoles_users] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[cRoles] CHECK CONSTRAINT [FK_cRoles_users]
GO
ALTER TABLE [dbo].[cRoles]  WITH CHECK ADD  CONSTRAINT [FK_cRoles_users1] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[cRoles] CHECK CONSTRAINT [FK_cRoles_users1]
GO
ALTER TABLE [dbo].[entityCOPValues]  WITH CHECK ADD  CONSTRAINT [FK_EntityCOPValues_CategoryOfProperties1] FOREIGN KEY([PUID])
REFERENCES [dbo].[categoryOfProperties] ([PUID])
GO
ALTER TABLE [dbo].[entityCOPValues] CHECK CONSTRAINT [FK_EntityCOPValues_CategoryOfProperties1]
GO
ALTER TABLE [dbo].[entityCOPValues]  WITH CHECK ADD  CONSTRAINT [FK_EntityCOPValues_EntityOfFP] FOREIGN KEY([EUID])
REFERENCES [dbo].[entityOfFP] ([EUID])
GO
ALTER TABLE [dbo].[entityCOPValues] CHECK CONSTRAINT [FK_EntityCOPValues_EntityOfFP]
GO
ALTER TABLE [dbo].[entityDetails]  WITH CHECK ADD  CONSTRAINT [FK_entityDetail_EntityOfFP] FOREIGN KEY([EUID])
REFERENCES [dbo].[entityOfFP] ([EUID])
GO
ALTER TABLE [dbo].[entityDetails] CHECK CONSTRAINT [FK_entityDetail_EntityOfFP]
GO
ALTER TABLE [dbo].[entityDetails]  WITH CHECK ADD  CONSTRAINT [FK_entityDetail_users] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityDetails] CHECK CONSTRAINT [FK_entityDetail_users]
GO
ALTER TABLE [dbo].[entityDetails]  WITH CHECK ADD  CONSTRAINT [FK_entityDetail_users1] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityDetails] CHECK CONSTRAINT [FK_entityDetail_users1]
GO
ALTER TABLE [dbo].[entityOfFP]  WITH CHECK ADD  CONSTRAINT [FK_EntityOfFP_Categories] FOREIGN KEY([CUID])
REFERENCES [dbo].[categories] ([CUID])
GO
ALTER TABLE [dbo].[entityOfFP] CHECK CONSTRAINT [FK_EntityOfFP_Categories]
GO
ALTER TABLE [dbo].[entityOfFP]  WITH CHECK ADD  CONSTRAINT [FK_EntityOfFP_farmProperties] FOREIGN KEY([PUID])
REFERENCES [dbo].[farmProperties] ([PUID])
GO
ALTER TABLE [dbo].[entityOfFP] CHECK CONSTRAINT [FK_EntityOfFP_farmProperties]
GO
ALTER TABLE [dbo].[entityOfFP]  WITH CHECK ADD  CONSTRAINT [FK_EntityOfFP_users] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityOfFP] CHECK CONSTRAINT [FK_EntityOfFP_users]
GO
ALTER TABLE [dbo].[entityOfFP]  WITH CHECK ADD  CONSTRAINT [FK_EntityOfFP_users1] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityOfFP] CHECK CONSTRAINT [FK_EntityOfFP_users1]
GO
ALTER TABLE [dbo].[entityOfFP]  WITH CHECK ADD  CONSTRAINT [FK_EntityOfFP_users2] FOREIGN KEY([soldByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[entityOfFP] CHECK CONSTRAINT [FK_EntityOfFP_users2]
GO
ALTER TABLE [dbo].[farmProperties]  WITH CHECK ADD  CONSTRAINT [FK_farmProperties_farmPropertyType] FOREIGN KEY([TUID])
REFERENCES [dbo].[farmPropertyType] ([TUID])
GO
ALTER TABLE [dbo].[farmProperties] CHECK CONSTRAINT [FK_farmProperties_farmPropertyType]
GO
ALTER TABLE [dbo].[farmProperties]  WITH CHECK ADD  CONSTRAINT [FK_farmProperties_farms] FOREIGN KEY([FUID])
REFERENCES [dbo].[farms] ([FUID])
GO
ALTER TABLE [dbo].[farmProperties] CHECK CONSTRAINT [FK_farmProperties_farms]
GO
ALTER TABLE [dbo].[farmProperties]  WITH CHECK ADD  CONSTRAINT [FK_farmProperties_users] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[farmProperties] CHECK CONSTRAINT [FK_farmProperties_users]
GO
ALTER TABLE [dbo].[farmProperties]  WITH CHECK ADD  CONSTRAINT [FK_farmProperties_users1] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[farmProperties] CHECK CONSTRAINT [FK_farmProperties_users1]
GO
ALTER TABLE [dbo].[farms]  WITH CHECK ADD  CONSTRAINT [FK_farms_users] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[farms] CHECK CONSTRAINT [FK_farms_users]
GO
ALTER TABLE [dbo].[farms]  WITH CHECK ADD  CONSTRAINT [FK_farms_users1] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[farms] CHECK CONSTRAINT [FK_farms_users1]
GO
ALTER TABLE [dbo].[generatedUCodes]  WITH CHECK ADD  CONSTRAINT [FK_generatedUCodes_codeType] FOREIGN KEY([CTUID])
REFERENCES [dbo].[codeType] ([CTUID])
GO
ALTER TABLE [dbo].[generatedUCodes] CHECK CONSTRAINT [FK_generatedUCodes_codeType]
GO
ALTER TABLE [dbo].[generatedUCodes]  WITH CHECK ADD  CONSTRAINT [FK_generatedUCodes_users] FOREIGN KEY([forUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[generatedUCodes] CHECK CONSTRAINT [FK_generatedUCodes_users]
GO
ALTER TABLE [dbo].[incomeAndExpeneses]  WITH CHECK ADD  CONSTRAINT [FK_incomeAndExpeneses_farms] FOREIGN KEY([FUID])
REFERENCES [dbo].[farms] ([FUID])
GO
ALTER TABLE [dbo].[incomeAndExpeneses] CHECK CONSTRAINT [FK_incomeAndExpeneses_farms]
GO
ALTER TABLE [dbo].[incomeAndExpeneses]  WITH CHECK ADD  CONSTRAINT [FK_incomeAndExpeneses_users] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[incomeAndExpeneses] CHECK CONSTRAINT [FK_incomeAndExpeneses_users]
GO
ALTER TABLE [dbo].[roles]  WITH CHECK ADD  CONSTRAINT [FK_roles_users] FOREIGN KEY([createdByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[roles] CHECK CONSTRAINT [FK_roles_users]
GO
ALTER TABLE [dbo].[sessions]  WITH CHECK ADD  CONSTRAINT [FK_sessions_users] FOREIGN KEY([UUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[sessions] CHECK CONSTRAINT [FK_sessions_users]
GO
ALTER TABLE [dbo].[signIn_logs]  WITH CHECK ADD  CONSTRAINT [FK_signIn_logs_users] FOREIGN KEY([UUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[signIn_logs] CHECK CONSTRAINT [FK_signIn_logs_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_memberType] FOREIGN KEY([MTUID])
REFERENCES [dbo].[memberType] ([MTUID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_memberType]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([RUID])
REFERENCES [dbo].[roles] ([RUID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_UUID_deletedByUUID] FOREIGN KEY([deletedByUUID])
REFERENCES [dbo].[users] ([UUID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_UUID_deletedByUUID]
GO
/****** Object:  StoredProcedure [dbo].[InsertDetailForEntityOfFP]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertDetailForEntityOfFP]
@EUID uniqueidentifier,
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@COST money,
@REMAINDER_DATE datetime,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	INSERT INTO entityDetails(EUID, name, description, cost, remainderDate, createdByUUID)
	OUTPUT inserted.*
	VALUES(@EUID, @NAME, @DESCRIPTION, @COST, @REMAINDER_DATE, @CREATED_BY_UUID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEntityCOPValue]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertEntityCOPValue]
@EUID uniqueidentifier,
@PUID int,
@VALUE nvarchar(max)
AS
BEGIN
	DECLARE @CUID_OF_ENTITY int
	SELECT @CUID_OF_ENTITY = E.CUID FROM entityOfFP AS E
	WHERE E.EUID = @EUID 

	DECLARE @PROPERTIES_OF_ENTITY table (PUID int, name nvarchar(50), TUID int, CUID int)
	INSERT INTO @PROPERTIES_OF_ENTITY 
	EXEC SelectPropertiesOfTheCategory @CUID_OF_ENTITY

	IF(EXISTS(SELECT * FROM @PROPERTIES_OF_ENTITY WHERE PUID = @PUID))
	BEGIN
		IF(NOT EXISTS(SELECT * FROM entityCOPValues WHERE EUID = @EUID AND PUID = @PUID))
		BEGIN
			INSERT INTO entityCOPValues(EUID, PUID, value)
			OUTPUT inserted.*
			VALUES(@EUID, @PUID, @VALUE)
		END
		ELSE
		BEGIN
			UPDATE entityCOPValues
			SET value = @VALUE
			OUTPUT inserted.*
			WHERE EUID = @EUID AND PUID = @PUID
		END
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM entityCOPValues
	END
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEntityForFP]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertEntityForFP]
@CUID int,
@PUID uniqueidentifier,
@ID nvarchar(50),
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@COUNT int,
@PURCHASED_DATE datetime,
@COST money,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	DECLARE @FARM_OWNER_UUID uniqueidentifier
	SELECT @FARM_OWNER_UUID = F.createdByUUID FROM farms AS F
	INNER JOIN farmProperties AS P ON F.FUID = P.FUID
	WHERE P.PUID = @PUID

	DECLARE @OWNER_ENTITY_LIMIT int 
	SELECT @OWNER_ENTITY_LIMIT = T.entityLimit FROM users AS U 
	INNER JOIN memberType T ON U.MTUID = T.MTUID
	WHERE U.UUID = @FARM_OWNER_UUID

	DECLARE @OWNER_ENTITY_NUMBER int
	SELECT @OWNER_ENTITY_NUMBER = COUNT(E.EUID) FROM entityOfFP AS E
	INNER JOIN farmProperties AS P ON P.PUID = E.PUID
	INNER JOIN farms AS F ON P.FUID = F.FUID
	WHERE F.createdByUUID = @FARM_OWNER_UUID
	
	IF (@OWNER_ENTITY_NUMBER < @OWNER_ENTITY_LIMIT)
	BEGIN
		INSERT INTO entityOfFP(CUID, PUID, ID, name, description, count, purchasedDate, cost, createdByUUID)
		OUTPUT inserted.*
		VALUES(@CUID, @PUID, @ID, @NAME, @DESCRIPTION, @COUNT, @PURCHASED_DATE, @COST, @CREATED_BY_UUID)
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM entityOfFP
	END 

END
GO
/****** Object:  StoredProcedure [dbo].[InsertExpense]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertExpense]
@FUID uniqueidentifier,
@DATE datetime,
@HEAD nvarchar(50),
@DESCRIPRION nvarchar(max),
@COST money,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	INSERT INTO incomeAndExpeneses(FUID, date, head, description, cost, createdByUUID, incomeFlag)
	OUTPUT inserted.*
	VALUES(@FUID, @DATE, @HEAD, @DESCRIPRION, @COST, @CREATED_BY_UUID, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFarm]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertFarm]
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	DECLARE @USER_FARM_LIMIT int 
	SELECT @USER_FARM_LIMIT = T.farmLimit FROM users AS U 
	INNER JOIN memberType T ON U.MTUID = T.MTUID
	WHERE UUID = @CREATED_BY_UUID

	DECLARE @USER_FARM_NUMBER int
	SELECT @USER_FARM_NUMBER = COUNT(F.FUID) FROM farms AS F
	WHERE createdByUUID = @CREATED_BY_UUID
	
	IF (@USER_FARM_NUMBER < @USER_FARM_LIMIT)
	BEGIN
		INSERT INTO farms(name, description, createdByUUID)
		OUTPUT inserted.*
		VALUES(@NAME, @DESCRIPTION, @CREATED_BY_UUID)
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM farms
	END 

END
GO
/****** Object:  StoredProcedure [dbo].[InsertFarmProperty]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertFarmProperty]
@NAME nvarchar(50),
@DESCRIPTION nvarchar(max),
@TUID int,
@FUID uniqueidentifier,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	DECLARE @FARM_OWNER_UUID uniqueidentifier
	SELECT @FARM_OWNER_UUID = createdByUUID FROM farms
	WHERE FUID = @FUID

	DECLARE @OWNER_PROPERTY_LIMIT int 
	SELECT @OWNER_PROPERTY_LIMIT = T.propertyLimit FROM users AS U 
	INNER JOIN memberType T ON U.MTUID = T.MTUID
	WHERE U.UUID = @FARM_OWNER_UUID

	DECLARE @OWNER_PROPERTY_NUMBER int
	SELECT @OWNER_PROPERTY_NUMBER = COUNT(P.PUID) FROM farmProperties AS P
	INNER JOIN farms AS F ON P.FUID = F.FUID
	WHERE F.createdByUUID = @FARM_OWNER_UUID
	
	IF (@OWNER_PROPERTY_NUMBER < @OWNER_PROPERTY_LIMIT)
	BEGIN
		INSERT INTO farmProperties(name, description, TUID, FUID, createdByUUID)
		OUTPUT inserted.*
		VALUES(@NAME, @DESCRIPTION, @TUID, @FUID, @CREATED_BY_UUID)
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM farmProperties
	END 

END
GO
/****** Object:  StoredProcedure [dbo].[InsertIncome]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertIncome]
@FUID uniqueidentifier,
@DATE datetime,
@HEAD nvarchar(50),
@DESCRIPRION nvarchar(max),
@COST money,
@CREATED_BY_UUID uniqueidentifier
AS
BEGIN
	INSERT INTO incomeAndExpeneses(FUID, date, head, description, cost, createdByUUID, incomeFlag)
	OUTPUT inserted.*
	VALUES(@FUID, @DATE, @HEAD, @DESCRIPRION, @COST, @CREATED_BY_UUID, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertSession]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertSession]
@UUID uniqueidentifier
AS
BEGIN
	INSERT INTO sessions(UUID)
	OUTPUT inserted.*
	VALUES(@UUID)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertUCodeForSignUp]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertUCodeForSignUp]
@IP varchar(15)
AS
BEGIN
	DECLARE @CTUID int = 4
	DECLARE @CountUCodesCreatedForSignUpLast5MinWithIP int
	SELECT @CountUCodesCreatedForSignUpLast5MinWithIP = COUNT(*) FROM generatedUCodes WHERE forIP = @IP AND CTUID = @CTUID AND DATEDIFF(SECOND, createdDate, GETUTCDATE()) < 300
	IF( @CountUCodesCreatedForSignUpLast5MinWithIP < 5)
	BEGIN
		INSERT INTO generatedUCodes(forIP, CTUID, expirationDate)
		OUTPUT inserted.*
		VALUES(@IP, @CTUID, DATEADD(MINUTE, 5, GETUTCDATE()))
	END
	ELSE
	BEGIN
		SELECT TOP(0) * FROM generatedUCodes
	END
END 
GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertUser]
@USERNAME varchar(50),
@PASSWORD char(24),
@EMAIL nvarchar(50),
@NAME nvarchar(50),
@SURNAME nvarchar(50),
@GUC uniqueidentifier
AS
BEGIN
	SET NOCOUNT ON
	IF(
		NOT EXISTS(SELECT username FROM users WHERE username = @USERNAME) AND
		NOT EXISTS(SELECT email FROM users WHERE email = @EMAIL) AND
		EXISTS(SELECT TOP(1) GUC FROM generatedUCodes WHERE GUC = @GUC AND isValid = 1 AND DATEDIFF(SECOND, GETUTCDATE(), expirationDate) > 0)
	)
	BEGIN
		BEGIN TRY
			BEGIN TRAN InsertUser
				--temp table for getting uniqueidentifiers 
				DECLARE @temp TABLE(UID uniqueidentifier)
				--Insert user
				INSERT 
				INTO users(username, password, email, name, surname)
				OUTPUT inserted.UUID
				INTO @temp
				VALUES(@USERNAME, @PASSWORD, @EMAIL, @NAME, @SURNAME)
				--Get user's UUID
				DECLARE @UUID uniqueidentifier = (SELECT UID FROM @temp)
				DELETE @temp --clear temp table 
				--Create email activation code
				DECLARE @CTUID int = 3 --EMAIL TYPE ID
				DECLARE @EXPIRATION_DATE datetime = DATEADD(DAY, 7, GETUTCDATE())
				INSERT INTO generatedUCodes(forUUID, expirationDate, CTUID)
				OUTPUT inserted.*
				VALUES (@UUID, @EXPIRATION_DATE, @CTUID)
				UPDATE generatedUCodes SET isValid = 0 WHERE GUC = @GUC
			COMMIT TRAN InsertUser
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN InsertUser
		END CATCH
	END
	ELSE
	BEGIN
		SELECT TOP 0 * FROM generatedUCodes
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllFarmsForUUID]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectAllFarmsForUUID]
@UUID uniqueidentifier
AS
BEGIN
	SELECT * 
	INTO #TEMP_FARMS
	FROM farms
	WHERE createdByUUID = @UUID

	SELECT *
	INTO #TEMP_COLLABORATORS
	FROM collaborators
	WHERE UUID = @UUID
	
	DECLARE @FUID uniqueidentifier
	SELECT TOP(1) @FUID = FUID FROM #TEMP_COLLABORATORS
	WHILE @FUID IS NOT NULL
	BEGIN
		INSERT INTO #TEMP_FARMS
		SELECT * FROM farms 
		WHERE FUID = @FUID

		DELETE #TEMP_COLLABORATORS WHERE FUID = @FUID
		SET @FUID = NULL
		SELECT TOP(1) @FUID = FUID FROM #TEMP_COLLABORATORS
	END

	SELECT * FROM #TEMP_FARMS WHERE deletedFlag = 0 OR deletedFlag = NULL
	DROP TABLE #TEMP_FARMS
	DROP TABLE #TEMP_COLLABORATORS
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllIncomeAndExpensesForUUID]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectAllIncomeAndExpensesForUUID]
@UUID uniqueidentifier
AS
BEGIN
	SELECT IE.* FROM incomeAndExpeneses as IE
	LEFT JOIN farms AS F ON IE.FUID = F.FUID
	WHERE F.createdByUUID = @UUID AND
	IE.deletedFlag = 0 AND
	F.deletedFlag = 0
END
GO
/****** Object:  StoredProcedure [dbo].[SelectFailedSignInRequestsInTheLast5MinFromUUID]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectFailedSignInRequestsInTheLast5MinFromUUID]
@UUID uniqueidentifier
AS
BEGIN
	SELECT * FROM signIn_logs WHERE UUID = @UUID AND attemptedResult = 0 AND DATEDIFF(SECOND, date, GETUTCDATE()) < 300
END 
GO
/****** Object:  StoredProcedure [dbo].[SelectPropertiesOfTheCategory]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectPropertiesOfTheCategory]
@CUID int
AS
BEGIN

	DECLARE @TOP_CATEGORY_IDS table(id int, iter bit)
	DECLARE @CURRENT_ID int = @CUID;
	INSERT INTO  @TOP_CATEGORY_IDS VALUES (@CURRENT_ID, 0)
	WHILE @CURRENT_ID != 0
	BEGIN
		SELECT @CURRENT_ID = subCategoryOfCUID FROM Categories WHERE CUID = @CURRENT_ID
		INSERT INTO  @TOP_CATEGORY_IDS VALUES (@CURRENT_ID, 0)
	END

	DECLARE @PROPERTIES table (PUID int, name nvarchar(50), TUID int, CUID int)
	SELECT TOP(1) @CURRENT_ID = id FROM @TOP_CATEGORY_IDS WHERE iter = 0
	WHILE @CURRENT_ID != 0
	BEGIN
		INSERT INTO @PROPERTIES
		SELECT P.* FROM Categories AS C 
		INNER JOIN CategoryOfProperties AS P ON C.CUID = P.CUID
		WHERE C.CUID = @CURRENT_ID 

		UPDATE @TOP_CATEGORY_IDS SET iter = 1 WHERE id = @CURRENT_ID
		SELECT TOP(1) @CURRENT_ID = id FROM @TOP_CATEGORY_IDS WHERE iter = 0
	END

	SELECT * FROM @PROPERTIES

END
GO
/****** Object:  StoredProcedure [dbo].[SelectUserFromSignInKey]    Script Date: 11/4/2020 5:40:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectUserFromSignInKey]
@SignInKey nvarchar(255)
AS
BEGIN
		SELECT TOP(1) * FROM users 
		WHERE (username = @SignInKey OR email = @SignInKey ) AND deletedFlag = 0 
END
GO
USE [master]
GO
ALTER DATABASE [farmTracker] SET  READ_WRITE 
GO
