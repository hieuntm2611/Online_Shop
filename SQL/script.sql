USE [master]
GO
/****** Object:  Database [Online_Shop]    Script Date: 7/23/2022 11:28:26 AM ******/
CREATE DATABASE [Online_Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shopping_online_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shopping_online.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'shopping_online_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\shopping_online.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Online_Shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online_Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online_Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online_Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online_Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online_Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online_Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online_Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Online_Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online_Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online_Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online_Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online_Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online_Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online_Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online_Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online_Shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Online_Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online_Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online_Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online_Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online_Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online_Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online_Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online_Shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Online_Shop] SET  MULTI_USER 
GO
ALTER DATABASE [Online_Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online_Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online_Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online_Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Online_Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Online_Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Online_Shop', N'ON'
GO
ALTER DATABASE [Online_Shop] SET QUERY_STORE = OFF
GO
USE [Online_Shop]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Cart_total_price] [float] NOT NULL,
 CONSTRAINT [PK_Cart_1] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartDetailID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[CartID] [int] NOT NULL,
 CONSTRAINT [PK_CartDetail] PRIMARY KEY CLUSTERED 
(
	[CartDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discuss]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discuss](
	[FeedbackID] [bigint] NOT NULL,
	[PostID] [int] NULL,
	[Reply_FeedbackID] [bigint] NULL,
	[Like] [int] NOT NULL,
	[Datetime] [datetime] NOT NULL,
	[AuthorID] [int] NOT NULL,
	[Content] [text] NOT NULL,
 CONSTRAINT [PK_Discuss] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Img_List]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Img_List](
	[Img_ID] [int] IDENTITY(1,1) NOT NULL,
	[Img_type] [nvarchar](50) NOT NULL,
	[All_ID] [int] NOT NULL,
	[Img_link] [ntext] NOT NULL,
 CONSTRAINT [PK_Img_List] PRIMARY KEY CLUSTERED 
(
	[Img_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Order_Date] [datetime] NOT NULL,
	[Total_Bill] [float] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Note] [text] NULL,
	[Order_Address] [text] NULL,
	[Receiver_Name] [nvarchar](50) NULL,
	[Receiver_Phone] [varchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price_Order] [float] NOT NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Post_Title] [nvarchar](100) NOT NULL,
	[Post_Context] [text] NOT NULL,
	[Post_Author] [int] NOT NULL,
	[Post_Date] [datetime] NOT NULL,
	[Update_Date] [datetime] NULL,
	[thumbnail] [ntext] NULL,
	[view] [int] NOT NULL,
	[Post_Category] [int] NOT NULL,
	[Post_Status] [int] NOT NULL,
	[Summary] [text] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Author] [int] NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Summary] [text] NULL,
	[CategoryID] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Quantity] [int] NULL,
	[Created_At] [date] NULL,
	[Update_At] [date] NULL,
	[Status] [int] NULL,
	[thumbnail] [ntext] NULL,
	[View] [int] NULL,
	[Rate] [float] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Feedback]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [text] NULL,
	[Rating] [int] NOT NULL,
	[Create_At] [date] NOT NULL,
	[Content] [text] NULL,
	[Like] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Product_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply_PFeedback]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply_PFeedback](
	[ReplyID] [int] NOT NULL,
	[FeedbackID] [int] NOT NULL,
	[Reply] [text] NOT NULL,
	[AuthorID] [int] NOT NULL,
 CONSTRAINT [PK_Reply_PFeedback_1] PRIMARY KEY CLUSTERED 
(
	[ReplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[Setting_ID] [int] IDENTITY(1,1) NOT NULL,
	[Group] [nvarchar](50) NOT NULL,
	[Name] [text] NOT NULL,
	[Order] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Setting_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[SlideID] [int] IDENTITY(1,1) NOT NULL,
	[Slide_Title] [nvarchar](100) NOT NULL,
	[Slide_Img] [ntext] NULL,
	[Author] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[Status] [int] NOT NULL,
	[Slide_Content] [text] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[SlideID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/23/2022 11:28:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [bit] NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[RoleID] [int] NOT NULL,
	[Registered_At] [date] NULL,
	[Last_Login] [date] NULL,
	[Avatar] [ntext] NULL,
	[DOB] [date] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [UserID], [Cart_total_price]) VALUES (1, 4, 0)
INSERT [dbo].[Cart] ([CartID], [UserID], [Cart_total_price]) VALUES (2, 9, 0)
INSERT [dbo].[Cart] ([CartID], [UserID], [Cart_total_price]) VALUES (3, 10, 0)
INSERT [dbo].[Cart] ([CartID], [UserID], [Cart_total_price]) VALUES (4, 11, 0)
INSERT [dbo].[Cart] ([CartID], [UserID], [Cart_total_price]) VALUES (5, 13, 0)
INSERT [dbo].[Cart] ([CartID], [UserID], [Cart_total_price]) VALUES (6, 31, 0)
INSERT [dbo].[Cart] ([CartID], [UserID], [Cart_total_price]) VALUES (7, 1, 0)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[CartDetail] ON 

INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (7, 131, 1, 2)
INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (8, 143, 1, 2)
INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (1005, 125, 1, 3)
INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (1006, 143, 1, 3)
INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (1009, 112, 2, 4)
INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (1010, 121, 1, 4)
INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (1011, 112, 1, 5)
INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (1012, 117, 2, 5)
INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (1013, 142, 1, 5)
INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (5017, 129, 10, 1)
INSERT [dbo].[CartDetail] ([CartDetailID], [ProductID], [quantity], [CartID]) VALUES (5018, 105, 1, 1)
SET IDENTITY_INSERT [dbo].[CartDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Img_List] ON 

INSERT [dbo].[Img_List] ([Img_ID], [Img_type], [All_ID], [Img_link]) VALUES (3, N'Product', 1, N'adad')
SET IDENTITY_INSERT [dbo].[Img_List] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1019, 4, CAST(N'2022-06-29T07:27:29.427' AS DateTime), 28, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1020, 4, CAST(N'2022-06-29T07:27:29.433' AS DateTime), 70, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1021, 4, CAST(N'2022-06-29T07:27:29.433' AS DateTime), 86, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1022, 4, CAST(N'2022-06-29T07:29:13.800' AS DateTime), 56, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1023, 4, CAST(N'2022-06-29T07:29:13.807' AS DateTime), 70, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1024, 4, CAST(N'2022-06-29T07:29:13.807' AS DateTime), 86, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1025, 4, CAST(N'2022-06-29T07:29:32.407' AS DateTime), 84, 16, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1026, 4, CAST(N'2022-06-29T07:29:32.410' AS DateTime), 70, 16, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1027, 4, CAST(N'2022-06-29T07:29:32.410' AS DateTime), 41, 17, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1028, 4, CAST(N'2022-06-29T07:32:00.550' AS DateTime), 87, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1029, 4, CAST(N'2022-06-29T07:32:00.553' AS DateTime), 84, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1030, 4, CAST(N'2022-06-29T07:32:00.553' AS DateTime), 70, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1031, 4, CAST(N'2022-06-29T07:32:00.557' AS DateTime), 41, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1032, 4, CAST(N'2022-06-29T07:32:26.677' AS DateTime), 87, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1033, 4, CAST(N'2022-06-29T07:32:26.680' AS DateTime), 84, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1034, 4, CAST(N'2022-06-29T07:32:26.683' AS DateTime), 135, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1035, 4, CAST(N'2022-06-29T07:32:26.687' AS DateTime), 41, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1036, 4, CAST(N'2022-06-29T07:44:58.120' AS DateTime), 84, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1037, 4, CAST(N'2022-06-29T07:44:58.133' AS DateTime), 70, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1038, 4, CAST(N'2022-06-29T07:48:38.917' AS DateTime), 280, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1039, 4, CAST(N'2022-06-29T07:48:38.920' AS DateTime), 70, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1040, 4, CAST(N'2022-06-29T07:49:39.593' AS DateTime), 280, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
INSERT [dbo].[Order] ([OrderID], [CustomerID], [Order_Date], [Total_Bill], [StatusID], [Note], [Order_Address], [Receiver_Name], [Receiver_Phone]) VALUES (1041, 4, CAST(N'2022-06-29T07:49:39.600' AS DateTime), 70, 15, NULL, N'239 Thai Ha, Ha Noi', N'Dai Luong', N'350 747 6011')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1019, 129, 1, 28)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1020, 105, 1, 70)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1021, 171, 1, 86)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1022, 129, 2, 56)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1023, 105, 1, 70)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1024, 171, 1, 86)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1025, 129, 3, 84)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1026, 105, 1, 70)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1027, 113, 1, 41)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1028, 121, 1, 87)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1029, 129, 3, 84)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1030, 105, 1, 70)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1031, 113, 1, 41)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1032, 121, 1, 87)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1033, 129, 3, 84)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1034, 105, 1, 70)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1034, 143, 1, 65)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1035, 113, 1, 41)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1036, 129, 3, 84)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1037, 105, 1, 70)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1038, 129, 10, 280)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1039, 105, 1, 70)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1040, 129, 10, 280)
INSERT [dbo].[Order_Detail] ([OrderID], [ProductID], [Quantity], [Price_Order]) VALUES (1041, 105, 1, 70)
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (10, N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', N'Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 110, CAST(N'2021-08-13T00:00:00.000' AS DateTime), NULL, N'6cb8d383aa46bb48ad40f1e52a779360.jpg', 10, 25, 29, N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (12, N'In congue. Etiam justo. Etiam pretium iaculis justo.', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 105, CAST(N'2021-10-21T00:00:00.000' AS DateTime), NULL, N'7-sai-lầm-viết-blog-phổ-biến-có-thể-khiến-bạn-bỏ-cuộc.jpg', 12, 26, 29, N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (15, N'Fusce consequat. Nulla nisl. Nunc nisl.', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 111, CAST(N'2021-07-29T00:00:00.000' AS DateTime), NULL, N'9-cach-viet-blog-dinh-cao-khien-nguoi-doc-phai-click-ngay.jpg', 15, 25, 30, N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.
..')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (19, N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 105, CAST(N'2022-02-28T00:00:00.000' AS DateTime), NULL, N'76259841_s-3.jpg', 19, 28, 29, N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (21, N'Enhanced bandwidth-monitored contingency', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 105, CAST(N'2021-08-17T00:00:00.000' AS DateTime), NULL, N'1515901378mgtNOF37AmTyN8l.jpg', 1, 25, 29, N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (22, N'Reduced hybrid matrix', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 106, CAST(N'2021-12-03T00:00:00.000' AS DateTime), NULL, N'1515901792SUKsArkLyCvGJBX.jpg', 2, 28, 29, N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (23, N'Monitored maximized model', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 110, CAST(N'2021-11-13T00:00:00.000' AS DateTime), NULL, N'blog.jpg', 3, 24, 30, N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (24, N'Optimized attitude-oriented productivity', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 108, CAST(N'2022-03-04T00:00:00.000' AS DateTime), NULL, N'Blog-ca-nhan.jpg', 4, 24, 30, N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (25, N'Intuitive composite parallelism', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 107, CAST(N'2021-10-22T00:00:00.000' AS DateTime), NULL, N'blog-du-lich.jpg', 5, 26, 30, N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.
..')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (26, N'Managed attitude-oriented matrices', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 108, CAST(N'2021-07-23T00:00:00.000' AS DateTime), NULL, N'blog-la-gi.jpg', 6, 25, 30, N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (27, N'Grass-roots asynchronous structure', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 109, CAST(N'2021-06-04T00:00:00.000' AS DateTime), NULL, N'cho-ra-doi-nhung-buc-anh-dep-khi-di-du-lich5.jpg', 7, 24, 30, N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (28, N'Ameliorated user-facing project', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 108, CAST(N'2021-12-29T00:00:00.000' AS DateTime), NULL, N'images (1).jpg', 8, 24, 29, N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (29, N'Phased clear-thinking success', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 112, CAST(N'2021-09-29T00:00:00.000' AS DateTime), NULL, N'images (2).jpg', 9, 25, 29, N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (30, N'Multi-layered encompassing application', N'                                Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.
                            ', 1, CAST(N'2022-06-20T00:00:00.000' AS DateTime), CAST(N'2022-06-20T00:00:00.000' AS DateTime), N'images (3).jpg', 10, 27, 30, N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (31, N'Customizable zero tolerance data-warehouse', N'                                Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.
                            ', 1, CAST(N'2022-06-17T00:00:00.000' AS DateTime), CAST(N'2022-06-17T00:00:00.000' AS DateTime), N'images (4).jpg', 11, 25, 29, N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (32, N'Polarised methodical application', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 105, CAST(N'2022-03-03T00:00:00.000' AS DateTime), NULL, N'images (5).jpg', 12, 26, 30, N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (35, N'Object-based leading edge groupware', N'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 110, CAST(N'2022-05-18T00:00:00.000' AS DateTime), NULL, N'images.jpg', 15, 25, 30, N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (36, N'Sharable responsive architecture', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 107, CAST(N'2021-10-21T00:00:00.000' AS DateTime), NULL, N'serie-huong-dan-viet-blog-kiem-tien.jpg', 16, 24, 29, N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.
..')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (37, N'Synchronised multimedia concept', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 108, CAST(N'2021-10-04T00:00:00.000' AS DateTime), NULL, N'tai-template-blogspot-mien-phi.jpg', 17, 24, 30, N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (38, N'Diverse executive encoding', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 107, CAST(N'2021-11-26T00:00:00.000' AS DateTime), NULL, N'viết-blog-kiếm-được-bao-nhiêu-1140x597.jpg', 18, 27, 30, N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (39, N'Reverse-engineered needs-based productivity', N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.

Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 108, CAST(N'2021-08-10T00:00:00.000' AS DateTime), NULL, N'viet-blog-kiem-tien-1.jpg', 19, 27, 30, N'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit...')
INSERT [dbo].[Post] ([PostID], [Post_Title], [Post_Context], [Post_Author], [Post_Date], [Update_Date], [thumbnail], [view], [Post_Category], [Post_Status], [Summary]) VALUES (40, N'Adaptive static paradigm', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 109, CAST(N'2021-11-21T00:00:00.000' AS DateTime), NULL, N'what-is-a-blog_bhakti-1-scaled.jpg', 20, 24, 30, N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est...')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (102, 119, N'Wine - Muscadet Sur Lie', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 18, 16, 13.793, 0, CAST(N'2021-11-19' AS Date), CAST(N'2020-11-02' AS Date), 13, N'IMG_20200803_020129_834.jpg', 123, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (103, 117, N'Beef - Rib Roast, Cap On', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 19, 54, 0, 971, CAST(N'2021-08-26' AS Date), CAST(N'2022-07-21' AS Date), 13, N'fd98bd77-157f-477f-b63a-524e9f9a2161.jpeg', 415, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (104, 119, N'Bread - Roll, Canadian Dinner', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 22, 27, 0, 580, CAST(N'2022-04-11' AS Date), CAST(N'2021-09-16' AS Date), 12, N'laptop-dell-2.jpg', 151, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (105, 116, N'Apricots - Halves', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 20, 70, 0, 419, CAST(N'2021-03-11' AS Date), CAST(N'2020-07-17' AS Date), 12, N'stefan-chair-brown-black__0727320_pe735593_s5.avif', 546, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (106, 120, N'Marzipan 50/50', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 19, 54, 0, 738, CAST(N'2021-11-27' AS Date), CAST(N'2021-01-19' AS Date), 12, N'image-10-chiec-dien-thoai-smartphone-dang-mua-nhat-dau-nam-2022-164733765789164.jpg', 31, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (107, 115, N'Sauce - Roasted Red Pepper', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 18, 96, 33, 902, CAST(N'2021-03-12' AS Date), CAST(N'2021-04-28' AS Date), 12, N'download (1).jpg', 45, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (108, 113, N'Muffin Batt - Ban Dream Zero', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 19, 22, 0, 725, CAST(N'2022-03-23' AS Date), CAST(N'2021-03-18' AS Date), 12, N'600_vsmart_joy_3_2gb_32gb-350x350.jpg', 14, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (109, 116, N'Steam Pan - Half Size Deep', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 21, 67, 0, 461, CAST(N'2020-08-14' AS Date), CAST(N'2021-05-13' AS Date), 13, N'335511096173.jpg', 56, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (110, 120, N'Mushroom - Shitake, Dry', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 18, 67, 67, 785, CAST(N'2020-02-27' AS Date), CAST(N'2021-10-06' AS Date), 13, N'0b4074dcf4d2690dd87b4b357bec16cc.jpg', 1656, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (112, 121, N'Beer - Camerons Auburn', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 18, 55, 37.455, 423, CAST(N'2022-02-04' AS Date), CAST(N'2021-11-17' AS Date), 13, N'15-Laptop-Tot-nhat-2021-1.jpg', 7658, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (113, 122, N'Syrup - Monin, Irish Cream', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 21, 41, 0, 31, CAST(N'2020-10-19' AS Date), CAST(N'2021-12-09' AS Date), 12, N'Rượu-Chivas-18.jpg', 3537, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (114, 118, N'Wine - Tribal Sauvignon', N'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 21, 52, 0, 480, CAST(N'2022-05-03' AS Date), CAST(N'2020-05-31' AS Date), 11, N'RPC_10.png', 85, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (115, 121, N'Tea - Grapefruit Green Tea', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 21, 82, 0, 422, CAST(N'2020-11-11' AS Date), CAST(N'2020-05-04' AS Date), 11, N'download.jpg', 636, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (116, 120, N'Amaretto', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 18, 68, 41, 43, CAST(N'2020-05-02' AS Date), CAST(N'2022-01-07' AS Date), 12, N'dopekicks-mobile_20__491x450.jpg', 3637, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (117, 116, N'Nut - Peanut, Roasted', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 22, 56, 27, 407, CAST(N'2020-05-27' AS Date), CAST(N'2021-09-11' AS Date), 12, N'1609_a-min.jpg', 3536, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (118, 120, N'Cake Circle, Foil, Scallop', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 23, 94, 0, 440, CAST(N'2021-12-10' AS Date), CAST(N'2021-03-22' AS Date), 11, N'746fb4e4f934e9d4773cc728107ab53f_tn.jpg', 737, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (119, 114, N'Wine - Conde De Valdemar', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 20, 57, 0, 786, CAST(N'2020-04-20' AS Date), CAST(N'2020-08-19' AS Date), 11, N'images (2).jpg', 86, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (120, 121, N'Spoon - Soup, Plastic', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 19, 10, 0, 978, CAST(N'2020-06-12' AS Date), CAST(N'2020-09-24' AS Date), 12, N'images (15).jpg', 35, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (121, 113, N'Appetizer - Seafood Assortment', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 18, 87, 0, 127, CAST(N'2021-09-27' AS Date), CAST(N'2020-09-17' AS Date), 11, N'200814092431-01b-michael-jordan-sneakers-auction-exlarge-169.jpg', 6367, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (122, 120, N'Veal - Ground', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 21, 52, 0, 399, CAST(N'2020-10-13' AS Date), CAST(N'2020-08-25' AS Date), 12, N'ruou-cachaca-51-600x600.jpg', 67, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (123, 116, N'Wine - Zinfandel Rosenblum', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 20, 17, 0, 983, CAST(N'2021-08-20' AS Date), CAST(N'2021-11-23' AS Date), 12, N'10048676-dien-thoai-samsung-galaxy-a52-4g-128gb-xanh-1.jpg', 87, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (124, 122, N'Cookie Trail Mix', N'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 21, 65, 0, 393, CAST(N'2020-10-04' AS Date), CAST(N'2020-12-14' AS Date), 12, N'Rượu-Vang-Ferraton-Pere-Fils-Gigondas-Les-Murailles-1.jpg', 53, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (125, 119, N'Pepper - Black, Ground', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 19, 42, 10, 889, CAST(N'2021-12-18' AS Date), CAST(N'2021-09-19' AS Date), 13, N'4765288_cover_home_anroid_goc_tuy_bien3271328_1142021.jpg', 63653, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (126, 114, N'Spice - Peppercorn Melange', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 22, 82, 0, 694, CAST(N'2020-12-28' AS Date), CAST(N'2021-02-16' AS Date), 12, N'15-Laptop-Tot-nhat-2021-1.jpg', 254, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (127, 122, N'Cheese - Le Cru Du Clocher', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 21, 72, 0, 603, CAST(N'2022-04-07' AS Date), CAST(N'2022-03-10' AS Date), 12, N'Ruou-Vang-FLORENTINO-Puglia.jpg', 6, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (128, 113, N'Veal - Brisket, Provimi,bnls', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 22, 77, 0, 146, CAST(N'2021-10-21' AS Date), CAST(N'2020-11-14' AS Date), 12, N'Huawei-matebook-14-1646937612.jpg', 56, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (129, 115, N'Spice - Greek 1 Step', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 19, 28, 0, 625, CAST(N'2021-04-13' AS Date), CAST(N'2022-04-25' AS Date), 11, N'dien-thoai-gia-re-duoi-2-trieu-cover.jpg', 476, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (130, 116, N'Bread - Bistro White', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 19, 45, 0, 762, CAST(N'2021-03-20' AS Date), CAST(N'2021-01-23' AS Date), 11, N'sony-xperia-5-white-600x600_1653363837.jpg', 53, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (131, 117, N'Lettuce - Treviso', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 19, 69, 0, 505, CAST(N'2020-04-05' AS Date), CAST(N'2021-03-22' AS Date), 12, N'android-4-8314.jpg', 313, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (132, 119, N'Beef - Rib Roast, Capless', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 18, 31, 0, 378, CAST(N'2021-02-18' AS Date), CAST(N'2021-09-12' AS Date), 12, N'200814092431-01b-michael-jordan-sneakers-auction-exlarge-169.jpg', 14, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (133, 120, N'Pastry - Trippleberry Muffin - Mini', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 21, 76, 0, 58, CAST(N'2020-02-27' AS Date), CAST(N'2020-08-28' AS Date), 12, N'ruou-vodka-nep-moi-500-ml.jpg', 13, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (134, 122, N'Cheese - Oka', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 23, 89, 0, 507, CAST(N'2020-06-07' AS Date), CAST(N'2021-08-17' AS Date), 11, N'istockphoto-1159377900-612x612.jpg', 41, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (135, 115, N'Sprouts Dikon', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 18, 99, 2, 100, CAST(N'2021-12-11' AS Date), CAST(N'2020-05-17' AS Date), 12, N'allbirds-sneakers-review-wool-runnerjpg.jpg', 144, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (136, 122, N'Tamarillo', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 20, 87, 0, 310, CAST(N'2021-03-28' AS Date), CAST(N'2020-06-12' AS Date), 11, N'image65927.jpg', 1, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (137, 117, N'Tuna - Loin', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 23, 40, 0, 194, CAST(N'2020-12-22' AS Date), CAST(N'2021-04-05' AS Date), 11, N'iutri.jpg', 5, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (138, 114, N'Pasta - Orecchiette', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 23, 76, 0, 346, CAST(N'2021-06-06' AS Date), CAST(N'2020-11-01' AS Date), 11, N'metaball_3d-retro-tv-2.jpg', 63, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (139, 114, N'Wood Chips - Regular', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 22, 11, 0, 537, CAST(N'2022-04-24' AS Date), CAST(N'2022-03-26' AS Date), 11, N'37381_laptop_microsoft_laptop_3_ryzen_7_1_1.jpg', 3, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (140, 122, N'Cake - Pancake', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 19, 25, 0, 133, CAST(N'2021-10-23' AS Date), CAST(N'2021-02-04' AS Date), 12, N'226772361.jpg', 363, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (141, 114, N'Muffin Batt - Blueberry Passion', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 21, 10, 0, 860, CAST(N'2022-02-28' AS Date), CAST(N'2020-11-10' AS Date), 12, N'ruou-vang-kunzza-cabernet-sauvignon.jpg', 3, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (142, 122, N'Cranberries - Dry', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 22, 100, 0, 973, CAST(N'2022-04-21' AS Date), CAST(N'2021-09-28' AS Date), 12, N'hxsjq4t0fd2mh.jpg', 5, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (143, 116, N'Sole - Iqf', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 23, 65, 0, 703, CAST(N'2020-10-02' AS Date), CAST(N'2022-05-14' AS Date), 11, N'Nhà_mình_ở_Bình_Long_năm_2009_cái_tivi_(3).jpg', 535, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (144, 116, N'Crackers - Melba Toast', N'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 23, 41, 0, 478, CAST(N'2020-05-02' AS Date), CAST(N'2022-05-15' AS Date), 12, N'smart-tivi-4k-sony-kd-55x80j-55-inch-android-tv_6f6573fb.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (145, 114, N'Mushrooms - Honey', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 23, 57, 0, 306, CAST(N'2021-04-03' AS Date), CAST(N'2020-07-15' AS Date), 11, N'smart-tivi-4k-sony-kd-55x86j-55-inch-google-tv_d3712a89.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (146, 122, N'Wine - Kwv Chenin Blanc South', N'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 21, 93, 0, 838, CAST(N'2021-12-10' AS Date), CAST(N'2022-03-21' AS Date), 12, N'51jAAtu026S._AC_SX466_.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (147, 116, N'Pants Custom Dry Clean', N'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 23, 48, 0, 286, CAST(N'2021-05-22' AS Date), CAST(N'2021-08-30' AS Date), 12, N'smart-tivi-la-gi-co-nhung-tinh-nang-thu-vi-nao-ai-12-800x550.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (148, 120, N'Rum - Coconut, Malibu', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 21, 28, 0, 852, CAST(N'2021-05-10' AS Date), CAST(N'2021-09-01' AS Date), 11, N'images (17).jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (149, 114, N'Pasta - Canelloni, Single Serve', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 23, 91, 0, 194, CAST(N'2022-03-26' AS Date), CAST(N'2021-03-14' AS Date), 11, N'10038479-android-tivi-tcl-40-inch-l40s6500-01.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (150, 119, N'Couscous', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.', 19, 88, 0, 449, CAST(N'2021-05-13' AS Date), CAST(N'2020-07-08' AS Date), 12, N'samsunggalaxyzfold3-20210920214713.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (151, 118, N'Juice - V8, Tomato', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 22, 88, 0, 644, CAST(N'2021-11-06' AS Date), CAST(N'2021-04-01' AS Date), 12, N'i3ryiw.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (152, 119, N'Sachet', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 19, 59, 20, 606, CAST(N'2021-10-19' AS Date), CAST(N'2020-10-01' AS Date), 12, N'iphone-xs-mau-gold-didongviet.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (153, 120, N'Veal - Liver', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 23, 58, 50, 878, CAST(N'2021-08-12' AS Date), CAST(N'2020-06-17' AS Date), 12, N'televi_noun_002_37599.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (154, 121, N'Ecolab Digiclean Mild Fm', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 19, 24, 50, 700, CAST(N'2020-11-14' AS Date), CAST(N'2021-02-24' AS Date), 12, N'purple_1622216671jpg_1649815344.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (155, 122, N'Puree - Mango', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 20, 23, 0, 471, CAST(N'2022-02-04' AS Date), CAST(N'2020-09-23' AS Date), 12, N'istockphoto-869078270-612x612.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (156, 121, N'Corn Kernels - Frozen', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 22, 25, 0, 200, CAST(N'2020-03-18' AS Date), CAST(N'2021-10-04' AS Date), 11, N'lg-gram-14-i7-14z90pgah75a5-0-600x600.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (157, 119, N'Wine - Puligny Montrachet A.', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 21, 18, 0, 457, CAST(N'2021-06-01' AS Date), CAST(N'2022-01-12' AS Date), 11, N'335511096173.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (158, 120, N'Stainless Steel Cleaner Vision', N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 23, 43, 0, 200, CAST(N'2021-01-20' AS Date), CAST(N'2020-10-09' AS Date), 12, N'Television_(TV).jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (159, 113, N'Lemonade - Pineapple Passion', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 21, 71, 0, 79, CAST(N'2021-02-24' AS Date), CAST(N'2020-12-24' AS Date), 12, N'606028.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (160, 115, N'Soup Campbells - Italian Wedding', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 20, 66, 0, 511, CAST(N'2020-03-05' AS Date), CAST(N'2021-11-26' AS Date), 11, N'istockphoto-1199428736-612x612.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (161, 113, N'Ham - Cooked Bayonne Tinned', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 18, 60, 0, 427, CAST(N'2022-04-09' AS Date), CAST(N'2022-03-24' AS Date), 11, N'content_team_010818_52427_htc_running_shoes_hero2_lg.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (162, 115, N'Calaloo', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 19, 85, 0, 756, CAST(N'2021-11-28' AS Date), CAST(N'2021-11-15' AS Date), 11, N'oppo-find-x5-pro-den-thumb-600x600.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (163, 117, N'Dill - Primerba, Paste', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 19, 37, 0, 77, CAST(N'2021-06-30' AS Date), CAST(N'2022-02-16' AS Date), 12, N'iphone-13-pro-max-xanh-1.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (164, 120, N'Mace Ground', N'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.

Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 20, 48, 0, 414, CAST(N'2021-07-31' AS Date), CAST(N'2021-12-15' AS Date), 12, N'57276_gioi-thieu-ghe-game-razer-iskur-gaming-chair-w-lumbar-support.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (165, 114, N'Butcher Twine 4r', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 18, 58, 0, 610, CAST(N'2021-11-08' AS Date), CAST(N'2021-09-14' AS Date), 11, N'istockphoto-1303978937-170667a.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (166, 120, N'Chocolate Bar - Oh Henry', N'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 19, 46, 0, 83, CAST(N'2021-07-28' AS Date), CAST(N'2021-06-24' AS Date), 12, N'asdasdas.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (167, 118, N'Bread - White Mini Epi', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 22, 11, 0, 91, CAST(N'2021-11-19' AS Date), CAST(N'2022-01-30' AS Date), 12, N'lg-gram-14-i7-14z90pgah75a5-0-600x600.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (168, 114, N'Clementine', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 18, 66, 0, 635, CAST(N'2022-02-27' AS Date), CAST(N'2021-04-28' AS Date), 11, N'photo-1542291026-7eec264c27ff.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (169, 115, N'Mustard Prepared', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 23, 44, 0, 447, CAST(N'2022-05-14' AS Date), CAST(N'2020-11-03' AS Date), 11, N'top-tivi-hinh-anh-sac-net-am-thanh-chuan-dang-mua-nhat-nam-nay-630.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (170, 115, N'Stock - Beef, Brown', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 19, 92, 75, 945, CAST(N'2020-05-27' AS Date), CAST(N'2022-03-22' AS Date), 12, N'fghdf.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (171, 117, N'Sponge Cake Mix - Chocolate', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 21, 86, 0, 586, CAST(N'2020-03-02' AS Date), CAST(N'2022-03-27' AS Date), 11, N'antwerp_p1-white-16_9.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (172, 114, N'Coconut - Shredded, Unsweet', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 20, 99, 0, 797, CAST(N'2020-10-07' AS Date), CAST(N'2021-01-20' AS Date), 12, N'dfhrfgewwe.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (173, 120, N'Split Peas - Yellow, Dry', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 23, 53, 0, 954, CAST(N'2020-11-28' AS Date), CAST(N'2020-07-11' AS Date), 12, N'smart-tivi-casper-32-inch-32hg5200-1.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (174, 115, N'Bread - 10 Grain', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 20, 83, 90, 538, CAST(N'2020-03-16' AS Date), CAST(N'2021-06-25' AS Date), 12, N'xfit_black-red01.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (175, 113, N'Tart Shells - Sweet, 4', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.', 19, 43, 0, 437, CAST(N'2022-03-06' AS Date), CAST(N'2021-12-26' AS Date), 13, N'werwe.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (176, 118, N'Bread - White Epi Baguette', N'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 20, 10, 0, 249, CAST(N'2020-04-16' AS Date), CAST(N'2020-08-27' AS Date), 11, N'xfit_black-red01.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (177, 117, N'Cookie Double Choco', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 19, 77, 0, 209, CAST(N'2020-04-30' AS Date), CAST(N'2021-10-02' AS Date), 12, N'big_340013_dd.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (178, 114, N'Wine - Magnotta - Belpaese', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 19, 31, 0, 498, CAST(N'2021-09-09' AS Date), CAST(N'2020-10-08' AS Date), 11, N'637731793300543684_vivo-v23e-xanh-hong-dd.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (179, 122, N'Beef - Bones, Marrow', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 22, 24, 0, 494, CAST(N'2020-03-16' AS Date), CAST(N'2021-05-31' AS Date), 12, N'37381_laptop_microsoft_laptop_3_ryzen_7_1_1.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (180, 119, N'Eggplant Oriental', N'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 21, 93, 0, 882, CAST(N'2021-04-13' AS Date), CAST(N'2021-10-26' AS Date), 11, N'adsasssssssssssssss.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (181, 122, N'Chicken - Base', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 23, 50, 0, 468, CAST(N'2021-08-02' AS Date), CAST(N'2021-01-13' AS Date), 13, N'iutri.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (182, 121, N'Onions - Dried, Chopped', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 18, 69, 50, 157, CAST(N'2020-03-14' AS Date), CAST(N'2021-03-05' AS Date), 13, N'run-adidas-running-shoes-1645131039.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (183, 121, N'Vinegar - White', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 21, 63, 0, 323, CAST(N'2022-01-01' AS Date), CAST(N'2021-08-05' AS Date), 11, N'dfsd.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (184, 117, N'Amaretto', N'Fusce consequat. Nulla nisl. Nunc nisl.', 20, 48, 0, 340, CAST(N'2020-09-27' AS Date), CAST(N'2021-10-04' AS Date), 12, N'sdfnjiyu.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (185, 122, N'Napkin White', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 23, 65, 0, 969, CAST(N'2020-12-01' AS Date), CAST(N'2021-06-17' AS Date), 13, N'smart-tivi-4k-sony-kd-55x80j-55-inch-android-tv_6f6573fb.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (186, 117, N'Oil - Olive, Extra Virgin', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 22, 90, 0, 586, CAST(N'2022-05-18' AS Date), CAST(N'2021-02-12' AS Date), 11, N'37381_laptop_microsoft_laptop_3_ryzen_7_1_1.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (187, 114, N'Nestea - Iced Tea', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 23, 72, 0, 202, CAST(N'2022-03-15' AS Date), CAST(N'2020-08-15' AS Date), 12, N'smart-tivi-la-gi-co-nhung-tinh-nang-thu-vi-nao-ai-12-800x550.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (188, 118, N'Beef - Montreal Smoked Brisket', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 23, 27, 0, 729, CAST(N'2021-09-23' AS Date), CAST(N'2020-11-18' AS Date), 12, N'top-tivi-hinh-anh-sac-net-am-thanh-chuan-dang-mua-nhat-nam-nay-630.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (189, 122, N'Tortillas - Flour, 10', N'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 19, 72, 0, 778, CAST(N'2021-06-04' AS Date), CAST(N'2020-05-21' AS Date), 12, N'10049549-dien-thoai-samsung-galaxy-a22-6gb-128gb-xanh-1.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (190, 113, N'Wine - Remy Pannier Rose', N'Fusce consequat. Nulla nisl. Nunc nisl.', 23, 15, 0, 676, CAST(N'2021-02-21' AS Date), CAST(N'2021-12-27' AS Date), 11, N'smart-tivi-casper-32-inch-32hg5200-1.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (191, 120, N'Beef Cheek Fresh', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.', 21, 69, 0, 664, CAST(N'2021-09-07' AS Date), CAST(N'2020-06-04' AS Date), 11, N'image42452.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (192, 113, N'Butter - Salted, Micro', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 21, 76, 0, 317, CAST(N'2021-11-27' AS Date), CAST(N'2021-11-09' AS Date), 13, N'kljlkjljlk.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (193, 119, N'Wine - Ice Wine', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 21, 66, 0, 107, CAST(N'2021-02-06' AS Date), CAST(N'2020-09-08' AS Date), 11, N'solid-wood-computer-table.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (194, 114, N'Turkey - Breast, Boneless Sk On', N'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 19, 69, 0, 558, CAST(N'2022-01-16' AS Date), CAST(N'2020-10-31' AS Date), 11, N'10048676-dien-thoai-samsung-galaxy-a52-4g-128gb-xanh-1.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (195, 113, N'Cup - Paper 10oz 92959', N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 18, 72, 0, 639, CAST(N'2021-07-27' AS Date), CAST(N'2022-01-09' AS Date), 12, N'dopekicks-mobile_20__491x450.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (196, 121, N'Spring Roll Veg Mini', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 23, 25, 0, 377, CAST(N'2020-09-21' AS Date), CAST(N'2020-10-19' AS Date), 11, N'istockphoto-1159377900-612x612.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (197, 114, N'Ice Cream - Super Sandwich', N'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 22, 35, 0, 220, CAST(N'2021-07-21' AS Date), CAST(N'2021-12-02' AS Date), 11, N'lg-gram-14-i7-14z90pgah75a5-0-600x600.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (198, 122, N'Sproutsmustard Cress', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 22, 26, 0, 19, CAST(N'2020-10-04' AS Date), CAST(N'2021-02-21' AS Date), 13, N'kjghkk.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (199, 115, N'Anisette - Mcguiness', N'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 21, 79, 90, 772, CAST(N'2020-09-03' AS Date), CAST(N'2020-09-18' AS Date), 13, N'table_588358070_1000.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (200, 118, N'Muffin Batt - Choc Chk', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 18, 63, 0, 972, CAST(N'2020-03-28' AS Date), CAST(N'2022-03-07' AS Date), 12, N'shoe_noun_002_33438.jpg', 0, NULL)
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (201, NULL, N'acc', N'ssss', 18, 50, 23, 100, CAST(N'2022-06-16' AS Date), CAST(N'2022-06-16' AS Date), 11, N'Untitled.png', 0, 0)
GO
INSERT [dbo].[Product] ([ProductID], [Author], [Title], [Summary], [CategoryID], [Price], [Discount], [Quantity], [Created_At], [Update_At], [Status], [thumbnail], [View], [Rate]) VALUES (202, 1, N'4353', N'sssssssssssss', 18, 4000, 3000, 1, NULL, CAST(N'2022-07-21' AS Date), 12, N'15225d76-2674-4ddc-a696-f3a71e072031.jpeg', 0, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_Feedback] ON 

INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (3, 102, 4, N'123', 4, CAST(N'2021-01-01' AS Date), N'ad', 1, NULL)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (4, 103, 10, N'hehe', 5, CAST(N'2022-02-10' AS Date), N'hehe', 2, 1)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (7, 104, 5, N'hoho', 3, CAST(N'2022-03-10' AS Date), N'hihi', 4, 0)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (8, 105, 11, N'ksdjlskdn', 2, CAST(N'2022-03-12' AS Date), N'jdfkjdnvkjcnvk', 2, 0)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (9, 105, 25, N'fdhjdkjvn', 1, CAST(N'2022-04-10' AS Date), N'?iodsjclkx', 1, 0)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (10, 107, 12, N'sp tot lam em', 5, CAST(N'2022-03-11' AS Date), N'dkjfknv', 4, 0)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (11, 105, 12, N'sp qua tot', 5, CAST(N'2022-03-15' AS Date), N'dnfkjdnvk', 4, 0)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (12, 103, 22, N'iu iu', 5, CAST(N'2022-03-20' AS Date), N'djskjsnc', 3, 0)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (14, 123, 15, N'oke oke', 3, CAST(N'2022-05-10' AS Date), N'san pham nay dung qua la oce nun', 10, 0)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (18, 145, 11, N'sp quá là t?t nun', 4, CAST(N'2022-03-19' AS Date), N'oke oke oke', 15, 0)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (19, 156, 12, N'san pham qua tot', 5, CAST(N'2022-03-01' AS Date), N'sp dung tot lam moi nguoi mua di', 5, 1)
INSERT [dbo].[Product_Feedback] ([FeedbackID], [ProductID], [UserID], [Title], [Rating], [Create_At], [Content], [Like], [status]) VALUES (20, 167, 15, N'san pham dung tot lam', 5, CAST(N'2022-02-10' AS Date), N'oke', 11, 0)
SET IDENTITY_INSERT [dbo].[Product_Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Setting] ON 

INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (1, N'User Role', N'Customer', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (2, N'User Role', N'Marketing', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (3, N'User Role', N'Sale', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (4, N'User Role', N'Sale Manager', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (6, N'User Role', N'Admin', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (7, N'User Status', N'Active', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (8, N'User Status', N'Non_Active', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (11, N'Product Status', N'Out of stock', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (12, N'Product Status', N'Stocking', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (13, N'Product Status', N'Block', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (15, N'Order Status', N'Processing', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (16, N'Order Status', N'Confirm', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (17, N'Order Status', N'Cancel', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (18, N'Product Category', N'Shoe', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (19, N'Product Category', N'Smart Phone', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (20, N'Product Category', N'Chair', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (21, N'Product Category', N'Alcohol', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (22, N'Product Category', N'Laptop', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (23, N'Product Category', N'TV', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (24, N'Post Category', N'Sale', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (25, N'Post Category', N'Minigame', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (26, N'Post Category', N'Riview', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (27, N'Post Category', N'Discover', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (28, N'Post Category', N'System', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (29, N'Post Status', N'Inactive', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (30, N'Post Status', N'Active', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (32, N'Slider Status', N'Inactive', 1, 1)
INSERT [dbo].[Setting] ([Setting_ID], [Group], [Name], [Order], [Status]) VALUES (33, N'Slider Status', N'Active', 1, 1)
SET IDENTITY_INSERT [dbo].[Setting] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([SlideID], [Slide_Title], [Slide_Img], [Author], [StartDate], [Status], [Slide_Content]) VALUES (1, N'Slider 1', N'4b5497af-e539-4420-9809-bc5a76c53ea7.png', 103, CAST(N'2022-03-05' AS Date), 33, N'abcxyz')
INSERT [dbo].[Slide] ([SlideID], [Slide_Title], [Slide_Img], [Author], [StartDate], [Status], [Slide_Content]) VALUES (2, N'Slide 2', N'3b167990a1f97a562778ee0a7a6b6714_xxhdpi.png', 105, CAST(N'2022-11-11' AS Date), 33, N'defghjklm')
INSERT [dbo].[Slide] ([SlideID], [Slide_Title], [Slide_Img], [Author], [StartDate], [Status], [Slide_Content]) VALUES (3, N'Slide 3', N'859156d476706e43d0eb0b6dbe106ca7_xxhdpi.png', 106, CAST(N'2022-07-04' AS Date), 33, N'thong xau trai')
INSERT [dbo].[Slide] ([SlideID], [Slide_Title], [Slide_Img], [Author], [StartDate], [Status], [Slide_Content]) VALUES (5, N'AAA', N'1fa26763dfd88844d5e355178ef28ef4_xxhdpi.png', 105, CAST(N'2022-06-29' AS Date), 32, NULL)
INSERT [dbo].[Slide] ([SlideID], [Slide_Title], [Slide_Img], [Author], [StartDate], [Status], [Slide_Content]) VALUES (6, N'abc', N'1162f7da-e3f2-4c1f-b6d4-b7c86c7fdcb2.png', 105, CAST(N'2022-07-21' AS Date), 32, N'kjzdxfchkxjc')
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (1, N'0886969888', N'Nguyen Kiem Thong', 1, N'202cb962ac59075b964b07152d234b70', N'hieu261101@gmail.com', N'An Vi, Khoai Chau, Hung Yen', 1, CAST(N'2021-08-23' AS Date), CAST(N'2022-01-01' AS Date), NULL, CAST(N'2001-08-23' AS Date), 8)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (4, N'350 747 6011', N'Dai Luong', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'luongvdhe150026@fpt.edu.vn', N'239 Thai Ha, Ha Noi', 1, CAST(N'2020-11-20' AS Date), CAST(N'2021-03-21' AS Date), N'335511096173.jpg', CAST(N'2000-01-24' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (5, N'222222222', N'aaa', 0, NULL, N'abc@aaa', NULL, 2, CAST(N'2022-06-29' AS Date), NULL, NULL, NULL, 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (6, N'2304432', N'luong', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'acc@acc', N'06 Cardinal Drive', 1, CAST(N'2021-06-23' AS Date), CAST(N'2021-10-08' AS Date), NULL, CAST(N'2022-04-09' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (7, N'443 348 5626', N'lknappitt4', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'lronald4@gmpg.org', N'191 Havey Hill', 1, CAST(N'2021-12-08' AS Date), CAST(N'2021-02-21' AS Date), NULL, CAST(N'2021-09-10' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (8, N'169 591 7804', N'mdoddemeade5', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'bfuxman5@hp.com', N'76 Kingsford Point', 1, CAST(N'2021-06-09' AS Date), CAST(N'2021-12-18' AS Date), NULL, CAST(N'2022-01-31' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (9, N'416 856 2159', N'myurocjhin6', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'kglasard6@gnu.org', N'9186 Service Junction', 1, CAST(N'2021-12-08' AS Date), CAST(N'2021-05-28' AS Date), NULL, CAST(N'2022-04-20' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (10, N'984 939 3669', N'mpetzold7', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'rrushmer7@imageshack.us', N'1 Northview Point', 1, CAST(N'2021-10-26' AS Date), CAST(N'2021-05-29' AS Date), NULL, CAST(N'2021-02-02' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (11, N'378 144 4582', N'nbroscombe8', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'tchittim8@1und1.de', N'36 Sommers Road', 1, CAST(N'2021-09-21' AS Date), CAST(N'2021-01-14' AS Date), NULL, CAST(N'2021-05-07' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (12, N'822 675 3758', N'bdesantis9', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'igetten9@usatoday.com', N'20 Laurel Street', 1, CAST(N'2020-12-01' AS Date), CAST(N'2022-03-03' AS Date), NULL, CAST(N'2021-11-11' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (13, N'322 385 5732', N'hwegnera', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'iblayneya@cisco.com', N'8714 Weeping Birch Street', 1, CAST(N'2021-09-06' AS Date), CAST(N'2021-06-16' AS Date), NULL, CAST(N'2021-06-21' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (14, N'353 327 2567', N'mskoggingsb', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'cpakenhamb@vistaprint.com', N'8 Westend Lane', 1, CAST(N'2022-02-24' AS Date), CAST(N'2021-08-08' AS Date), NULL, CAST(N'2022-01-30' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (15, N'697 677 9683', N'fstrickettc', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'gfeavearyearc@youtu.be', N'626 Waywood Street', 1, CAST(N'2021-12-07' AS Date), CAST(N'2022-02-22' AS Date), NULL, CAST(N'2021-05-13' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (16, N'687 706 0979', N'eoneild', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'gmattiazzod@nature.com', N'183 Redwing Trail', 1, CAST(N'2021-08-10' AS Date), CAST(N'2021-01-29' AS Date), NULL, CAST(N'2021-08-24' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (17, N'459 906 4720', N'bsnufflebottome', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'tbalselliee@telegraph.co.uk', N'9 North Drive', 1, CAST(N'2021-02-07' AS Date), CAST(N'2021-08-20' AS Date), NULL, CAST(N'2022-04-23' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (18, N'394 590 0153', N'sgreyf', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'idaingerfieldf@jimdo.com', N'87 Delladonna Road', 1, CAST(N'2021-03-22' AS Date), CAST(N'2021-10-24' AS Date), NULL, CAST(N'2021-02-06' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (19, N'693 577 9514', N'srobuchong', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'rgriggg@yelp.com', N'8886 Valley Edge Circle', 1, CAST(N'2022-04-15' AS Date), CAST(N'2021-08-20' AS Date), NULL, CAST(N'2021-10-05' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (20, N'725 798 0694', N'vbruntjeh', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'cfrankhamh@gravatar.com', N'76884 5th Circle', 1, CAST(N'2021-11-02' AS Date), CAST(N'2021-01-07' AS Date), NULL, CAST(N'2022-01-09' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (21, N'610 272 3865', N'lfraynei', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'yjanouseki@devhub.com', N'556 Veith Park', 1, CAST(N'2021-03-27' AS Date), CAST(N'2022-01-05' AS Date), NULL, CAST(N'2022-04-28' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (22, N'171 889 1809', N'skunertj', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'chickenbottomj@mlb.com', N'70 Rowland Point', 1, CAST(N'2021-08-29' AS Date), CAST(N'2022-01-06' AS Date), NULL, CAST(N'2022-01-26' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (23, N'978 401 2422', N'meisikowitzk', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'usurplissk@newsvine.com', N'71 Swallow Street', 1, CAST(N'2021-05-06' AS Date), CAST(N'2022-05-03' AS Date), NULL, CAST(N'2021-04-04' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (24, N'394 841 7777', N'chakingl', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'aklaaasenl@shutterfly.com', N'1 Hagan Alley', 1, CAST(N'2021-10-23' AS Date), CAST(N'2021-10-16' AS Date), NULL, CAST(N'2021-10-02' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (25, N'703 249 4439', N'dhannerm', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'thelmm@jiathis.com', N'62 Mendota Drive', 1, CAST(N'2021-02-07' AS Date), CAST(N'2021-11-06' AS Date), NULL, CAST(N'2022-03-29' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (26, N'380 279 8356', N'apovlsenn', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'stittan@marriott.com', N'1411 Merrick Drive', 1, CAST(N'2021-08-20' AS Date), CAST(N'2021-02-20' AS Date), NULL, CAST(N'2021-02-25' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (27, N'954 443 6106', N'mroscoeo', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'mstollo@ibm.com', N'05259 Nobel Junction', 1, CAST(N'2021-11-16' AS Date), CAST(N'2021-08-11' AS Date), NULL, CAST(N'2021-11-28' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (28, N'733 950 1211', N'lnorthridgep', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'cbigriggp@spotify.com', N'9170 Haas Trail', 1, CAST(N'2021-11-01' AS Date), CAST(N'2022-01-16' AS Date), NULL, CAST(N'2021-12-28' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (29, N'234 555 3338', N'amaccleodq', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'ndaymentq@google.pl', N'568 North Terrace', 1, CAST(N'2020-12-17' AS Date), CAST(N'2021-02-07' AS Date), NULL, CAST(N'2022-02-07' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (30, N'750 749 1456', N'bcrebottr', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'lhacquoilr@patch.com', N'13 La Follette Hill', 1, CAST(N'2021-08-21' AS Date), CAST(N'2021-10-15' AS Date), NULL, CAST(N'2021-03-29' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (31, N'588 922 2896', N'pmanders', 0, N'21232f297a57a5a743894a0e4a801fc3', N'admin1@gmail', N'6 Sloan Parkway', 2, CAST(N'2022-06-29' AS Date), CAST(N'2022-01-08' AS Date), NULL, CAST(N'2021-12-09' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (32, N'307 721 8868', N'hbelchemt', 1, N'21232f297a57a5a743894a0e4a801fc3', N'xzcxcczxcz', N'169 Mosinee Point', 1, CAST(N'2022-06-29' AS Date), CAST(N'2021-03-13' AS Date), NULL, CAST(N'2021-10-09' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (33, N'916 340 4534', N'scallisteru', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'bfranzonellou@prlog.org', N'62278 Chinook Circle', 1, CAST(N'2022-06-29' AS Date), CAST(N'2021-02-24' AS Date), NULL, CAST(N'2022-05-14' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (34, N'779 667 5138', N'estannettv', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'mclaussonv@163.com', N'7 Bashford Drive', 1, CAST(N'2022-02-08' AS Date), CAST(N'2021-02-06' AS Date), NULL, CAST(N'2021-10-16' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (35, N'894 549 0522', N'nbrizlandw', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'amuzziw@free.fr', N'642 Oak Terrace', 1, CAST(N'2022-06-29' AS Date), CAST(N'2021-08-02' AS Date), NULL, CAST(N'2021-09-16' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (36, N'685 184 8282', N'mkillingbeckx', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'ltomczykiewiczx@webeden.co.uk', N'162 Monument Point', 1, CAST(N'2022-06-29' AS Date), CAST(N'2021-09-21' AS Date), NULL, CAST(N'2021-06-09' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (37, N'304 761 2311', N'garchambaulty', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'drawsony@globo.com', N'63029 Moulton Drive', 1, CAST(N'2022-05-09' AS Date), CAST(N'2021-05-29' AS Date), NULL, CAST(N'2022-05-16' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (38, N'953 150 0739', N'wroughleyz', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'kbarajazz@typepad.com', N'58498 Norway Maple Center', 1, CAST(N'2022-06-29' AS Date), CAST(N'2021-02-14' AS Date), NULL, CAST(N'2021-05-06' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (39, N'418 599 3936', N'amcmarquis10', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'fwharton10@cyberchimps.com', N'2944 Lakewood Gardens Hill', 1, CAST(N'2022-06-29' AS Date), CAST(N'2021-03-23' AS Date), NULL, CAST(N'2021-07-13' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (40, N'113 554 4995', N'ekail11', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'wpaulin11@people.com.cn', N'545 Center Circle', 1, CAST(N'2022-06-29' AS Date), CAST(N'2021-01-07' AS Date), NULL, CAST(N'2021-12-08' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (41, N'237 746 7966', N'jwintersgill12', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'cbromby12@eventbrite.com', N'1 Springview Trail', 1, CAST(N'2022-06-29' AS Date), CAST(N'2021-07-30' AS Date), NULL, CAST(N'2021-09-26' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (42, N'308 387 3268', N'llumm13', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'ugoves13@icq.com', N'0 Stone Corner Circle', 1, CAST(N'2022-06-29' AS Date), CAST(N'2022-03-06' AS Date), NULL, CAST(N'2022-03-15' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (43, N'167 632 9509', N'mpearsey14', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'omacgebenay14@123-reg.co.uk', N'99 Autumn Leaf Plaza', 1, CAST(N'2021-02-12' AS Date), CAST(N'2021-09-12' AS Date), NULL, CAST(N'2022-01-07' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (44, N'778 626 9338', N'cfolker15', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'fkalb15@a8.net', N'89 Melvin Crossing', 1, CAST(N'2021-05-13' AS Date), CAST(N'2021-08-07' AS Date), NULL, CAST(N'2021-05-08' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (45, N'640 357 8104', N'gculmer16', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'brosendale16@latimes.com', N'42076 Lake View Lane', 1, CAST(N'2022-04-11' AS Date), CAST(N'2022-02-19' AS Date), NULL, CAST(N'2021-08-18' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (46, N'712 891 9801', N'asuero17', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'asabathier17@dmoz.org', N'8 Prairie Rose Court', 1, CAST(N'2021-03-09' AS Date), CAST(N'2021-10-23' AS Date), NULL, CAST(N'2021-04-15' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (47, N'771 596 3035', N'gfillis18', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'jgulley18@networkadvertising.org', N'2165 Karstens Junction', 1, CAST(N'2020-12-16' AS Date), CAST(N'2022-03-16' AS Date), NULL, CAST(N'2021-07-29' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (48, N'392 439 5958', N'anormanvill19', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'ogleadhell19@thetimes.co.uk', N'9064 Village Lane', 1, CAST(N'2021-11-12' AS Date), CAST(N'2021-01-10' AS Date), NULL, CAST(N'2021-08-06' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (49, N'121 101 6006', N'rsandever1a', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'pthorlby1a@utexas.edu', N'4 Green Ridge Point', 1, CAST(N'2022-03-01' AS Date), CAST(N'2021-04-22' AS Date), NULL, CAST(N'2021-09-04' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (50, N'962 490 4967', N'chosten1b', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'aevill1b@topsy.com', N'1 Forest Park', 1, CAST(N'2021-04-20' AS Date), CAST(N'2021-11-17' AS Date), NULL, CAST(N'2022-05-12' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (51, N'138 440 1147', N'ychatwin1c', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'feakley1c@diigo.com', N'54002 Corben Court', 1, CAST(N'2021-01-26' AS Date), CAST(N'2021-07-04' AS Date), NULL, CAST(N'2022-04-21' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (52, N'381 402 9523', N'kmorbey1d', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'fhaukey1d@feedburner.com', N'290 Nancy Plaza', 1, CAST(N'2020-11-07' AS Date), CAST(N'2021-11-08' AS Date), NULL, CAST(N'2021-07-03' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (53, N'809 536 9511', N'grimes1e', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'lculy1e@vinaora.com', N'6 Charing Cross Crossing', 1, CAST(N'2021-11-11' AS Date), CAST(N'2021-08-23' AS Date), NULL, CAST(N'2022-03-30' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (54, N'827 309 0014', N'stilly1f', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'kcalow1f@rediff.com', N'5 Di Loreto Terrace', 1, CAST(N'2022-05-12' AS Date), CAST(N'2021-05-15' AS Date), NULL, CAST(N'2021-02-24' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (55, N'164 763 1367', N'blittleton1g', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'iorgel1g@friendfeed.com', N'18 Briar Crest Drive', 1, CAST(N'2021-04-15' AS Date), CAST(N'2021-08-23' AS Date), NULL, CAST(N'2021-05-03' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (56, N'823 520 4259', N'hcheak1h', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'rkibbel1h@flickr.com', N'946 Calypso Circle', 1, CAST(N'2021-02-12' AS Date), CAST(N'2021-10-11' AS Date), NULL, CAST(N'2021-01-14' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (57, N'290 185 2785', N'mmattson1i', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'kmaccaughan1i@bing.com', N'3 Hansons Drive', 1, CAST(N'2021-11-19' AS Date), CAST(N'2021-06-20' AS Date), NULL, CAST(N'2022-02-16' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (58, N'301 840 4184', N'cdinnage1j', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'cbendon1j@miibeian.gov.cn', N'2854 Clarendon Way', 1, CAST(N'2022-04-29' AS Date), CAST(N'2021-01-31' AS Date), NULL, CAST(N'2021-12-12' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (59, N'215 622 9244', N'asivills1k', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'hceeley1k@printfriendly.com', N'8 Schurz Crossing', 1, CAST(N'2022-02-19' AS Date), CAST(N'2021-05-03' AS Date), NULL, CAST(N'2021-08-17' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (60, N'419 393 1468', N'grupel1l', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'achallenger1l@ameblo.jp', N'7973 Springs Street', 1, CAST(N'2021-10-02' AS Date), CAST(N'2021-01-27' AS Date), NULL, CAST(N'2022-04-10' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (61, N'256 174 6341', N'ustiger1m', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'bperago1m@ow.ly', N'0862 Waxwing Center', 1, CAST(N'2022-04-26' AS Date), CAST(N'2022-02-03' AS Date), NULL, CAST(N'2021-11-24' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (62, N'137 622 8646', N'ayantsurev1n', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'daxcell1n@oaic.gov.au', N'121 Swallow Plaza', 1, CAST(N'2022-04-21' AS Date), CAST(N'2021-06-20' AS Date), NULL, CAST(N'2021-10-31' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (63, N'560 520 3510', N'gnowlan1o', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'craylton1o@cnn.com', N'27 Reinke Terrace', 1, CAST(N'2021-10-21' AS Date), CAST(N'2021-11-12' AS Date), NULL, CAST(N'2022-04-29' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (64, N'906 131 2904', N'acaghan1p', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'lisacoff1p@bbb.org', N'37604 Lotheville Circle', 1, CAST(N'2021-12-24' AS Date), CAST(N'2021-04-04' AS Date), NULL, CAST(N'2021-05-17' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (65, N'438 797 7043', N'ehebborn1q', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'cdeeson1q@bing.com', N'3 Clove Crossing', 1, CAST(N'2021-02-11' AS Date), CAST(N'2021-05-17' AS Date), NULL, CAST(N'2021-03-25' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (66, N'134 328 8839', N'dbugg1r', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'apedrazzi1r@state.tx.us', N'049 Texas Junction', 1, CAST(N'2021-03-11' AS Date), CAST(N'2021-01-22' AS Date), NULL, CAST(N'2021-03-30' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (67, N'413 260 6130', N'nwallman1s', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'mharriday1s@jiathis.com', N'130 Judy Alley', 1, CAST(N'2021-04-04' AS Date), CAST(N'2022-05-02' AS Date), NULL, CAST(N'2022-01-19' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (68, N'676 827 8426', N'iwoodrow1t', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'iarchbold1t@friendfeed.com', N'373 Truax Court', 1, CAST(N'2021-06-25' AS Date), CAST(N'2021-05-13' AS Date), NULL, CAST(N'2022-04-27' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (69, N'294 937 1275', N'llezemere1u', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'gsmees1u@dmoz.org', N'5953 Surrey Terrace', 1, CAST(N'2021-07-19' AS Date), CAST(N'2021-12-09' AS Date), NULL, CAST(N'2021-01-30' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (70, N'250 587 7997', N'agartell1v', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'skinghorn1v@privacy.gov.au', N'32 Rieder Road', 1, CAST(N'2022-01-30' AS Date), CAST(N'2021-07-17' AS Date), NULL, CAST(N'2022-03-18' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (71, N'741 586 4944', N'lgoublier1w', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'pandrag1w@blogger.com', N'45 Golf View Point', 1, CAST(N'2022-05-02' AS Date), CAST(N'2022-01-18' AS Date), NULL, CAST(N'2022-03-16' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (72, N'222 621 6975', N'atodman1x', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'fcrouch1x@pcworld.com', N'643 Vermont Way', 1, CAST(N'2022-03-05' AS Date), CAST(N'2021-08-08' AS Date), NULL, CAST(N'2021-05-28' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (73, N'768 768 8391', N'mbeavers1y', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'kcarrett1y@gmpg.org', N'257 Dryden Lane', 1, CAST(N'2021-11-25' AS Date), CAST(N'2021-05-27' AS Date), NULL, CAST(N'2021-07-21' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (74, N'977 143 3415', N'jhamshere1z', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'wsickamore1z@geocities.com', N'3211 Dahle Point', 1, CAST(N'2020-12-09' AS Date), CAST(N'2022-04-04' AS Date), NULL, CAST(N'2021-09-05' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (75, N'391 394 5428', N'gilling20', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'rcomberbach20@clickbank.net', N'0958 Northview Hill', 1, CAST(N'2021-04-08' AS Date), CAST(N'2021-04-25' AS Date), NULL, CAST(N'2021-05-25' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (76, N'555 374 8253', N'wcrowson21', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'atitchen21@elegantthemes.com', N'89 Larry Hill', 1, CAST(N'2021-01-26' AS Date), CAST(N'2021-10-19' AS Date), NULL, CAST(N'2021-05-29' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (77, N'621 251 1640', N'tbinyon22', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'hmackartan22@clickbank.net', N'5 Melvin Alley', 1, CAST(N'2021-09-16' AS Date), CAST(N'2021-12-19' AS Date), NULL, CAST(N'2021-12-14' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (78, N'955 937 3353', N'mmorison23', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'equarry23@wordpress.org', N'3545 Magdeline Trail', 1, CAST(N'2020-10-17' AS Date), CAST(N'2021-05-12' AS Date), NULL, CAST(N'2022-04-03' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (79, N'189 198 2665', N'vquarton24', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'dsteiner24@ustream.tv', N'3829 Mayer Trail', 1, CAST(N'2021-08-02' AS Date), CAST(N'2021-10-29' AS Date), NULL, CAST(N'2021-06-30' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (80, N'710 102 2896', N'vtamsett25', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'rroux25@sciencedirect.com', N'2 Basil Street', 1, CAST(N'2021-07-23' AS Date), CAST(N'2021-08-01' AS Date), NULL, CAST(N'2021-01-14' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (81, N'254 648 4513', N'dperri26', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'ihazeldene26@wunderground.com', N'08 Gina Pass', 1, CAST(N'2020-10-14' AS Date), CAST(N'2021-03-13' AS Date), NULL, CAST(N'2021-06-12' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (82, N'756 905 8701', N'csowood27', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'lrelton27@1und1.de', N'8 Badeau Drive', 1, CAST(N'2021-08-25' AS Date), CAST(N'2022-03-05' AS Date), NULL, CAST(N'2021-01-21' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (83, N'678 786 2055', N'cbogart28', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'gasson28@ucoz.com', N'00 Thierer Drive', 1, CAST(N'2020-11-02' AS Date), CAST(N'2021-12-30' AS Date), NULL, CAST(N'2021-02-14' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (84, N'715 886 3829', N'ebleiman29', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'gbecket29@toplist.cz', N'348 Prairie Rose Way', 1, CAST(N'2021-03-12' AS Date), CAST(N'2021-10-20' AS Date), NULL, CAST(N'2021-12-02' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (85, N'323 865 7296', N'mganter2a', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'imelesk2a@ted.com', N'47796 Hoffman Way', 1, CAST(N'2021-10-07' AS Date), CAST(N'2021-02-20' AS Date), NULL, CAST(N'2021-02-24' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (86, N'701 461 0024', N'tskirling2b', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'lroyse2b@ameblo.jp', N'7893 Meadow Valley Plaza', 1, CAST(N'2022-04-14' AS Date), CAST(N'2021-04-17' AS Date), NULL, CAST(N'2022-04-24' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (87, N'994 222 9652', N'ekennealy2c', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'dpurvess2c@weebly.com', N'58049 Kingsford Hill', 1, CAST(N'2022-04-22' AS Date), CAST(N'2021-08-31' AS Date), NULL, CAST(N'2021-10-13' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (88, N'166 645 4999', N'mspittle2d', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'aseagood2d@bigcartel.com', N'4306 Continental Junction', 1, CAST(N'2021-08-02' AS Date), CAST(N'2021-11-08' AS Date), NULL, CAST(N'2022-02-08' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (89, N'169 285 5825', N'bbutson2e', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'pstaunton2e@telegraph.co.uk', N'3588 Blaine Terrace', 1, CAST(N'2021-09-14' AS Date), CAST(N'2022-02-02' AS Date), NULL, CAST(N'2021-08-13' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (90, N'200 405 1580', N'rambroz2f', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'tebsworth2f@xinhuanet.com', N'1 Clarendon Court', 1, CAST(N'2022-04-03' AS Date), CAST(N'2021-12-25' AS Date), NULL, CAST(N'2022-02-26' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (91, N'244 379 8191', N'htopes2g', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'asprigings2g@blogtalkradio.com', N'967 Pleasure Place', 1, CAST(N'2021-08-25' AS Date), CAST(N'2021-01-15' AS Date), NULL, CAST(N'2022-04-09' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (92, N'295 474 6374', N'ddannell2h', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'ggobert2h@so-net.ne.jp', N'71 Clarendon Alley', 1, CAST(N'2021-12-07' AS Date), CAST(N'2022-01-18' AS Date), NULL, CAST(N'2021-07-21' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (93, N'907 954 0989', N'lgooderridge2i', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'fthieme2i@europa.eu', N'21 Golden Leaf Avenue', 1, CAST(N'2020-11-17' AS Date), CAST(N'2021-07-30' AS Date), NULL, CAST(N'2021-06-04' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (94, N'550 324 6808', N'dseagood2j', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'cdrewet2j@example.com', N'66 Mayer Trail', 1, CAST(N'2022-04-13' AS Date), CAST(N'2021-06-15' AS Date), NULL, CAST(N'2021-05-18' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (95, N'701 769 5844', N'zmccandless2k', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'sdurning2k@usa.gov', N'0 Sachtjen Center', 1, CAST(N'2021-12-24' AS Date), CAST(N'2021-08-30' AS Date), NULL, CAST(N'2021-08-13' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (96, N'573 235 3173', N'smessitt2l', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'sspellacy2l@cnbc.com', N'804 Westport Crossing', 1, CAST(N'2021-06-26' AS Date), CAST(N'2022-03-29' AS Date), NULL, CAST(N'2022-02-08' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (97, N'856 524 0836', N'oalaway2m', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'scartman2m@soup.io', N'39923 Mendota Trail', 1, CAST(N'2021-06-17' AS Date), CAST(N'2021-11-17' AS Date), NULL, CAST(N'2022-04-03' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (98, N'811 476 6506', N'saldersea2n', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'browlatt2n@stumbleupon.com', N'17 Prairieview Drive', 1, CAST(N'2021-07-14' AS Date), CAST(N'2021-10-16' AS Date), NULL, CAST(N'2022-03-25' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (99, N'470 123 0682', N'kdilloway2o', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'escreech2o@booking.com', N'50787 Algoma Hill', 1, CAST(N'2021-11-27' AS Date), CAST(N'2021-02-23' AS Date), NULL, CAST(N'2022-04-28' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (100, N'203 233 6307', N'emirando2p', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'rmeers2p@howstuffworks.com', N'8499 Thompson Avenue', 1, CAST(N'2022-01-17' AS Date), CAST(N'2022-03-11' AS Date), NULL, CAST(N'2022-02-09' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (101, N'457 527 5470', N'cwason2q', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'lharriday2q@hud.gov', N'760 Leroy Park', 1, CAST(N'2021-04-02' AS Date), CAST(N'2021-11-20' AS Date), NULL, CAST(N'2021-12-27' AS Date), 7)
GO
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (102, N'408 795 6348', N'ggoscomb2r', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'tkovalski2r@who.int', N'06 Dexter Hill', 1, CAST(N'2021-03-06' AS Date), CAST(N'2021-04-01' AS Date), NULL, CAST(N'2022-01-04' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (103, N'126 570 5463', N'coxtoby0', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'gluigi0@berkeley.edu', N'1898 Reindahl Park', 2, CAST(N'2022-01-07' AS Date), CAST(N'2021-09-06' AS Date), NULL, CAST(N'2022-01-05' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (105, N'331 611 4555', N'gmcmanus2', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'rmcmillian2@howstuffworks.com', N'468 Dunning Trail', 2, CAST(N'2021-11-20' AS Date), CAST(N'2021-05-09' AS Date), NULL, CAST(N'2022-05-01' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (106, N'400 966 0983', N'imindenhall3', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'sklausewitz3@google.com.au', N'1144 Lukken Pass', 2, CAST(N'2020-10-16' AS Date), CAST(N'2021-09-06' AS Date), NULL, CAST(N'2021-09-24' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (107, N'882 640 3611', N'tkarpf4', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'lpimblett4@google.com.br', N'69095 Eliot Trail', 2, CAST(N'2021-08-12' AS Date), CAST(N'2021-01-11' AS Date), NULL, CAST(N'2021-02-07' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (108, N'774 279 3634', N'msimmonite5', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'kbiddles5@uiuc.edu', N'22 Jenifer Junction', 2, CAST(N'2021-10-06' AS Date), CAST(N'2021-05-27' AS Date), NULL, CAST(N'2021-12-23' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (109, N'401 658 2784', N'cbartkowiak6', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'cjanu6@hatena.ne.jp', N'45 Kings Court', 2, CAST(N'2021-06-16' AS Date), CAST(N'2021-04-07' AS Date), NULL, CAST(N'2021-03-18' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (110, N'688 310 6723', N'ffinney7', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'bdunbleton7@51.la', N'76 Delaware Lane', 2, CAST(N'2021-08-11' AS Date), CAST(N'2022-04-03' AS Date), NULL, CAST(N'2021-04-03' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (111, N'418 288 0793', N'pcolbertson8', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'welnaugh8@yandex.ru', N'70 Crowley Terrace', 2, CAST(N'2022-02-18' AS Date), CAST(N'2021-03-23' AS Date), NULL, CAST(N'2021-05-04' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (112, N'579 346 8156', N'ldavet9', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'smollene9@sbwire.com', N'520 Mendota Pass', 2, CAST(N'2021-07-24' AS Date), CAST(N'2022-02-07' AS Date), NULL, CAST(N'2022-01-10' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (113, N'617 643 2923', N'jplacido0', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'jscupham0@springer.com', N'3 Logan Junction', 3, CAST(N'2020-10-27' AS Date), CAST(N'2022-01-03' AS Date), NULL, CAST(N'2022-05-12' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (114, N'851 971 4816', N'swalicki1', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'dbicksteth1@ycombinator.com', N'12 Summit Center', 3, CAST(N'2021-01-23' AS Date), CAST(N'2021-02-12' AS Date), NULL, CAST(N'2021-07-19' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (115, N'320 600 0603', N'hstagge2', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'fhamblett2@wsj.com', N'007 Hovde Pass', 3, CAST(N'2021-02-27' AS Date), CAST(N'2022-02-24' AS Date), NULL, CAST(N'2021-11-01' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (116, N'529 835 0531', N'mcurryer3', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'njorio3@themeforest.net', N'00373 Park Meadow Court', 3, CAST(N'2021-10-26' AS Date), CAST(N'2021-10-06' AS Date), NULL, CAST(N'2021-01-22' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (117, N'608 516 3784', N'jmcwhinnie4', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'kcrawley4@seesaa.net', N'634 Brown Parkway', 3, CAST(N'2022-02-11' AS Date), CAST(N'2022-01-13' AS Date), NULL, CAST(N'2021-02-11' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (118, N'981 290 3044', N'sjenken5', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'epickett5@sourceforge.net', N'35273 Riverside Road', 3, CAST(N'2021-05-25' AS Date), CAST(N'2021-04-30' AS Date), NULL, CAST(N'2022-03-31' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (119, N'151 337 5506', N'vbeeken6', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'gpitblado6@mit.edu', N'1689 Packers Trail', 3, CAST(N'2021-04-22' AS Date), CAST(N'2021-04-30' AS Date), NULL, CAST(N'2022-04-11' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (120, N'997 548 5146', N'awintringham7', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'tferrillio7@clickbank.net', N'0133 Stoughton Park', 3, CAST(N'2022-05-08' AS Date), CAST(N'2021-10-22' AS Date), NULL, CAST(N'2021-02-16' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (121, N'713 522 3870', N'bpyne8', 0, N'c4ca4238a0b923820dcc509a6f75849b', N'jbillington8@uiuc.edu', N'7 Vermont Road', 3, CAST(N'2021-09-23' AS Date), CAST(N'2021-04-28' AS Date), NULL, CAST(N'2022-04-08' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (122, N'831 121 8811', N'ewolfenden9', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'dcollyear9@globo.com', N'206 Algoma Lane', 3, CAST(N'2020-12-14' AS Date), CAST(N'2021-11-15' AS Date), NULL, CAST(N'2021-11-21' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (123, N'12345678', N'Prokc', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'thongnkhe150031@fpt.edu.vn', N'prokdq', 4, CAST(N'2020-01-01' AS Date), CAST(N'2022-04-04' AS Date), NULL, CAST(N'2002-03-23' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (124, N'123', N'thong', 1, N'1', N'admin123123@gmail.com', N'An Vi - Khoai Chau - Hung Yen', 1, CAST(N'2022-06-01' AS Date), CAST(N'2022-06-01' AS Date), NULL, CAST(N'2022-06-02' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (125, N'0886969888', N'thong22001', 1, N'123', N'thong22001@gmail.ca', N'An Vi - Khoai Chau - Hung Yen', 1, CAST(N'2022-06-01' AS Date), CAST(N'2022-06-01' AS Date), NULL, CAST(N'2022-06-02' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (126, N'0356047366', N'luong', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'vudailuong01012000aRs@gmail.com', N'viet nam', 1, CAST(N'2022-06-03' AS Date), CAST(N'2022-06-03' AS Date), NULL, CAST(N'2022-05-29' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (127, N'0356047366', N'hanagvfa', 1, N'202cb962ac59075b964b07152d234b70', N'vudailuong01012000R@gmail.com', N'239 Farwell Pass0', 1, CAST(N'2022-06-06' AS Date), CAST(N'2022-06-06' AS Date), NULL, CAST(N'2022-06-16' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (128, N'0966177021', N'Nguyen Van A', 1, N'7ca1449b80a8ce30479180247814ec3a', N'haminhquang20199@gmail.com', N'Vietnam', 1, CAST(N'2022-06-28' AS Date), CAST(N'2022-06-28' AS Date), NULL, CAST(N'2022-06-23' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (129, N'0966177021', N'Nguyen Van A', 1, N'f9866897658e2829313211b984bf1068', N'qmode5099@gmail.com', N'Vietnam', 1, CAST(N'2022-06-28' AS Date), CAST(N'2022-06-28' AS Date), NULL, CAST(N'2022-06-28' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (130, N'0966177021', N'Ha Minh Quang', 1, N'03d864ac01ec67ec5570a452259e06b4', N'haminhquang201@gmail.com', N'Vietnam', 1, CAST(N'2022-06-28' AS Date), CAST(N'2022-06-28' AS Date), NULL, CAST(N'2022-06-29' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (135, N'3450435', N'abc', 1, N'123', N'abc@abc', NULL, 1, CAST(N'2022-06-28' AS Date), CAST(N'2022-06-28' AS Date), NULL, CAST(N'2022-06-28' AS Date), 8)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (136, N'0358097388', N'Dai Luong', 0, N'123', N'luongvdhe150026@fpt.edu.vn', NULL, 1, CAST(N'2022-06-28' AS Date), CAST(N'2022-06-28' AS Date), NULL, CAST(N'2022-06-28' AS Date), 7)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (137, N'0358097388', N'Dai Luong', 0, N'123', N'luongvdhe150026@fpt.edu.vn', NULL, 1, CAST(N'2022-06-28' AS Date), CAST(N'2022-06-28' AS Date), NULL, CAST(N'2022-06-28' AS Date), 8)
INSERT [dbo].[User] ([UserID], [Phone], [Name], [Gender], [Password], [Email], [Address], [RoleID], [Registered_At], [Last_Login], [Avatar], [DOB], [Status]) VALUES (139, N'0358097388', N'Dai Luong', 0, N'123', N'luongvdhe150026@fpt.edu.vn', NULL, 1, CAST(N'2022-06-28' AS Date), CAST(N'2022-06-28' AS Date), NULL, CAST(N'2022-06-28' AS Date), 7)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Cart]
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK_CartDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK_CartDetail_Product]
GO
ALTER TABLE [dbo].[Discuss]  WITH CHECK ADD  CONSTRAINT [FK_Discuss_Discuss] FOREIGN KEY([Reply_FeedbackID])
REFERENCES [dbo].[Discuss] ([FeedbackID])
GO
ALTER TABLE [dbo].[Discuss] CHECK CONSTRAINT [FK_Discuss_Discuss]
GO
ALTER TABLE [dbo].[Discuss]  WITH CHECK ADD  CONSTRAINT [FK_Discuss_Post] FOREIGN KEY([PostID])
REFERENCES [dbo].[Post] ([PostID])
GO
ALTER TABLE [dbo].[Discuss] CHECK CONSTRAINT [FK_Discuss_Post]
GO
ALTER TABLE [dbo].[Discuss]  WITH CHECK ADD  CONSTRAINT [FK_Discuss_User] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Discuss] CHECK CONSTRAINT [FK_Discuss_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Setting] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Setting] ([Setting_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Setting]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Product]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Setting] FOREIGN KEY([Post_Category])
REFERENCES [dbo].[Setting] ([Setting_ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Setting]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Setting1] FOREIGN KEY([Post_Status])
REFERENCES [dbo].[Setting] ([Setting_ID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Setting1]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([Post_Author])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Setting1] FOREIGN KEY([Status])
REFERENCES [dbo].[Setting] ([Setting_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Setting1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Setting2] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Setting] ([Setting_ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Setting2]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([Author])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
ALTER TABLE [dbo].[Product_Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Product_Feedback_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Product_Feedback] CHECK CONSTRAINT [FK_Product_Feedback_Product]
GO
ALTER TABLE [dbo].[Product_Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Product_Feedback_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Product_Feedback] CHECK CONSTRAINT [FK_Product_Feedback_User]
GO
ALTER TABLE [dbo].[Reply_PFeedback]  WITH CHECK ADD  CONSTRAINT [FK_Reply_PFeedback_Product_Feedback] FOREIGN KEY([FeedbackID])
REFERENCES [dbo].[Product_Feedback] ([FeedbackID])
GO
ALTER TABLE [dbo].[Reply_PFeedback] CHECK CONSTRAINT [FK_Reply_PFeedback_Product_Feedback]
GO
ALTER TABLE [dbo].[Reply_PFeedback]  WITH CHECK ADD  CONSTRAINT [FK_Reply_PFeedback_User] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Reply_PFeedback] CHECK CONSTRAINT [FK_Reply_PFeedback_User]
GO
ALTER TABLE [dbo].[Slide]  WITH CHECK ADD  CONSTRAINT [FK_Slide_Setting] FOREIGN KEY([Status])
REFERENCES [dbo].[Setting] ([Setting_ID])
GO
ALTER TABLE [dbo].[Slide] CHECK CONSTRAINT [FK_Slide_Setting]
GO
ALTER TABLE [dbo].[Slide]  WITH CHECK ADD  CONSTRAINT [FK_Slide_User] FOREIGN KEY([Author])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Slide] CHECK CONSTRAINT [FK_Slide_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Setting] FOREIGN KEY([Status])
REFERENCES [dbo].[Setting] ([Setting_ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Setting]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Setting1] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Setting] ([Setting_ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Setting1]
GO
USE [master]
GO
ALTER DATABASE [Online_Shop] SET  READ_WRITE 
GO
