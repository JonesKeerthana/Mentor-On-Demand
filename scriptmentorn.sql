USE [master]
GO
/****** Object:  Database [mentor]    Script Date: 11/22/2019 4:16:56 PM ******/
CREATE DATABASE [mentor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mentor', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\mentor.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mentor_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\mentor_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mentor] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mentor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mentor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mentor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mentor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mentor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mentor] SET ARITHABORT OFF 
GO
ALTER DATABASE [mentor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mentor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mentor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mentor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mentor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mentor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mentor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mentor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mentor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mentor] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mentor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mentor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mentor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mentor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mentor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mentor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mentor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mentor] SET RECOVERY FULL 
GO
ALTER DATABASE [mentor] SET  MULTI_USER 
GO
ALTER DATABASE [mentor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mentor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mentor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mentor] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [mentor] SET DELAYED_DURABILITY = DISABLED 
GO
USE [mentor]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 11/22/2019 4:16:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[a_id] [int] IDENTITY(1000,1) NOT NULL,
	[a_username] [nvarchar](50) NULL,
	[a_password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mentordtls]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mentordtls](
	[m_id] [int] IDENTITY(1000,1) NOT NULL,
	[m_name] [nvarchar](50) NULL,
	[m_username] [nvarchar](50) NOT NULL,
	[m_password] [nvarchar](50) NOT NULL,
	[m_linkedinurl] [nvarchar](100) NULL,
	[m_regdattime] [datetime] NOT NULL,
	[m_regcode] [nvarchar](10) NULL,
	[m_yearsofexperience] [int] NULL,
	[m_active] [nvarchar](10) NULL,
 CONSTRAINT [PK__mentorDt__28529FB0D9B313D3] PRIMARY KEY CLUSTERED 
(
	[m_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mentorskills]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mentorskills](
	[ms_id] [int] IDENTITY(1000,1) NOT NULL,
	[ms_mid] [int] NULL,
	[ms_sid] [int] NULL,
	[ms_selfrating] [decimal](3, 1) NULL,
	[ms_yearsofexperience] [int] NULL,
	[ms_trainingdelivered] [int] NULL,
	[ms_facilitiesoffered] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ms_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[skills]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skills](
	[sk_Id] [int] IDENTITY(1000,1) NOT NULL,
	[sk_Name] [nvarchar](50) NOT NULL,
	[sk_TOC] [nvarchar](50) NOT NULL,
	[sk_Duration] [int] NOT NULL,
	[sk_Prerequistes] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[training]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training](
	[tr_id] [int] IDENTITY(1000,1) NOT NULL,
	[tr_uid] [int] NULL,
	[tr_mid] [int] NULL,
	[tr_sid] [int] NULL,
	[tr_status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[tr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[userdtls]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userdtls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[contactnumber] [numeric](10, 0) NOT NULL,
	[regcode] [varchar](50) NULL,
	[active] [varchar](50) NULL,
	[resetpassword] [varchar](50) NULL,
	[regdatetime] [date] NOT NULL,
 CONSTRAINT [PK__UserDtls__3213E83F5EA7BA7A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

GO
INSERT [dbo].[admin] ([a_id], [a_username], [a_password]) VALUES (1001, N'jk@gmail.com', N'jk')
GO
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[mentordtls] ON 

GO
INSERT [dbo].[mentordtls] ([m_id], [m_name], [m_username], [m_password], [m_linkedinurl], [m_regdattime], [m_regcode], [m_yearsofexperience], [m_active]) VALUES (1016, N'jeni', N'jeni@gmail.com', N'jeni', N'jeni', CAST(N'2019-11-20 00:00:00.000' AS DateTime), NULL, 6, N'yes')
GO
INSERT [dbo].[mentordtls] ([m_id], [m_name], [m_username], [m_password], [m_linkedinurl], [m_regdattime], [m_regcode], [m_yearsofexperience], [m_active]) VALUES (1017, N'jen', N'jen@gmail.com', N'jen', N'jen', CAST(N'2019-11-20 00:00:00.000' AS DateTime), NULL, 2, N'yes')
GO
INSERT [dbo].[mentordtls] ([m_id], [m_name], [m_username], [m_password], [m_linkedinurl], [m_regdattime], [m_regcode], [m_yearsofexperience], [m_active]) VALUES (1018, N'Hirthik', N'hirthik@gmail.com', N'hirthik', N'linkedin/hirthik', CAST(N'2019-11-19 00:00:00.000' AS DateTime), NULL, 2, N'yes')
GO
INSERT [dbo].[mentordtls] ([m_id], [m_name], [m_username], [m_password], [m_linkedinurl], [m_regdattime], [m_regcode], [m_yearsofexperience], [m_active]) VALUES (1026, N'Hirthik1', N'hirthik1@gmail.com', N'hirthik1', N'linkedin/hirthik1', CAST(N'2019-11-19 19:27:59.527' AS DateTime), NULL, 2, N'yes')
GO
INSERT [dbo].[mentordtls] ([m_id], [m_name], [m_username], [m_password], [m_linkedinurl], [m_regdattime], [m_regcode], [m_yearsofexperience], [m_active]) VALUES (1032, N'Selvi', N'selvi@gmail.com', N'slevi', N'linkedin/selvi', CAST(N'2019-11-20 10:01:24.040' AS DateTime), NULL, 4, N'yes')
GO
INSERT [dbo].[mentordtls] ([m_id], [m_name], [m_username], [m_password], [m_linkedinurl], [m_regdattime], [m_regcode], [m_yearsofexperience], [m_active]) VALUES (1033, N'ABIJITH', N'abijith@gmail.com', N'ABIJITH', N'linkedin/ABIJITH', CAST(N'2019-11-21 19:46:18.600' AS DateTime), NULL, 3, N'yes')
GO
SET IDENTITY_INSERT [dbo].[mentordtls] OFF
GO
SET IDENTITY_INSERT [dbo].[mentorskills] ON 

GO
INSERT [dbo].[mentorskills] ([ms_id], [ms_mid], [ms_sid], [ms_selfrating], [ms_yearsofexperience], [ms_trainingdelivered], [ms_facilitiesoffered]) VALUES (1004, 1018, 1004, CAST(8.0 AS Decimal(3, 1)), 1, NULL, NULL)
GO
INSERT [dbo].[mentorskills] ([ms_id], [ms_mid], [ms_sid], [ms_selfrating], [ms_yearsofexperience], [ms_trainingdelivered], [ms_facilitiesoffered]) VALUES (1007, 1032, 1003, CAST(4.0 AS Decimal(3, 1)), 8, NULL, NULL)
GO
INSERT [dbo].[mentorskills] ([ms_id], [ms_mid], [ms_sid], [ms_selfrating], [ms_yearsofexperience], [ms_trainingdelivered], [ms_facilitiesoffered]) VALUES (1008, 1032, 1004, CAST(8.0 AS Decimal(3, 1)), 1, NULL, NULL)
GO
INSERT [dbo].[mentorskills] ([ms_id], [ms_mid], [ms_sid], [ms_selfrating], [ms_yearsofexperience], [ms_trainingdelivered], [ms_facilitiesoffered]) VALUES (1009, 1032, 1004, CAST(8.0 AS Decimal(3, 1)), 1, NULL, NULL)
GO
INSERT [dbo].[mentorskills] ([ms_id], [ms_mid], [ms_sid], [ms_selfrating], [ms_yearsofexperience], [ms_trainingdelivered], [ms_facilitiesoffered]) VALUES (1010, 1032, 1007, CAST(8.0 AS Decimal(3, 1)), 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[mentorskills] OFF
GO
SET IDENTITY_INSERT [dbo].[skills] ON 

GO
INSERT [dbo].[skills] ([sk_Id], [sk_Name], [sk_TOC], [sk_Duration], [sk_Prerequistes]) VALUES (1000, N'Java', N'java', 40, NULL)
GO
INSERT [dbo].[skills] ([sk_Id], [sk_Name], [sk_TOC], [sk_Duration], [sk_Prerequistes]) VALUES (1001, N'Python', N'Python', 50, NULL)
GO
INSERT [dbo].[skills] ([sk_Id], [sk_Name], [sk_TOC], [sk_Duration], [sk_Prerequistes]) VALUES (1003, N'Machine Learning', N'Machine Learning', 28, NULL)
GO
INSERT [dbo].[skills] ([sk_Id], [sk_Name], [sk_TOC], [sk_Duration], [sk_Prerequistes]) VALUES (1004, N'R Programming', N'R Programming', 20, NULL)
GO
INSERT [dbo].[skills] ([sk_Id], [sk_Name], [sk_TOC], [sk_Duration], [sk_Prerequistes]) VALUES (1005, N'Artificial Intelligance', N'Artificial Intelligance', 19, NULL)
GO
INSERT [dbo].[skills] ([sk_Id], [sk_Name], [sk_TOC], [sk_Duration], [sk_Prerequistes]) VALUES (1007, N'Csharp', N'Csharp', 45, NULL)
GO
SET IDENTITY_INSERT [dbo].[skills] OFF
GO
SET IDENTITY_INSERT [dbo].[training] ON 

GO
INSERT [dbo].[training] ([tr_id], [tr_uid], [tr_mid], [tr_sid], [tr_status]) VALUES (1003, 5, 1018, 1005, N'requested')
GO
INSERT [dbo].[training] ([tr_id], [tr_uid], [tr_mid], [tr_sid], [tr_status]) VALUES (1004, 5, 1032, 1005, N'requested')
GO
INSERT [dbo].[training] ([tr_id], [tr_uid], [tr_mid], [tr_sid], [tr_status]) VALUES (1015, 4, 1032, 1007, N'requested')
GO
INSERT [dbo].[training] ([tr_id], [tr_uid], [tr_mid], [tr_sid], [tr_status]) VALUES (1019, 6, 1018, 1004, N'requested')
GO
INSERT [dbo].[training] ([tr_id], [tr_uid], [tr_mid], [tr_sid], [tr_status]) VALUES (1020, 6, 1018, 1004, N'requested')
GO
SET IDENTITY_INSERT [dbo].[training] OFF
GO
SET IDENTITY_INSERT [dbo].[userdtls] ON 

GO
INSERT [dbo].[userdtls] ([id], [username], [password], [firstname], [lastname], [contactnumber], [regcode], [active], [resetpassword], [regdatetime]) VALUES (4, N'sankari@gmail.com', N'sankari', N'sankari', N'priyanka', CAST(7373021163 AS Numeric(10, 0)), NULL, NULL, NULL, CAST(N'2019-11-24' AS Date))
GO
INSERT [dbo].[userdtls] ([id], [username], [password], [firstname], [lastname], [contactnumber], [regcode], [active], [resetpassword], [regdatetime]) VALUES (5, N'Monisha', N'monisha', N'Monisha', N'Monisha', CAST(7525719288 AS Numeric(10, 0)), NULL, NULL, NULL, CAST(N'2019-11-20' AS Date))
GO
INSERT [dbo].[userdtls] ([id], [username], [password], [firstname], [lastname], [contactnumber], [regcode], [active], [resetpassword], [regdatetime]) VALUES (6, N'priyanka@gmail.com', N'priyanka', N'priyanka', N'priyanka', CAST(7373021163 AS Numeric(10, 0)), NULL, NULL, NULL, CAST(N'2019-11-21' AS Date))
GO
INSERT [dbo].[userdtls] ([id], [username], [password], [firstname], [lastname], [contactnumber], [regcode], [active], [resetpassword], [regdatetime]) VALUES (7, N'dsffdsfa', N'dsfdsfds', N'dsfds', N'dsfgvg', CAST(7529819288 AS Numeric(10, 0)), NULL, NULL, NULL, CAST(N'2019-11-21' AS Date))
GO
SET IDENTITY_INSERT [dbo].[userdtls] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__mentorDt__5D59886D1B8BF3A3]    Script Date: 11/22/2019 4:16:58 PM ******/
ALTER TABLE [dbo].[mentordtls] ADD  CONSTRAINT [UQ__mentorDt__5D59886D1B8BF3A3] UNIQUE NONCLUSTERED 
(
	[m_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__skills__F639279DCCBF3316]    Script Date: 11/22/2019 4:16:58 PM ******/
ALTER TABLE [dbo].[skills] ADD UNIQUE NONCLUSTERED 
(
	[sk_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mentorskills]  WITH CHECK ADD  CONSTRAINT [FK_mentorskills_mentorskills] FOREIGN KEY([ms_mid])
REFERENCES [dbo].[mentordtls] ([m_id])
GO
ALTER TABLE [dbo].[mentorskills] CHECK CONSTRAINT [FK_mentorskills_mentorskills]
GO
ALTER TABLE [dbo].[mentorskills]  WITH CHECK ADD  CONSTRAINT [ms_me_FK] FOREIGN KEY([ms_sid])
REFERENCES [dbo].[skills] ([sk_Id])
GO
ALTER TABLE [dbo].[mentorskills] CHECK CONSTRAINT [ms_me_FK]
GO
ALTER TABLE [dbo].[training]  WITH CHECK ADD  CONSTRAINT [tr_me_FK] FOREIGN KEY([tr_mid])
REFERENCES [dbo].[mentordtls] ([m_id])
GO
ALTER TABLE [dbo].[training] CHECK CONSTRAINT [tr_me_FK]
GO
ALTER TABLE [dbo].[training]  WITH CHECK ADD  CONSTRAINT [tr_sk_FK] FOREIGN KEY([tr_sid])
REFERENCES [dbo].[skills] ([sk_Id])
GO
ALTER TABLE [dbo].[training] CHECK CONSTRAINT [tr_sk_FK]
GO
ALTER TABLE [dbo].[training]  WITH CHECK ADD  CONSTRAINT [tr_us_FK] FOREIGN KEY([tr_uid])
REFERENCES [dbo].[userdtls] ([id])
GO
ALTER TABLE [dbo].[training] CHECK CONSTRAINT [tr_us_FK]
GO
/****** Object:  StoredProcedure [dbo].[findid]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[findid](@name nvarchar(50))
as
select sk_Id from skills where sk_Name=@name
GO
/****** Object:  StoredProcedure [dbo].[spaccept]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spaccept](@id int)
as
select tr_id as acsId,userdtls.firstname as acUsername,userdtls.contactnumber as acContactnumber,skills.sk_Name as acSkName from userdtls,skills,training where tr_mid=@id and tr_uid=userdtls.id and tr_sid=skills.sk_Id and tr_status='requested'

GO
/****** Object:  StoredProcedure [dbo].[spchoosementor]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spchoosementor](@uid int,@mid int,@sid int)
as
insert into training values(@uid,@mid,@sid,'requested');
GO
/****** Object:  StoredProcedure [dbo].[speaddskill]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[speaddskill](@id int,@sid int,@rate int,@exp int)
as
insert into mentorskills values(@id,@sid,@rate,@exp,null,null)
GO
/****** Object:  StoredProcedure [dbo].[sploginadmin]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sploginadmin](@uname varchar(50),@pass varchar(50))
as
select * from admin where a_username=@uname and a_password=@pass
GO
/****** Object:  StoredProcedure [dbo].[sploginmentor]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sploginmentor](@uname varchar(50),@pass varchar(50))
as
select * from mentordtls where m_username=@uname and m_password=@pass
GO
/****** Object:  StoredProcedure [dbo].[sploginuser]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sploginuser](@uname varchar(50),@pass varchar(50))
as
select * from userdtls where username=@uname and password=@pass
GO
/****** Object:  StoredProcedure [dbo].[spmentorlist]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spmentorlist](@id int)
as
select skills.sk_Name as  SkillName,mentorskills.ms_selfrating as MskillSelfrating,mentorskills.ms_yearsofexperience as MskillYearsofexperience,ms_trainingdelivered as MskillTrainingdelivered,ms_facilitiesoffered as MskillFacilitiesoffered from mentorskills,skills where mentorskills.ms_mid=@id and skills.sk_Id=mentorskills.ms_sid

GO
/****** Object:  StoredProcedure [dbo].[spregistermentor]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spregistermentor](@name varchar(40),@mname nvarchar(40),@mpass nvarchar(40),@murl nvarchar(40),@mexp int)
as
insert into mentordtls values(@name,@mname,@mpass,@murl,getdate(),null,@mexp,'yes')
GO
/****** Object:  StoredProcedure [dbo].[spregisteruser]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spregisteruser](@uname nvarchar(50),@upass nvarchar(50),@fname nvarchar(50),@lname nvarchar(50),@con numeric)
as
insert into userdtls values(@uname,@upass,@fname,@lname,@con,null,null,null,getdate())
GO
/****** Object:  StoredProcedure [dbo].[spsearch]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spsearch](@id int)
as
select ms_id as DMsId,m_id as DMId,sk_Id as DSkId,m_name as DMName,m_linkedinurl as DMLinkedinurl,sk_Name as DSkName,ms_yearsofexperience as  DMsYearsofexperience ,ms_selfrating as DMsSelfrating from mentordtls,mentorskills,skills where sk_Id=@id and ms_sid=sk_Id and m_id=ms_mid

GO
/****** Object:  StoredProcedure [dbo].[spuser]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spuser]
as
select ms_id as DMsId,m_id as DMId,sk_Id as DSkId,m_name as DMName,m_linkedinurl as DMLinkedinurl,sk_Name as DSkName,ms_yearsofexperience as  DMsYearsofexperience ,ms_selfrating as DMsSelfrating from mentordtls,mentorskills,skills where sk_Id=ms_sid and m_id=ms_mid

GO
/****** Object:  StoredProcedure [dbo].[spuserdisp]    Script Date: 11/22/2019 4:16:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spuserdisp]
as
select m_id as DMId,sk_Id as DSkId,m_name as DMName,m_linkedinurl as DMLinkedinurl,sk_Name as DSkName,ms_yearsofexperience as  DMsYearsofexperience ,ms_selfrating as DMsSelfrating from mentordtls,mentorskills,skills where sk_Id=ms_sid and m_id=ms_mid

GO
USE [master]
GO
ALTER DATABASE [mentor] SET  READ_WRITE 
GO
