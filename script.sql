USE [master]
GO
/****** Object:  Database [ApparelStore]    Script Date: 11/6/2018 3:37:48 PM ******/
CREATE DATABASE [ApparelStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Apparel Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Apparel Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Apparel Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Apparel Store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ApparelStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ApparelStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ApparelStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ApparelStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ApparelStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ApparelStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ApparelStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ApparelStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ApparelStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ApparelStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ApparelStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ApparelStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ApparelStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ApparelStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ApparelStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ApparelStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ApparelStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ApparelStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ApparelStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ApparelStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ApparelStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ApparelStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ApparelStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ApparelStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ApparelStore] SET RECOVERY FULL 
GO
ALTER DATABASE [ApparelStore] SET  MULTI_USER 
GO
ALTER DATABASE [ApparelStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ApparelStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ApparelStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ApparelStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ApparelStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ApparelStore', N'ON'
GO
ALTER DATABASE [ApparelStore] SET QUERY_STORE = OFF
GO
USE [ApparelStore]
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
USE [ApparelStore]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/6/2018 3:37:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/6/2018 3:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(100,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Phone] [bigint] NULL,
	[Email] [varchar](30) NULL,
	[Password] [varchar](20) NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK__Customer__A4AE64D8DDFC6B30] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/6/2018 3:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NULL,
	[TotalAmount] [money] NULL,
	[CustomerId] [int] NULL,
	[DeliveryDate] [date] NULL,
	[DeliveryAddress] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/6/2018 3:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[OrderId] [int] NULL,
	[Method] [varchar](50) NULL,
	[PaymentDate] [date] NULL,
	[InvoiceNo] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/6/2018 3:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](20) NULL,
	[Price] [money] NULL,
	[CategoryId] [int] NULL,
	[SubCategoryId] [int] NULL,
	[Quantity] [int] NULL,
	[ReorderLevel] [int] NULL,
	[Description] [text] NULL,
	[productImage] [varchar](max) NULL,
 CONSTRAINT [PK__Product__B40CC6CD903FA530] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOrderDetails]    Script Date: 11/6/2018 3:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOrderDetails](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 11/6/2018 3:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurOrdId] [int] IDENTITY(101,1) NOT NULL,
	[PurOrdDate] [date] NULL,
	[CategoryId] [int] NULL,
	[SubCategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PurOrdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseOrderDetails]    Script Date: 11/6/2018 3:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetails](
	[PurOrdId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_PurchaseOrderDetails] PRIMARY KEY CLUSTERED 
(
	[PurOrdId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 11/6/2018 3:37:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [varchar](20) NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (62, N'Men')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (63, N'Women')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (64, N'Kids')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (100, N'Bhumika', 12345, N'sad@sad.com', N'1234', N'delhi-11')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (101, N'Ajay', 9876543210, N'Ajay@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (102, N'Akshay', 9898765431, N'akshay@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (103, N'Charu', 9898090965, N'Charu@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (104, N'Sia', 9807654321, N'Sia@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (105, N'Dia', 9807453216, N'Dia@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (106, N'Gaurav', 9804563217, N'Gaurav@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (107, N'Isha', 9865470321, N'Isha@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (108, N'Ishan', 9800764352, N'Ishan@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (109, N'Jay', 9854321706, N'Jay@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (110, N'Jaya', 9876053214, N'Jaya@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (111, N'Lata', 9876435621, N'Lata@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (112, N'Misha', 9876985476, N'Misha@gmail.com', N'1234', NULL)
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (113, N'Prinka', 12345, N'Prinka@gmail.com', N'1234', N'Rohini')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (114, N'Nikhil', 123456, N'Nikhil@gmail.com', N'1234', N'Delhi-54')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (118, N'Ram', 6543, N'book1@book.com', N'123', N'delhi-87')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (119, N'Ram', 6543, N'123Nikhil@gmail.com', N'123', N'delhi-87')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (120, N'Ram', 6543, N'book11@book.com', N'123', N'delhi-87')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (121, N'Ram', 6543, N'book151@book.com', N'123', N'delhi-87')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (122, N'Ram', 6543, N'Vidushi@gmail.com', N'123', N'delhi-87')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (123, N'Ram', 98765, N'Ram@gmail.com', N'1234', N'Delhi')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (124, N'Shyam', 3467789, N'Shyam@gmail.com', N'1234', N'Delhi')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (125, N'Ram', 6543, N'book1591@book.com', N'123', N'delhi-87')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (126, N'Bhum', 1234567890, N'zoya1994@gmail.com', N'1234', N'Rohini')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Phone], [Email], [Password], [Address]) VALUES (127, N'Bhum', 1234567890, N'zoya1994@gmail.com', N'1234', N'Rohini')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [OrderDate], [TotalAmount], [CustomerId], [DeliveryDate], [DeliveryAddress]) VALUES (1, CAST(N'2018-09-03' AS Date), 2000.0000, 101, CAST(N'2018-09-08' AS Date), N'Pitampura')
INSERT [dbo].[Orders] ([OrderId], [OrderDate], [TotalAmount], [CustomerId], [DeliveryDate], [DeliveryAddress]) VALUES (2, CAST(N'2018-11-09' AS Date), 2400.0000, 102, CAST(N'2018-11-09' AS Date), N'Rohini')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (106, N'Shirt', 2000.0000, 62, 62, 100, 20, N'Cotton Shirt', N'data:image/jpeg;base64,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')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (107, N'T-Shirt', 5000.0000, 62, 62, 100, 20, N'Cotton Shirt.', N'data:image/jpeg;base64,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')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (108, N'Casual Shirt', 1199.0000, 62, 62, 250, 25, N'Blue Regular Fit Printed Casual Shirt', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productimage/2018/6/5/bda2860f-da83-407c-a623-e3eaab75f24b1528185987822-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (109, N'Kurta', 1299.0000, 62, 62, 250, 20, N'Blue Solid Kurta', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/5/2/11525256811994-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (110, N'Sweater', 1199.0000, 62, 62, 450, 30, N'Grey Striped V Neck Sweater', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/7/6/58e81c80-1e29-4fff-b64d-2d5a649383b81530820888836-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (111, N'Sweater', 1199.0000, 62, 62, 450, 30, N'Navy Blue Striped V Neck Sweater', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/7/5/f98644f3-5818-4833-ac8f-8b99f81445ed1530810257723-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (112, N'Jeans', 1899.0000, 62, 63, 500, 50, N'Blue Skinny Fit Mid-Rise Clean Look Stretchable Jeans', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productimage/2018/9/17/c0c6c807-fb1a-4b21-be75-c511b3e9c5911537191844127-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (113, N'Jeans', 1999.0000, 62, 63, 400, 30, N'Blue Slim Fit Mid-Rise Mildly Distressed Stretchable Jeans', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productimage/2018/8/30/89ae419a-91cd-454d-ade7-d8d062b755ad1535630350189-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (114, N'Shorts', 899.0000, 62, 63, 300, 25, N'Core- Running Black Shorts', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/5/9/a1bcaaed-d999-4bed-968a-55312acd172a1525883160710-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (115, N'Blazer', 6999.0000, 62, 62, 100, 10, N'Black Printed Blazer
', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/4/30/11525028496941-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (116, N'Joggers', 1299.0000, 62, 63, 250, 15, N'Grey Melange Slim Fit Joggers', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productimage/2018/6/18/3491b880-ea1d-4c12-ae13-fffdd91238d01529333056619-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (117, N'Shoes', 5999.0000, 62, 64, 100, 10, N'Grey Running Shoes
', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/6864793/2018/8/16/fc515974-89c0-4a0a-97a9-f4c6dfda48831534422086344-Grey-Running-Shoes-5541534422085451-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (118, N'Slippers', 1495.0000, 62, 64, 150, 20, N'Chroma Thong 5 Beige Slippers', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/5/3/11525330784700-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (119, N'Football Shoes', 13999.0000, 62, 64, 50, 10, N'Orange Ace 17.1 FG Mid-Top Football Shoes', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/5/11/7c245b23-0cda-4a01-bc7f-73e4830b3f3a1525981191742-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (120, N'Analogue Watch', 13899.0000, 62, 66, 100, 5, N'Blue/White Canvas Analogue Watch', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/7013719/2018/8/2/4a9a3243-2aec-47b2-b553-7de9467ae46c1533216589215-BlueWhite-Canvas-Analogue-Watch-7941533216588163-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (121, N'Smart Watch ', 21995.0000, 62, 66, 50, 5, N'Silver-Toned Q Exploris Touchscreen Smart Watch ', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/7/6/03e81a6a-3c23-47f8-9535-2627ea52abe61530817890521-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (122, N'Watch', 9495.0000, 62, 66, 100, 25, N'Brown/Grey Chronograph Watch', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/6799036/2018/7/23/21f0342a-9f5b-4b9a-b9c5-46863d64319c1532361111146-Fossil-Nude-Analogue-Watch-5791532361110292-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (123, N'Duffel Bag', 3999.0000, 62, 67, 100, 20, N'3S Per Tb Black Duffel Bag', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/4/9/11523264938482-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (124, N'Laptop Bag', 12749.0000, 62, 67, 50, 10, N'Brown Leather Laptop Bag', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/3/3/11520024567634-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (125, N'Sling Bag
', 9495.0000, 62, 67, 100, 50, N'Brown Leather Sling Bag', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/7102893/2018/8/28/3ebbdc83-abff-43aa-ad5e-ff374c65fdd71535469202100-Brown-Leather-Sling-Bag-9021535469201521-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (126, N'Handkerchief', 599.0000, 62, 71, 250, 10, N'Pack Of 6 Multicoloured Colored Handkerchief', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/4/19/11524096762847-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (127, N'Belt', 1899.0000, 62, 71, 250, 25, N'Brown Leather Belt', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/6407392/2018/7/20/236b321b-487c-4b2d-bfaf-6f02b12d6f951532095218442-Brown-Leather-Belt-9831532095218100-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (128, N'Tie', 1499.0000, 62, 71, 400, 35, N'White & Blue Temple Striped Broad Tie
', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productimage/2018/6/16/cf38da71-493c-4d48-9abb-0220295821241529091068397-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (129, N'Top', 1099.0000, 63, 72, 300, 20, N'White Self Design Blouse', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/6669822/2018/9/19/6865ec79-7789-4915-9b3a-6c7d78ab5f5d1537365871891-White-Self-Design-Blouse-8861537365870259-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (130, N'Kurta', 1699.0000, 63, 78, 150, 10, N'White Printed Straight Kurta', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productimage/2018/8/14/ccb3be70-a954-48a6-a3ca-accc03e80c211534254128235-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (131, N'Peplum Top', 1499.0000, 63, 72, 150, 10, N'Blue Printed Peplum Top', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productimage/2018/8/28/674a94da-6119-4ec6-8466-db53f23be1561535440960100-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (132, N'Maxi Dress', 1908.0000, 63, 72, 100, 20, N'Green Embellished Maxi Dress', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/7204692/2018/8/24/0f1ac82b-27c6-489a-831a-9a1e9696bf601535096840886-a-3371535096840370-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (133, N'High Low Tunic', 1699.0000, 63, 72, 200, 40, N'Cotton Volume High Low Tunic And Patch Embroidery Detail', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/5290415/2018/7/19/75ed8cde-40b6-47ed-8e1c-3c8dcc58977c1532018492273-Cotton-Volume-Shirt-Dress-With-High-Low-Hem-And-Patch-Embroi-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (134, N'Cropped Jeans', 1499.0000, 63, 73, 250, 30, N'Blue Skinny Fit Mid-Rise Clean Look Stretchable Cropped Jeans', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productimage/2018/8/21/0a767a71-15c3-431e-b0b7-dba5690819da1534853784709-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (135, N'Pants', 1299.0000, 63, 73, 300, 15, N'Cream Solid Coloured Pants', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productImage/2018/4/2/11522635392688-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (136, N'Palazzo', 1999.0000, 63, 73, 250, 10, N'Off White Solid Regular Fit Palazzo', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productimage/2018/7/17/08c09258-bf5b-493a-a49b-512ba6c28b711531836221341-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (137, N'Trousers', 1999.0000, 63, 73, 400, 20, N'Charcoal Solid Trousers', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/6604828/2018/5/31/b8b4f0f8-d75b-4d98-abbd-911a89f388f81527738669009-Charcoal-Grey-Solid-Denim-Parallel-Trousers-6991527738667575-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (138, N'Dress', 1299.0000, 64, 80, 500, 20, N'
Light Blue Casual Dress
', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/5289022/2018/7/17/d44752a7-3b05-4b79-ae9b-bfde247906771531812553992-Light-Blue-Casual-Dress-161531812553378-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (139, N'Loafers', 2499.0000, 63, 74, 350, 20, N'Beige Loafers
', N'https://assets.jassets.com/h_600,q_95,w_440/v1/assets/images/productimage/2018/7/23/f8c9ceec-595b-421e-b974-eae5bdd8ef8d1532347271120-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (140, N'Party Dress', 1699.0000, 64, 80, 100, 30, N'Red Checked Party Dress', N'https://assets.jassets.com/h_600,q_95,w_440/v1/assets/images/7289832/2018/9/8/8ea8ab34-adb8-48d3-ab37-0d7549abe54d1536410518863-Red-Checked-Party-Dresse-4521536410518356-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (141, N'Jumpsuit', 1499.0000, 64, 80, 36, 40, N'Pink Jumpsuit', N'https://assets.jassets.com/h_600,q_95,w_440/v1/assets/images/productImage/2018/3/4/11520127010828-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (142, N'Blue Jeans', 1599.0000, 64, 81, 45, 10, N'Gini and Jony
Navy Blue Jeans', N'https://assets.jassets.com/h_600,q_95,w_440/v1/assets/images/productImage/2018/6/2/f829ef26-1cdc-4c6c-acc1-20705c4cc8541527940529891-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (143, N'Regular Fit Jeans', 1499.0000, 64, 81, 60, 20, N'Gini and Jony
Blue Regular Fit Jeans', N'https://assets.jassets.com/h_600,q_95,w_440/v1/assets/images/productImage/2018/6/2/f829ef26-1cdc-4c6c-acc1-20705c4cc8541527940529891-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (144, N'Pink Trouser', 1499.0000, 64, 81, 70, 15, N'United Colors of Benetton
Pink Trouser
', N'https://assets.jassets.com/h_600,q_95,w_440/v1/assets/images/productImage/2018/3/4/11520144450538-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (145, N'Leather Analog Watch', 11799.0000, 64, 82, 50, 30, N'Daniel Wellington
Brown/White Leather Analog Watch', N'https://assets.jassets.com/h_600,q_95,w_440/v1/assets/images/productImage/2018/5/2/11525270510459-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (148, N'Swiss Dial Watch', 11450.0000, 64, 82, 60, 14, N'Wenger
Black Swiss Dial Watch 01.1041.136', N'https://assets.jassets.com/h_600,q_95,w_440/v1/assets/images/productimage/2018/9/12/58bcc21b-83f9-4881-bab3-ca24c92e4fb21536763182149-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (149, N'Blue Analog Watch', 11900.0000, 64, 82, 70, 30, N'GUESS
W0407g2 Blue/Blue Analog Watch', N'https://assets.jassets.com/h_600,q_95,w_440/v1/assets/images/productImage/2018/5/9/6089cd3c-ff02-462e-8a0b-33bf0ea9ee9c1525876310677-1.webp')
INSERT [dbo].[Product] ([ProductId], [Title], [Price], [CategoryId], [SubCategoryId], [Quantity], [ReorderLevel], [Description], [productImage]) VALUES (1104, N'Test Product 123', 1200.0000, 63, 72, 123, 12, N'Testing Add Product', N'https://assets.jassets.com/w_248,h_338,q_80/assets/images/productimage/2018/9/12/f8518397-043b-4f1e-8cfc-ccc8f8d4b4861536763685176-1.webp')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (62, 62, N'TopWear(Men)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (62, 63, N'BottomWear(Men)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (62, 64, N'Footwear(Men)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (62, 66, N'Watches (Men)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (62, 67, N'Bags(Men)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (62, 71, N'Accessories(Men)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (63, 72, N'TopWear(Women)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (63, 73, N'BottomWear(Women)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (63, 74, N'FootWear(Women)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (63, 75, N'Watches(Women) ')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (63, 76, N'Bags(Women)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (63, 77, N'Accessories(Women)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (63, 78, N'Ethnic(Women)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (62, 79, N'Ethnic(Men)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (64, 80, N'TopWear(Kids)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (64, 81, N'BottomWear(Kids)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (64, 82, N'Watches(Kids)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (64, 83, N'Bags(Kids)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (64, 84, N'Accessories(Kids)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (64, 85, N'Ethnic(Kids)')
INSERT [dbo].[SubCategory] ([CategoryId], [SubCategoryId], [SubCategoryName]) VALUES (62, 1067, N'Test123')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__Customer__440B1D61] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__Customer__440B1D61]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Categor__403A8C7D] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Categor__403A8C7D]
GO
ALTER TABLE [dbo].[ProductOrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[ProductOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__ProductOr__Produ__4D94879B] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductOrderDetails] CHECK CONSTRAINT [FK__ProductOr__Produ__4D94879B]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__PurchaseO__Produ__6E01572D] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK__PurchaseO__Produ__6E01572D]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__PurchaseO__PurOr__6D0D32F4] FOREIGN KEY([PurOrdId])
REFERENCES [dbo].[PurchaseOrder] ([PurOrdId])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK__PurchaseO__PurOr__6D0D32F4]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK__SubCatego__Categ__3D5E1FD2] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK__SubCatego__Categ__3D5E1FD2]
GO
USE [master]
GO
ALTER DATABASE [ApparelStore] SET  READ_WRITE 
GO
