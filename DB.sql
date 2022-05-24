USE [master]
GO
/****** Object:  Database [SiangShop]    Script Date: 08/11/2562 10:23:18 ******/
CREATE DATABASE [SiangShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SiangShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SiangShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SiangShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SiangShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SiangShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SiangShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SiangShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SiangShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SiangShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SiangShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SiangShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [SiangShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SiangShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SiangShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SiangShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SiangShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SiangShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SiangShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SiangShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SiangShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SiangShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SiangShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SiangShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SiangShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SiangShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SiangShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SiangShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SiangShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SiangShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SiangShop] SET  MULTI_USER 
GO
ALTER DATABASE [SiangShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SiangShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SiangShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SiangShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SiangShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SiangShop] SET QUERY_STORE = OFF
GO
USE [SiangShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [SiangShop]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[billID] [varchar](12) NOT NULL,
	[saleID] [varchar](10) NULL,
	[paymentType] [int] NULL,
	[amount] [decimal](8, 2) NULL,
	[customerID] [varchar](5) NULL,
	[userID] [varchar](50) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[billID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brandID] [varchar](5) NOT NULL,
	[brandName] [varchar](50) NULL,
	[categoryID] [varchar](5) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [varchar](5) NOT NULL,
	[categoryName] [varchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cheque]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheque](
	[checkID] [varchar](12) NOT NULL,
	[checkName] [varchar](100) NULL,
	[branch] [varchar](100) NULL,
	[userID] [varchar](50) NULL,
	[billID] [varchar](12) NULL,
 CONSTRAINT [PK_Cheque] PRIMARY KEY CLUSTERED 
(
	[checkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [varchar](5) NOT NULL,
	[name] [varchar](100) NULL,
	[lastname] [varchar](100) NULL,
	[address] [varchar](max) NULL,
	[district] [varchar](100) NULL,
	[amphur] [varchar](100) NULL,
	[province] [varchar](6) NULL,
	[zipcode] [varchar](5) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeepProduct]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeepProduct](
	[keepProductID] [varchar](11) NOT NULL,
	[totalPrice] [decimal](8, 2) NULL,
	[datekeep] [datetime] NULL,
	[supplierID] [varchar](5) NULL,
	[userID] [varchar](50) NULL,
 CONSTRAINT [PK_KeepProduct] PRIMARY KEY CLUSTERED 
(
	[keepProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeepProductDetail]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeepProductDetail](
	[keepProductDetailID] [varchar](11) NOT NULL,
	[keepProductID] [varchar](11) NULL,
	[productID] [varchar](7) NULL,
	[amount] [int] NULL,
	[capitalPrice] [decimal](8, 2) NULL,
 CONSTRAINT [PK_KeepProductDetail] PRIMARY KEY CLUSTERED 
(
	[keepProductDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [varchar](7) NOT NULL,
	[productName] [varchar](50) NULL,
	[amount] [int] NULL,
	[barcode] [varchar](15) NULL,
	[categoryID] [varchar](5) NULL,
	[brandID] [varchar](5) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[purchaseID] [varchar](11) NOT NULL,
	[totalPrice] [decimal](8, 2) NULL,
	[datePurchase] [datetime] NULL,
	[supplierID] [varchar](5) NULL,
	[userID] [varchar](50) NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[purchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetail]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetail](
	[purchaseDetailID] [varchar](11) NOT NULL,
	[purchaseID] [varchar](11) NULL,
	[productID] [varchar](7) NULL,
	[amount] [int] NULL,
	[capitalPrice] [decimal](8, 2) NULL,
 CONSTRAINT [PK_PurchaseDetail] PRIMARY KEY CLUSTERED 
(
	[purchaseDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[saleID] [varchar](10) NOT NULL,
	[totalPrice] [decimal](8, 2) NULL,
	[dateSale] [datetime] NULL,
	[userID] [varchar](50) NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[saleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleDeatil]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDeatil](
	[saleDeatilID] [varchar](11) NOT NULL,
	[saleID] [varchar](10) NULL,
	[productID] [varchar](7) NULL,
	[amount] [int] NULL,
 CONSTRAINT [PK_SaleDeatil] PRIMARY KEY CLUSTERED 
(
	[saleDeatilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplierID] [varchar](5) NOT NULL,
	[supplierName] [varchar](50) NULL,
	[telephone] [varchar](10) NULL,
	[address] [varchar](max) NULL,
	[district] [varchar](100) NULL,
	[amphur] [varchar](100) NULL,
	[province] [varchar](6) NULL,
	[zipcode] [varchar](5) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08/11/2562 10:23:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userID] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[district] [varchar](100) NULL,
	[amphur] [varchar](100) NULL,
	[province] [varchar](100) NULL,
	[zipcode] [varchar](5) NULL,
	[role] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Brand] ([brandID], [brandName], [categoryID], [status]) VALUES (N'00001', N'เปา', N'00001', 0)
GO
INSERT [dbo].[Brand] ([brandID], [brandName], [categoryID], [status]) VALUES (N'00002', N'ไซไลต์', N'00002', 0)
GO
INSERT [dbo].[Brand] ([brandID], [brandName], [categoryID], [status]) VALUES (N'00003', N'ไลปอนเอฟ', N'00002', 1)
GO
INSERT [dbo].[Brand] ([brandID], [brandName], [categoryID], [status]) VALUES (N'00004', N'เปา', N'00003', 0)
GO
INSERT [dbo].[Brand] ([brandID], [brandName], [categoryID], [status]) VALUES (N'00005', N'น้ำยาล้างจาน', N'00003', 0)
GO
INSERT [dbo].[Brand] ([brandID], [brandName], [categoryID], [status]) VALUES (N'00006', N'เปา', N'00002', 0)
GO
INSERT [dbo].[Brand] ([brandID], [brandName], [categoryID], [status]) VALUES (N'00007', N'น้ำยาล้างจาน', N'00004', 0)
GO
INSERT [dbo].[Brand] ([brandID], [brandName], [categoryID], [status]) VALUES (N'00008', N'ไลปอนเอฟ', N'00008', 0)
GO
INSERT [dbo].[Brand] ([brandID], [brandName], [categoryID], [status]) VALUES (N'00009', N'คริสตัล', N'00027', 1)
GO
INSERT [dbo].[Brand] ([brandID], [brandName], [categoryID], [status]) VALUES (N'00010', N'เปปซี่', N'00028', 1)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00001', N'น้ำยาล้างจาน', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00002', N'น้ำยาล้างจาน', 1)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00003', N'แป้ง', 1)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00004', N'น้ำยาถูพื้น', 1)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00005', N'น้ำมัน', 1)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00006', N'32132', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00007', N'32132', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00008', N'ข้าวสาร', 1)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00009', N'000', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00010', N'น้ำยาเช็ดกระจก', 1)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00011', N'132132', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00012', N'น้ำยาล้างจาน', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00013', N'น้ำยาล้างจาน', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00014', N'การอ่าน', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00015', N'132132', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00016', N'32132', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00017', N'น้ำยาล้างจาน22', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00018', N'น้ำยาล้างจาน', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00019', N'น้ำยาล้างจาน22', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00020', N'น้ำยาล้างจาน', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00021', N'น้ำยาล้างจาน', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00022', N'น้ำยาล้างจาน', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00023', N'น้ำยาล้างจาน22', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00024', N'กกก', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00025', N'น้ำยาล้างจาน22', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00026', N'489894', 0)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00027', N'น้ำดื่ม', 1)
GO
INSERT [dbo].[Category] ([categoryID], [categoryName], [status]) VALUES (N'00028', N'น้ำอัดลม', 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'nuknik', N'781e5e245d69b566979b86e28d23f2c7', N'สุวัจณีย์', N'ไม้หอม', N'124', N'โคกคราม', N'บางปลาม้า', N'สุพรรณบุรี', N'72150', 2, 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taeso77', N'781e5e245d69b566979b86e28d23f2c7', N'โสฬส25 เจริญสินชัย', N'เจริญสินชัย', N'170 หมู่ 4', N'นกออก', N'ปักธงชัย', N'นครราชสีมา', N'30150', 1, 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree', N'781e5e245d69b566979b86e28d23f2c7', N'โสฬส', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 2, 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree261', N'781e5e245d69b566979b86e28d23f2c7', N'โสฬส21', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 1, 0)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree2751969', N'12345', N'โสฬส22', N'เจริญสินชัย', N'170 หมู่ 4', N'นครชุม', N'นครไทย', N'พิษณุโลก', N'65120', 2, 0)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree2812910', N'12345', N'โสฬส23', N'เจริญสินชัย', N'170 หมู่ 4', N'นกออก', N'ปักธงชัย', N'นครราชสีมา', N'30150', 2, 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree2833532', N'12345', N'โสฬส24', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 2, 0)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree28349', N'12345', N'โสฬส25', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 2, 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree56849430', N'12345', N'โสฬส46', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 2, 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree9398430', N'12345', N'โสฬส', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 1, 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree9674718', N'12345', N'โสฬส', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 1, 0)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree9711150', N'12345', N'โสฬส', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 1, 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree9731810', N'12345', N'โสฬส', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 1, 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree97749227', N'12345', N'โสฬส', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 1, 0)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree9820230', N'12345', N'โสฬส', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 1, 0)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'taesofree9913216', N'12345', N'โสฬส', N'เจริญสินชัย', N'170 หมู่ 4', N'สิงห์', N'ไทรโยค', N'กาญจนบุรี', N'71150', 2, 1)
GO
INSERT [dbo].[User] ([userID], [password], [name], [lastname], [address], [district], [amphur], [province], [zipcode], [role], [status]) VALUES (N'ทดสอบ', N'0123456789', N'ทดสอบ', N'ทดสอบ', N'710', N'บัวขาว', N'กุฉินารายณ์', N'กาฬสินธุ์', N'46110', 2, 1)
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Customer]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Sale] FOREIGN KEY([saleID])
REFERENCES [dbo].[Sale] ([saleID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Sale]
GO
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [FK_Brand_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [FK_Brand_Category]
GO
ALTER TABLE [dbo].[Cheque]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_Bill] FOREIGN KEY([billID])
REFERENCES [dbo].[Bill] ([billID])
GO
ALTER TABLE [dbo].[Cheque] CHECK CONSTRAINT [FK_Cheque_Bill]
GO
ALTER TABLE [dbo].[Cheque]  WITH CHECK ADD  CONSTRAINT [FK_Cheque_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Cheque] CHECK CONSTRAINT [FK_Cheque_User]
GO
ALTER TABLE [dbo].[KeepProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_KeepProductDetail_KeepProduct] FOREIGN KEY([keepProductID])
REFERENCES [dbo].[KeepProduct] ([keepProductID])
GO
ALTER TABLE [dbo].[KeepProductDetail] CHECK CONSTRAINT [FK_KeepProductDetail_KeepProduct]
GO
ALTER TABLE [dbo].[KeepProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_KeepProductDetail_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[KeepProductDetail] CHECK CONSTRAINT [FK_KeepProductDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brandID])
REFERENCES [dbo].[Brand] ([brandID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Supplier] FOREIGN KEY([supplierID])
REFERENCES [dbo].[Supplier] ([supplierID])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Supplier]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_User]
GO
ALTER TABLE [dbo].[PurchaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetail_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[PurchaseDetail] CHECK CONSTRAINT [FK_PurchaseDetail_Product]
GO
ALTER TABLE [dbo].[PurchaseDetail]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetail_Purchase] FOREIGN KEY([purchaseID])
REFERENCES [dbo].[Purchase] ([purchaseID])
GO
ALTER TABLE [dbo].[PurchaseDetail] CHECK CONSTRAINT [FK_PurchaseDetail_Purchase]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_User]
GO
ALTER TABLE [dbo].[SaleDeatil]  WITH CHECK ADD  CONSTRAINT [FK_SaleDeatil_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[SaleDeatil] CHECK CONSTRAINT [FK_SaleDeatil_Product]
GO
ALTER TABLE [dbo].[SaleDeatil]  WITH CHECK ADD  CONSTRAINT [FK_SaleDeatil_Sale] FOREIGN KEY([saleID])
REFERENCES [dbo].[Sale] ([saleID])
GO
ALTER TABLE [dbo].[SaleDeatil] CHECK CONSTRAINT [FK_SaleDeatil_Sale]
GO
USE [master]
GO
ALTER DATABASE [SiangShop] SET  READ_WRITE 
GO
