USE [master]
GO
/****** Object:  Database [masterFloor]    Script Date: 13.11.2024 21:17:17 ******/
CREATE DATABASE [masterFloor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'masterFloor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\masterFloor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'masterFloor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\masterFloor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [masterFloor] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [masterFloor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [masterFloor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [masterFloor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [masterFloor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [masterFloor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [masterFloor] SET ARITHABORT OFF 
GO
ALTER DATABASE [masterFloor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [masterFloor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [masterFloor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [masterFloor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [masterFloor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [masterFloor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [masterFloor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [masterFloor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [masterFloor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [masterFloor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [masterFloor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [masterFloor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [masterFloor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [masterFloor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [masterFloor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [masterFloor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [masterFloor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [masterFloor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [masterFloor] SET  MULTI_USER 
GO
ALTER DATABASE [masterFloor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [masterFloor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [masterFloor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [masterFloor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [masterFloor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [masterFloor] SET QUERY_STORE = OFF
GO
USE [masterFloor]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Director]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Director](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[PatronymicName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Director] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indexes]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indexes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Indexes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LegalAdress]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LegalAdress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdIndexes] [int] NOT NULL,
	[IdArea] [int] NOT NULL,
	[IdCity] [int] NOT NULL,
	[IdStreet] [int] NOT NULL,
	[NumHouse] [nchar](30) NOT NULL,
 CONSTRAINT [PK_LegalAdress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material_type_import]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type_import](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeMaterial] [nvarchar](50) NOT NULL,
	[PercenMarriag] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_Material_type_import] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NamePartner]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamePartner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NamePartner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NameProduct]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_NameProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partner_products_import]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partner_products_import](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdNameProduct] [int] NOT NULL,
	[IdNamePartner] [int] NOT NULL,
	[CountOfProduct] [int] NOT NULL,
	[DataOfSale] [date] NOT NULL,
 CONSTRAINT [PK_partner_products_import] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partners_import]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partners_import](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTypePartner] [int] NOT NULL,
	[IdNamePartner] [int] NOT NULL,
	[IdDirector] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNum] [nvarchar](50) NOT NULL,
	[IdLegalAdress] [int] NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_partners_import] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_type_import]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_type_import](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTypeProduct] [int] NOT NULL,
	[CoefProduct] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_product_type_import] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products_import]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products_import](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTypeProduct] [int] NOT NULL,
	[IdNameProduct] [int] NOT NULL,
	[Articul] [nvarchar](50) NOT NULL,
	[MinCostForPartner] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_products_import] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePartner]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePartner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypePartner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeProduct]    Script Date: 13.11.2024 21:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([Id], [Name]) VALUES (1, N'Архангельская')
INSERT [dbo].[Area] ([Id], [Name]) VALUES (2, N'Белгородская')
INSERT [dbo].[Area] ([Id], [Name]) VALUES (3, N'Кемеровская')
INSERT [dbo].[Area] ([Id], [Name]) VALUES (4, N'Ленинградская')
INSERT [dbo].[Area] ([Id], [Name]) VALUES (5, N'Московская')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name]) VALUES (1, N'Приморск')
INSERT [dbo].[City] ([Id], [Name]) VALUES (2, N'Реутов')
INSERT [dbo].[City] ([Id], [Name]) VALUES (3, N'Северодвинск')
INSERT [dbo].[City] ([Id], [Name]) VALUES (4, N'Старый Оскол')
INSERT [dbo].[City] ([Id], [Name]) VALUES (5, N'Юрга')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Director] ON 

INSERT [dbo].[Director] ([Id], [LastName], [FirstName], [PatronymicName]) VALUES (1, N'Воробьева', N'Екатерина', N'Валерьевна')
INSERT [dbo].[Director] ([Id], [LastName], [FirstName], [PatronymicName]) VALUES (2, N'Иванова', N'Александра', N'Ивановна')
INSERT [dbo].[Director] ([Id], [LastName], [FirstName], [PatronymicName]) VALUES (3, N'Петров', N'Василий', N'Петрович')
INSERT [dbo].[Director] ([Id], [LastName], [FirstName], [PatronymicName]) VALUES (4, N'Соловьев', N'Андрей', N'Николаевич')
INSERT [dbo].[Director] ([Id], [LastName], [FirstName], [PatronymicName]) VALUES (5, N'Степанов', N'Степан', N'Сергеевич')
SET IDENTITY_INSERT [dbo].[Director] OFF
GO
SET IDENTITY_INSERT [dbo].[Indexes] ON 

INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (1, N'143960')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (2, N'164500')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (3, N'188910')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (4, N'309500')
INSERT [dbo].[Indexes] ([Id], [Name]) VALUES (5, N'652050')
SET IDENTITY_INSERT [dbo].[Indexes] OFF
GO
SET IDENTITY_INSERT [dbo].[LegalAdress] ON 

INSERT [dbo].[LegalAdress] ([Id], [IdIndexes], [IdArea], [IdCity], [IdStreet], [NumHouse]) VALUES (1, 5, 3, 5, 1, N'15                            ')
INSERT [dbo].[LegalAdress] ([Id], [IdIndexes], [IdArea], [IdCity], [IdStreet], [NumHouse]) VALUES (2, 2, 1, 3, 5, N'18                            ')
INSERT [dbo].[LegalAdress] ([Id], [IdIndexes], [IdArea], [IdCity], [IdStreet], [NumHouse]) VALUES (3, 3, 4, 1, 2, N'21                            ')
INSERT [dbo].[LegalAdress] ([Id], [IdIndexes], [IdArea], [IdCity], [IdStreet], [NumHouse]) VALUES (4, 1, 5, 2, 4, N'51                            ')
INSERT [dbo].[LegalAdress] ([Id], [IdIndexes], [IdArea], [IdCity], [IdStreet], [NumHouse]) VALUES (5, 4, 2, 4, 3, N'122                           ')
SET IDENTITY_INSERT [dbo].[LegalAdress] OFF
GO
SET IDENTITY_INSERT [dbo].[Material_type_import] ON 

INSERT [dbo].[Material_type_import] ([Id], [TypeMaterial], [PercenMarriag]) VALUES (1, N'Тип материала 1', CAST(0.00100 AS Decimal(18, 5)))
INSERT [dbo].[Material_type_import] ([Id], [TypeMaterial], [PercenMarriag]) VALUES (2, N'Тип материала 2', CAST(0.00950 AS Decimal(18, 5)))
INSERT [dbo].[Material_type_import] ([Id], [TypeMaterial], [PercenMarriag]) VALUES (3, N'Тип материала 3', CAST(0.00280 AS Decimal(18, 5)))
INSERT [dbo].[Material_type_import] ([Id], [TypeMaterial], [PercenMarriag]) VALUES (4, N'Тип материала 4', CAST(0.00550 AS Decimal(18, 5)))
INSERT [dbo].[Material_type_import] ([Id], [TypeMaterial], [PercenMarriag]) VALUES (5, N'Тип материала 5', CAST(0.00340 AS Decimal(18, 5)))
SET IDENTITY_INSERT [dbo].[Material_type_import] OFF
GO
SET IDENTITY_INSERT [dbo].[NamePartner] ON 

INSERT [dbo].[NamePartner] ([Id], [Name]) VALUES (1, N'База Строитель')
INSERT [dbo].[NamePartner] ([Id], [Name]) VALUES (2, N'МонтажПро')
INSERT [dbo].[NamePartner] ([Id], [Name]) VALUES (3, N'Паркет 29')
INSERT [dbo].[NamePartner] ([Id], [Name]) VALUES (4, N'Ремонт и отделка')
INSERT [dbo].[NamePartner] ([Id], [Name]) VALUES (5, N'Стройсервис')
SET IDENTITY_INSERT [dbo].[NamePartner] OFF
GO
SET IDENTITY_INSERT [dbo].[NameProduct] ON 

INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (1, N'Инженерная доска Дуб Французская елка однополосная 12 мм')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (2, N'Ламинат Дуб дымчато-белый 33 класс 12 мм')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (3, N'Ламинат Дуб серый 32 класс 8 мм с фаской')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (4, N'Паркетная доска Ясень темный однополосная 14 мм')
INSERT [dbo].[NameProduct] ([Id], [Name]) VALUES (5, N'Пробковое напольное клеевое покрытие 32 класс 4 мм')
SET IDENTITY_INSERT [dbo].[NameProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[partner_products_import] ON 

INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (1, 4, 1, 15500, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (2, 2, 1, 12350, CAST(N'2023-12-18' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (3, 3, 1, 37400, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (4, 1, 3, 35000, CAST(N'2022-12-02' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (5, 5, 3, 1250, CAST(N'2023-05-17' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (6, 2, 3, 1000, CAST(N'2024-06-07' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (7, 4, 3, 7550, CAST(N'2024-07-01' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (8, 4, 5, 7250, CAST(N'2023-01-22' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (9, 1, 5, 2500, CAST(N'2024-07-05' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (10, 3, 4, 59050, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (11, 2, 4, 37200, CAST(N'2024-03-12' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (13, 2, 2, 50000, CAST(N'2023-09-19' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (14, 3, 2, 670000, CAST(N'2023-11-10' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (15, 4, 2, 35000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[partner_products_import] ([Id], [IdNameProduct], [IdNamePartner], [CountOfProduct], [DataOfSale]) VALUES (16, 1, 2, 25000, CAST(N'2024-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[partner_products_import] OFF
GO
SET IDENTITY_INSERT [dbo].[partners_import] ON 

INSERT [dbo].[partners_import] ([Id], [IdTypePartner], [IdNamePartner], [IdDirector], [Email], [PhoneNum], [IdLegalAdress], [INN], [Rating]) VALUES (1, 1, 1, 2, N'aleksandraivanova@ml.ru', N'+7(493)-123-45-67', 5, N'2222455179', 7)
INSERT [dbo].[partners_import] ([Id], [IdTypePartner], [IdNamePartner], [IdDirector], [Email], [PhoneNum], [IdLegalAdress], [INN], [Rating]) VALUES (2, 3, 3, 3, N'vppetrov@vl.ru', N'+7(987)-123-56-78', 2, N'3333888520', 7)
INSERT [dbo].[partners_import] ([Id], [IdTypePartner], [IdNamePartner], [IdDirector], [Email], [PhoneNum], [IdLegalAdress], [INN], [Rating]) VALUES (3, 4, 5, 4, N'ansolovev@st.ru', N'+7(812)-223-32-00', 3, N'4440391035', 7)
INSERT [dbo].[partners_import] ([Id], [IdTypePartner], [IdNamePartner], [IdDirector], [Email], [PhoneNum], [IdLegalAdress], [INN], [Rating]) VALUES (4, 2, 4, 1, N'ekaterina.vorobeva@ml.ru', N'+7(444)-222-33-11', 1, N'1111520857', 5)
INSERT [dbo].[partners_import] ([Id], [IdTypePartner], [IdNamePartner], [IdDirector], [Email], [PhoneNum], [IdLegalAdress], [INN], [Rating]) VALUES (5, 1, 2, 5, N'stepanov@stepan.ru', N'+7(912)-888-33-33', 4, N'5552431140', 10)
SET IDENTITY_INSERT [dbo].[partners_import] OFF
GO
SET IDENTITY_INSERT [dbo].[product_type_import] ON 

INSERT [dbo].[product_type_import] ([Id], [IdTypeProduct], [CoefProduct]) VALUES (1, 1, CAST(2.35 AS Decimal(18, 2)))
INSERT [dbo].[product_type_import] ([Id], [IdTypeProduct], [CoefProduct]) VALUES (2, 2, CAST(5.15 AS Decimal(18, 2)))
INSERT [dbo].[product_type_import] ([Id], [IdTypeProduct], [CoefProduct]) VALUES (3, 3, CAST(4.34 AS Decimal(18, 2)))
INSERT [dbo].[product_type_import] ([Id], [IdTypeProduct], [CoefProduct]) VALUES (4, 4, CAST(1.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[product_type_import] OFF
GO
SET IDENTITY_INSERT [dbo].[products_import] ON 

INSERT [dbo].[products_import] ([Id], [IdTypeProduct], [IdNameProduct], [Articul], [MinCostForPartner]) VALUES (1, 3, 4, N'8758385', CAST(4456.90 AS Decimal(18, 2)))
INSERT [dbo].[products_import] ([Id], [IdTypeProduct], [IdNameProduct], [Articul], [MinCostForPartner]) VALUES (2, 3, 1, N'8858958', CAST(7330.99 AS Decimal(18, 2)))
INSERT [dbo].[products_import] ([Id], [IdTypeProduct], [IdNameProduct], [Articul], [MinCostForPartner]) VALUES (3, 1, 2, N'7750282', CAST(1799.33 AS Decimal(18, 2)))
INSERT [dbo].[products_import] ([Id], [IdTypeProduct], [IdNameProduct], [Articul], [MinCostForPartner]) VALUES (4, 1, 3, N'7028748', CAST(3890.41 AS Decimal(18, 2)))
INSERT [dbo].[products_import] ([Id], [IdTypeProduct], [IdNameProduct], [Articul], [MinCostForPartner]) VALUES (5, 4, 5, N'5012543', CAST(5450.59 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[products_import] OFF
GO
INSERT [dbo].[Street] ([Id], [Name]) VALUES (1, N'Лесная')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (2, N'Парковая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (3, N'Рабочая')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (4, N'Свободы')
INSERT [dbo].[Street] ([Id], [Name]) VALUES (5, N'Строителей')
GO
SET IDENTITY_INSERT [dbo].[TypePartner] ON 

INSERT [dbo].[TypePartner] ([Id], [Name]) VALUES (1, N'ЗАО')
INSERT [dbo].[TypePartner] ([Id], [Name]) VALUES (2, N'ОАО')
INSERT [dbo].[TypePartner] ([Id], [Name]) VALUES (3, N'ООО')
INSERT [dbo].[TypePartner] ([Id], [Name]) VALUES (4, N'ПАО')
SET IDENTITY_INSERT [dbo].[TypePartner] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeProduct] ON 

INSERT [dbo].[TypeProduct] ([Id], [Name]) VALUES (1, N'Ламинат')
INSERT [dbo].[TypeProduct] ([Id], [Name]) VALUES (2, N'Массивная доска')
INSERT [dbo].[TypeProduct] ([Id], [Name]) VALUES (3, N'Паркетная доска')
INSERT [dbo].[TypeProduct] ([Id], [Name]) VALUES (4, N'Пробковое покрытие')
SET IDENTITY_INSERT [dbo].[TypeProduct] OFF
GO
ALTER TABLE [dbo].[LegalAdress]  WITH CHECK ADD  CONSTRAINT [FK_LegalAdress_Area] FOREIGN KEY([IdArea])
REFERENCES [dbo].[Area] ([Id])
GO
ALTER TABLE [dbo].[LegalAdress] CHECK CONSTRAINT [FK_LegalAdress_Area]
GO
ALTER TABLE [dbo].[LegalAdress]  WITH CHECK ADD  CONSTRAINT [FK_LegalAdress_City] FOREIGN KEY([IdCity])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[LegalAdress] CHECK CONSTRAINT [FK_LegalAdress_City]
GO
ALTER TABLE [dbo].[LegalAdress]  WITH CHECK ADD  CONSTRAINT [FK_LegalAdress_Indexes] FOREIGN KEY([IdIndexes])
REFERENCES [dbo].[Indexes] ([Id])
GO
ALTER TABLE [dbo].[LegalAdress] CHECK CONSTRAINT [FK_LegalAdress_Indexes]
GO
ALTER TABLE [dbo].[LegalAdress]  WITH CHECK ADD  CONSTRAINT [FK_LegalAdress_Street] FOREIGN KEY([IdStreet])
REFERENCES [dbo].[Street] ([Id])
GO
ALTER TABLE [dbo].[LegalAdress] CHECK CONSTRAINT [FK_LegalAdress_Street]
GO
ALTER TABLE [dbo].[partner_products_import]  WITH CHECK ADD  CONSTRAINT [FK_partner_products_import_NamePartner] FOREIGN KEY([IdNamePartner])
REFERENCES [dbo].[NamePartner] ([Id])
GO
ALTER TABLE [dbo].[partner_products_import] CHECK CONSTRAINT [FK_partner_products_import_NamePartner]
GO
ALTER TABLE [dbo].[partner_products_import]  WITH CHECK ADD  CONSTRAINT [FK_partner_products_import_NameProduct] FOREIGN KEY([IdNameProduct])
REFERENCES [dbo].[NameProduct] ([Id])
GO
ALTER TABLE [dbo].[partner_products_import] CHECK CONSTRAINT [FK_partner_products_import_NameProduct]
GO
ALTER TABLE [dbo].[partners_import]  WITH CHECK ADD  CONSTRAINT [FK_partners_import_Director] FOREIGN KEY([IdDirector])
REFERENCES [dbo].[Director] ([Id])
GO
ALTER TABLE [dbo].[partners_import] CHECK CONSTRAINT [FK_partners_import_Director]
GO
ALTER TABLE [dbo].[partners_import]  WITH CHECK ADD  CONSTRAINT [FK_partners_import_LegalAdress] FOREIGN KEY([IdLegalAdress])
REFERENCES [dbo].[LegalAdress] ([Id])
GO
ALTER TABLE [dbo].[partners_import] CHECK CONSTRAINT [FK_partners_import_LegalAdress]
GO
ALTER TABLE [dbo].[partners_import]  WITH CHECK ADD  CONSTRAINT [FK_partners_import_NamePartner] FOREIGN KEY([IdNamePartner])
REFERENCES [dbo].[NamePartner] ([Id])
GO
ALTER TABLE [dbo].[partners_import] CHECK CONSTRAINT [FK_partners_import_NamePartner]
GO
ALTER TABLE [dbo].[partners_import]  WITH CHECK ADD  CONSTRAINT [FK_partners_import_TypePartner] FOREIGN KEY([IdTypePartner])
REFERENCES [dbo].[TypePartner] ([Id])
GO
ALTER TABLE [dbo].[partners_import] CHECK CONSTRAINT [FK_partners_import_TypePartner]
GO
ALTER TABLE [dbo].[product_type_import]  WITH CHECK ADD  CONSTRAINT [FK_product_type_import_TypeProduct] FOREIGN KEY([IdTypeProduct])
REFERENCES [dbo].[TypeProduct] ([Id])
GO
ALTER TABLE [dbo].[product_type_import] CHECK CONSTRAINT [FK_product_type_import_TypeProduct]
GO
ALTER TABLE [dbo].[products_import]  WITH CHECK ADD  CONSTRAINT [FK_products_import_NameProduct] FOREIGN KEY([IdNameProduct])
REFERENCES [dbo].[NameProduct] ([Id])
GO
ALTER TABLE [dbo].[products_import] CHECK CONSTRAINT [FK_products_import_NameProduct]
GO
ALTER TABLE [dbo].[products_import]  WITH CHECK ADD  CONSTRAINT [FK_products_import_TypeProduct] FOREIGN KEY([IdTypeProduct])
REFERENCES [dbo].[TypeProduct] ([Id])
GO
ALTER TABLE [dbo].[products_import] CHECK CONSTRAINT [FK_products_import_TypeProduct]
GO
USE [master]
GO
ALTER DATABASE [masterFloor] SET  READ_WRITE 
GO
