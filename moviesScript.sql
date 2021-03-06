USE [master]
GO
/****** Object:  Database [MovieDB]    Script Date: 3/12/2018 3:08:04 PM ******/
CREATE DATABASE [MovieDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MovieDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MovieDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MovieDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MovieDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieDB] SET  MULTI_USER 
GO
ALTER DATABASE [MovieDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MovieDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MovieDB]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/12/2018 3:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CusotmerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CusotmerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movie]    Script Date: 3/12/2018 3:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Director] [nvarchar](100) NULL,
	[Genre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rental]    Script Date: 3/12/2018 3:08:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[RentalID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[DateRented] [datetime] NOT NULL,
 CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CusotmerID], [FirstName], [LastName], [Phone]) VALUES (1, N'Adrien', N'Bardot', N'555-555-1234')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([MovieID], [Title], [Director], [Genre]) VALUES (1, N'Birds', N'Hitchcock', N'Horrer')
SET IDENTITY_INSERT [dbo].[Movie] OFF
SET IDENTITY_INSERT [dbo].[Rental] ON 

INSERT [dbo].[Rental] ([RentalID], [CustomerID], [MovieID], [DateRented]) VALUES (1, 1, 1, CAST(N'2015-11-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rental] OFF
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CusotmerID])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Customer]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([MovieID])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Movie]
GO
USE [master]
GO
ALTER DATABASE [MovieDB] SET  READ_WRITE 
GO
