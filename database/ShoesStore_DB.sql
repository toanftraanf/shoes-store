USE [master]
GO
/****** Object:  Database [ShoesStore]    Script Date: 11/30/2023 2:59:20 PM ******/
CREATE DATABASE [ShoesStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoesStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShoesStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoesStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShoesStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShoesStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoesStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoesStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoesStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoesStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoesStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoesStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoesStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShoesStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoesStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoesStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoesStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoesStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoesStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoesStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoesStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoesStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoesStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoesStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoesStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoesStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoesStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoesStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoesStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoesStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoesStore] SET  MULTI_USER 
GO
ALTER DATABASE [ShoesStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoesStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoesStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoesStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoesStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoesStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShoesStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShoesStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShoesStore]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 11/30/2023 2:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[display_order] [int] NULL,
 CONSTRAINT [PK_brand] PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 11/30/2023 2:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[color_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_color] PRIMARY KEY CLUSTERED 
(
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 11/30/2023 2:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NULL,
	[status] [int] NULL,
	[customer_id] [int] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 11/30/2023 2:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[details_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[order_id] [int] NULL,
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/30/2023 2:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[status] [bit] NULL,
	[display_order] [int] NULL,
	[image] [nvarchar](255) NULL,
	[price] [decimal](18, 0) NULL,
	[promotion_price] [decimal](18, 0) NULL,
	[vat] [bit] NULL,
	[quantity] [int] NULL,
	[warranty] [int] NULL,
	[is_hot] [datetime] NULL,
	[description] [ntext] NULL,
	[cate_id] [int] NULL,
	[brand_id] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_category]    Script Date: 11/30/2023 2:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_category](
	[cate_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[status] [bit] NULL,
	[display_order] [int] NULL,
	[parent_id] [int] NULL,
 CONSTRAINT [PK_product_category] PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_details]    Script Date: 11/30/2023 2:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_details](
	[details_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[color_id] [int] NULL,
	[size_id] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_product_details] PRIMARY KEY CLUSTERED 
(
	[details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[size]    Script Date: 11/30/2023 2:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[size](
	[size_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](10) NULL,
 CONSTRAINT [PK_size] PRIMARY KEY CLUSTERED 
(
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 11/30/2023 2:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[mobile] [nvarchar](11) NULL,
	[address] [ntext] NULL,
	[password] [nvarchar](21) NULL,
	[email] [nvarchar](50) NULL,
	[status] [bit] NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([brand_id], [name], [display_order]) VALUES (1, N'Adidas', 1)
INSERT [dbo].[brand] ([brand_id], [name], [display_order]) VALUES (2, N'Nike', 2)
INSERT [dbo].[brand] ([brand_id], [name], [display_order]) VALUES (3, N'Reebok', 3)
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
SET IDENTITY_INSERT [dbo].[color] ON 

INSERT [dbo].[color] ([color_id], [name]) VALUES (1, N'Black')
INSERT [dbo].[color] ([color_id], [name]) VALUES (2, N'White')
INSERT [dbo].[color] ([color_id], [name]) VALUES (3, N'Brown')
INSERT [dbo].[color] ([color_id], [name]) VALUES (4, N'Midnight')
SET IDENTITY_INSERT [dbo].[color] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [name], [status], [display_order], [image], [price], [promotion_price], [vat], [quantity], [warranty], [is_hot], [description], [cate_id], [brand_id]) VALUES (1, N'Nike Air Force 1', 1, 1, N'https://static.nike.com/a/images/t_default/f8dfa191-60b3-44c1-b730-b25e0a908c35/air-force-1-07-easyon-shoes-LKXPhZ.png', CAST(3200 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), 1, 50, 1, CAST(N'2024-01-01T12:00:00.000' AS DateTime), N'The Nike Air Force 1 gives the classic silhouette a blank-slate makeover, one that accentuates the shoe’s classic lines. Built with white leather, the upper is appointed with heritage details, including a perforated toe box, variable width lacing, and metallic silver lace dubrae. A matching white rubber cupsole packs an Air-sole heel unit encapsulated in lightweight foam. Underfoot, the rubber outsole features the original pivot-point traction pattern.', 2, 2)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[product_category] ON 

INSERT [dbo].[product_category] ([cate_id], [name], [status], [display_order], [parent_id]) VALUES (1, N'Football', 1, 1, NULL)
INSERT [dbo].[product_category] ([cate_id], [name], [status], [display_order], [parent_id]) VALUES (2, N'Basketball', 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[product_category] OFF
GO
SET IDENTITY_INSERT [dbo].[product_details] ON 

INSERT [dbo].[product_details] ([details_id], [product_id], [color_id], [size_id], [quantity]) VALUES (1, 1, 1, 1, 6)
INSERT [dbo].[product_details] ([details_id], [product_id], [color_id], [size_id], [quantity]) VALUES (2, 1, 2, 1, 6)
INSERT [dbo].[product_details] ([details_id], [product_id], [color_id], [size_id], [quantity]) VALUES (3, 1, 1, 2, 6)
INSERT [dbo].[product_details] ([details_id], [product_id], [color_id], [size_id], [quantity]) VALUES (4, 1, 2, 2, 6)
INSERT [dbo].[product_details] ([details_id], [product_id], [color_id], [size_id], [quantity]) VALUES (5, 1, 1, 3, 6)
INSERT [dbo].[product_details] ([details_id], [product_id], [color_id], [size_id], [quantity]) VALUES (6, 1, 2, 3, 6)
INSERT [dbo].[product_details] ([details_id], [product_id], [color_id], [size_id], [quantity]) VALUES (7, 1, 1, 4, 6)
INSERT [dbo].[product_details] ([details_id], [product_id], [color_id], [size_id], [quantity]) VALUES (8, 1, 2, 4, 8)
SET IDENTITY_INSERT [dbo].[product_details] OFF
GO
SET IDENTITY_INSERT [dbo].[size] ON 

INSERT [dbo].[size] ([size_id], [name]) VALUES (1, N'38')
INSERT [dbo].[size] ([size_id], [name]) VALUES (2, N'39')
INSERT [dbo].[size] ([size_id], [name]) VALUES (3, N'40')
INSERT [dbo].[size] ([size_id], [name]) VALUES (4, N'41')
INSERT [dbo].[size] ([size_id], [name]) VALUES (5, N'42')
SET IDENTITY_INSERT [dbo].[size] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [name], [mobile], [address], [password], [email], [status], [role]) VALUES (1, N'Admin', N'0348512186', N'Ha Noi', N'123', N'toantthe170909@fpt.edu.vn', 1, 1)
INSERT [dbo].[user] ([user_id], [name], [mobile], [address], [password], [email], [status], [role]) VALUES (2, N'Nguyen Hai Minh', N'0344897266', N'Gia Lam', N'123', N'minhfpt17@fpt.edu.vn', 1, 2)
INSERT [dbo].[user] ([user_id], [name], [mobile], [address], [password], [email], [status], [role]) VALUES (3, N'Nguyen Huu Huy', N'0862031203', N'Xuan Phuong', N'123', N'huynhhe172669@fpt.edu.vn', 1, 3)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_user] FOREIGN KEY([customer_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_user]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_order]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_product]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_brand] FOREIGN KEY([cate_id])
REFERENCES [dbo].[brand] ([brand_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_brand]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_product_category] FOREIGN KEY([cate_id])
REFERENCES [dbo].[product_category] ([cate_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_product_category]
GO
ALTER TABLE [dbo].[product_details]  WITH CHECK ADD  CONSTRAINT [FK_product_details_color] FOREIGN KEY([color_id])
REFERENCES [dbo].[color] ([color_id])
GO
ALTER TABLE [dbo].[product_details] CHECK CONSTRAINT [FK_product_details_color]
GO
ALTER TABLE [dbo].[product_details]  WITH CHECK ADD  CONSTRAINT [FK_product_details_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[product_details] CHECK CONSTRAINT [FK_product_details_product]
GO
ALTER TABLE [dbo].[product_details]  WITH CHECK ADD  CONSTRAINT [FK_product_details_size] FOREIGN KEY([size_id])
REFERENCES [dbo].[size] ([size_id])
GO
ALTER TABLE [dbo].[product_details] CHECK CONSTRAINT [FK_product_details_size]
GO
USE [master]
GO
ALTER DATABASE [ShoesStore] SET  READ_WRITE 
GO
