USE [master]
GO
/****** Object:  Database [MovieDatabase]    Script Date: 5/2/2021 8:05:01 PM ******/
CREATE DATABASE [MovieDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PIOTRSQL\MSSQL\DATA\MovieDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.PIOTRSQL\MSSQL\DATA\MovieDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MovieDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [MovieDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [MovieDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MovieDatabase', N'ON'
GO
ALTER DATABASE [MovieDatabase] SET QUERY_STORE = OFF
GO
USE [MovieDatabase]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 5/2/2021 8:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[YearOfBirth] [int] NOT NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 5/2/2021 8:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[YearOfBirth] [int] NOT NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 5/2/2021 8:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 5/2/2021 8:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[GenreId] [int] NOT NULL,
	[DirectorId] [int] NOT NULL,
	[ReleaseYear] [int] NOT NULL,
	[MainActorId] [int] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 5/2/2021 8:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Rating] [float] NOT NULL,
	[MovieId] [int] NULL,
	[SerialId] [int] NULL,
	[DirectorId] [int] NULL,
	[ActorId] [int] NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rewards]    Script Date: 5/2/2021 8:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rewards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ActorId] [int] NULL,
	[DirectorId] [int] NULL,
	[MovieId] [int] NULL,
	[SerialId] [int] NULL,
 CONSTRAINT [PK_Rewards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Series]    Script Date: 5/2/2021 8:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[GenreId] [int] NOT NULL,
	[DirectorId] [int] NOT NULL,
	[ReleaseYear] [int] NOT NULL,
	[MainActorId] [int] NOT NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/2/2021 8:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nick] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([Id], [Name], [YearOfBirth]) VALUES (1, N'Tim Robbins', 1958)
INSERT [dbo].[Actors] ([Id], [Name], [YearOfBirth]) VALUES (2, N'Morgan Freeman', 1937)
INSERT [dbo].[Actors] ([Id], [Name], [YearOfBirth]) VALUES (3, N'Robert De Niro', 1943)
INSERT [dbo].[Actors] ([Id], [Name], [YearOfBirth]) VALUES (4, N'Brad Pitt', 1963)
INSERT [dbo].[Actors] ([Id], [Name], [YearOfBirth]) VALUES (5, N'Jason Patric', 1966)
INSERT [dbo].[Actors] ([Id], [Name], [YearOfBirth]) VALUES (6, N'Rami Malek', 1981)
INSERT [dbo].[Actors] ([Id], [Name], [YearOfBirth]) VALUES (7, N'Anthony Hopkins', 1937)
INSERT [dbo].[Actors] ([Id], [Name], [YearOfBirth]) VALUES (8, N'Colin Farrell', 1976)
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
SET IDENTITY_INSERT [dbo].[Directors] ON 

INSERT [dbo].[Directors] ([Id], [Name], [YearOfBirth]) VALUES (1, N'Martin Scorsese', 1942)
INSERT [dbo].[Directors] ([Id], [Name], [YearOfBirth]) VALUES (2, N'Frank Darabont', 1959)
INSERT [dbo].[Directors] ([Id], [Name], [YearOfBirth]) VALUES (3, N'Barry Levinson', 1942)
INSERT [dbo].[Directors] ([Id], [Name], [YearOfBirth]) VALUES (4, N'Sam Esmail', 1977)
INSERT [dbo].[Directors] ([Id], [Name], [YearOfBirth]) VALUES (5, N'Jonathan Nolan', 1976)
INSERT [dbo].[Directors] ([Id], [Name], [YearOfBirth]) VALUES (6, N'Nic Pizzolatto', 1975)
SET IDENTITY_INSERT [dbo].[Directors] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [Name]) VALUES (1, N'Drama')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (2, N'Thriller')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (3, N'Comedy')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (4, N'Action')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (5, N'Horror')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (6, N'Musical')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (7, N'Adventure')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (8, N'Psychological')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (9, N'Sci-Fi')
INSERT [dbo].[Genres] ([Id], [Name]) VALUES (10, N'Criminal')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [DirectorId], [ReleaseYear], [MainActorId]) VALUES (1, N'The Shawshank Redemption', 1, 2, 1994, 1)
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [DirectorId], [ReleaseYear], [MainActorId]) VALUES (2, N'Taxi Driver', 1, 1, 1976, 3)
INSERT [dbo].[Movies] ([Id], [Name], [GenreId], [DirectorId], [ReleaseYear], [MainActorId]) VALUES (3, N'Sleepers', 2, 3, 1996, 5)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([Id], [UserId], [Rating], [MovieId], [SerialId], [DirectorId], [ActorId]) VALUES (1, 1, 10, 1, NULL, NULL, NULL)
INSERT [dbo].[Ratings] ([Id], [UserId], [Rating], [MovieId], [SerialId], [DirectorId], [ActorId]) VALUES (2, 1, 9, 2, NULL, NULL, NULL)
INSERT [dbo].[Ratings] ([Id], [UserId], [Rating], [MovieId], [SerialId], [DirectorId], [ActorId]) VALUES (3, 2, 8, NULL, 1, NULL, NULL)
INSERT [dbo].[Ratings] ([Id], [UserId], [Rating], [MovieId], [SerialId], [DirectorId], [ActorId]) VALUES (4, 2, 9, NULL, 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[Rewards] ON 

INSERT [dbo].[Rewards] ([Id], [Name], [ActorId], [DirectorId], [MovieId], [SerialId]) VALUES (1, N'Oscar', NULL, NULL, 1, NULL)
INSERT [dbo].[Rewards] ([Id], [Name], [ActorId], [DirectorId], [MovieId], [SerialId]) VALUES (2, N'Golden Globe', NULL, NULL, NULL, 1)
INSERT [dbo].[Rewards] ([Id], [Name], [ActorId], [DirectorId], [MovieId], [SerialId]) VALUES (3, N'Filmweb Reward', NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[Rewards] OFF
GO
SET IDENTITY_INSERT [dbo].[Series] ON 

INSERT [dbo].[Series] ([Id], [Name], [GenreId], [DirectorId], [ReleaseYear], [MainActorId]) VALUES (1, N'Mr. Robot', 8, 4, 2015, 6)
INSERT [dbo].[Series] ([Id], [Name], [GenreId], [DirectorId], [ReleaseYear], [MainActorId]) VALUES (2, N'Westworld', 9, 5, 2016, 7)
INSERT [dbo].[Series] ([Id], [Name], [GenreId], [DirectorId], [ReleaseYear], [MainActorId]) VALUES (3, N'True Detective', 10, 6, 2014, 8)
SET IDENTITY_INSERT [dbo].[Series] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Nick]) VALUES (1, N'user1')
INSERT [dbo].[Users] ([Id], [Nick]) VALUES (2, N'gabrysia666')
INSERT [dbo].[Users] ([Id], [Nick]) VALUES (3, N'david')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Actors]  WITH CHECK ADD  CONSTRAINT [FK_Actors_Actors] FOREIGN KEY([Id])
REFERENCES [dbo].[Actors] ([Id])
GO
ALTER TABLE [dbo].[Actors] CHECK CONSTRAINT [FK_Actors_Actors]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Actors] FOREIGN KEY([MainActorId])
REFERENCES [dbo].[Actors] ([Id])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Actors]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Directors] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([Id])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Directors]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Genres]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Actors] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Actors]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Directors] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Directors]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Movies]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Series] FOREIGN KEY([SerialId])
REFERENCES [dbo].[Series] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Series]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_Users]
GO
ALTER TABLE [dbo].[Rewards]  WITH CHECK ADD  CONSTRAINT [FK_Rewards_Actors] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
GO
ALTER TABLE [dbo].[Rewards] CHECK CONSTRAINT [FK_Rewards_Actors]
GO
ALTER TABLE [dbo].[Rewards]  WITH CHECK ADD  CONSTRAINT [FK_Rewards_Directors] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([Id])
GO
ALTER TABLE [dbo].[Rewards] CHECK CONSTRAINT [FK_Rewards_Directors]
GO
ALTER TABLE [dbo].[Rewards]  WITH CHECK ADD  CONSTRAINT [FK_Rewards_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[Rewards] CHECK CONSTRAINT [FK_Rewards_Movies]
GO
ALTER TABLE [dbo].[Rewards]  WITH CHECK ADD  CONSTRAINT [FK_Rewards_Series] FOREIGN KEY([SerialId])
REFERENCES [dbo].[Series] ([Id])
GO
ALTER TABLE [dbo].[Rewards] CHECK CONSTRAINT [FK_Rewards_Series]
GO
ALTER TABLE [dbo].[Series]  WITH CHECK ADD  CONSTRAINT [FK_Series_Actors] FOREIGN KEY([MainActorId])
REFERENCES [dbo].[Actors] ([Id])
GO
ALTER TABLE [dbo].[Series] CHECK CONSTRAINT [FK_Series_Actors]
GO
ALTER TABLE [dbo].[Series]  WITH CHECK ADD  CONSTRAINT [FK_Series_Directors] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([Id])
GO
ALTER TABLE [dbo].[Series] CHECK CONSTRAINT [FK_Series_Directors]
GO
ALTER TABLE [dbo].[Series]  WITH CHECK ADD  CONSTRAINT [FK_Series_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Series] CHECK CONSTRAINT [FK_Series_Genres]
GO
USE [master]
GO
ALTER DATABASE [MovieDatabase] SET  READ_WRITE 
GO
