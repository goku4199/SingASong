USE [master]
GO
/****** Object:  Database [SingASong]    Script Date: 30-01-2024 07:34:21 ******/
CREATE DATABASE [SingASong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SingASong', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SingASong.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SingASong_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SingASong_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SingASong] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SingASong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SingASong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SingASong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SingASong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SingASong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SingASong] SET ARITHABORT OFF 
GO
ALTER DATABASE [SingASong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SingASong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SingASong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SingASong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SingASong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SingASong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SingASong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SingASong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SingASong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SingASong] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SingASong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SingASong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SingASong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SingASong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SingASong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SingASong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SingASong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SingASong] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SingASong] SET  MULTI_USER 
GO
ALTER DATABASE [SingASong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SingASong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SingASong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SingASong] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SingASong] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SingASong] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SingASong] SET QUERY_STORE = ON
GO
ALTER DATABASE [SingASong] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SingASong]
GO
/****** Object:  Table [dbo].[Albums]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albums](
	[Album_Id] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[realeased_on] [date] NULL,
	[cover] [varbinary](max) NULL,
	[provider] [int] NULL,
 CONSTRAINT [PK_Albums] PRIMARY KEY CLUSTERED 
(
	[Album_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[artists]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artists](
	[ArtistID] [int] NOT NULL,
	[NAME] [varchar](32) NOT NULL,
	[Image] [varbinary](max) NULL,
	[dob] [date] NULL,
 CONSTRAINT [PK_artists] PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[cartID] [int] NOT NULL,
	[userID] [int] NOT NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_tracks]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_tracks](
	[cartID] [int] NOT NULL,
	[trackID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coupon]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coupon](
	[coupon_ID] [int] NOT NULL,
	[TYPE] [varchar](16) NOT NULL,
	[quantity] [float] NOT NULL,
	[STATUS] [varchar](1) NOT NULL,
 CONSTRAINT [PK_coupoun] PRIMARY KEY CLUSTERED 
(
	[coupon_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discounts_info]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discounts_info](
	[payment_id] [int] NOT NULL,
	[coupon_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genres]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[GenreID] [int] NOT NULL,
	[Name] [varbinary](32) NOT NULL,
 CONSTRAINT [PK_genres] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_methods]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_methods](
	[paymentmethodID] [int] NOT NULL,
	[NAME] [nchar](32) NOT NULL,
 CONSTRAINT [PK_payment_methods] PRIMARY KEY CLUSTERED 
(
	[paymentmethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payments]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[payment_id] [int] NOT NULL,
	[payment_method_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[purchase_type] [varchar](16) NOT NULL,
	[purchase_status] [char](1) NOT NULL,
	[cart_id] [int] NOT NULL,
 CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[ProviderID] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Established] [date] NULL,
	[headquarter] [int] NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchases]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchases](
	[userID] [int] NOT NULL,
	[trackID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[StateID] [int] NOT NULL,
	[Name] [varchar](32) NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subscribers]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subscribers](
	[UserID] [int] NOT NULL,
	[SubscriptionID] [int] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[status] [char](1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subscriptions]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subscriptions](
	[SubscriptionID] [int] NOT NULL,
	[NAME] [varchar](16) NOT NULL,
	[DURATION] [int] NOT NULL,
	[PRICE] [float] NOT NULL,
 CONSTRAINT [PK_subscriptions] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[track_artist]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[track_artist](
	[trackID] [int] NOT NULL,
	[artistid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[track_genre]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[track_genre](
	[trackId] [int] NOT NULL,
	[artistID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tracks]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tracks](
	[TrackID] [int] NOT NULL,
	[Name] [varbinary](32) NOT NULL,
	[AlbumID] [int] NULL,
	[PRice] [float] NOT NULL,
	[cover] [varbinary](max) NULL,
	[status] [char](1) NULL,
 CONSTRAINT [PK_tracks] PRIMARY KEY CLUSTERED 
(
	[TrackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30-01-2024 07:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[userName] [varchar](32) NOT NULL,
	[password] [varbinary](256) NOT NULL,
	[Email] [varchar](48) NOT NULL,
	[Mobile#] [nchar](10) NOT NULL,
	[AddressLine] [varchar](48) NOT NULL,
	[place] [varchar](32) NOT NULL,
	[PIN] [varchar](6) NULL,
	[StateID] [int] NULL,
	[countryID] [int] NULL,
	[profileImage] [varbinary](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [SingASong] SET  READ_WRITE 
GO
