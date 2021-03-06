USE [MoneyInEveryHome]
GO
/****** Object:  Table [dbo].[BackAccount]    Script Date: 09.03.2022 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackAccount](
	[NumberAccount] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[DateOpen] [date] NOT NULL,
	[Balance] [money] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_BackAccount] PRIMARY KEY CLUSTERED 
(
	[NumberAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 09.03.2022 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[IDContract] [int] NOT NULL,
	[NumberAccount] [int] NOT NULL,
	[IDUser] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Period] [nchar](10) NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[Percet] [time](2) NOT NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[IDContract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 09.03.2022 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[IDOperation] [int] NOT NULL,
	[NameOperation] [nvarchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Amount] [int] NOT NULL,
	[Account] [int] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[IDOperation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 09.03.2022 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[IDType] [int] NOT NULL,
	[NameType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[IDType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09.03.2022 11:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Series] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Phone] [nchar](30) NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DateOfIssue] [date] NOT NULL,
	[Issued] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PlaceOfBirth] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BackAccount]  WITH CHECK ADD  CONSTRAINT [FK_BackAccount_Type] FOREIGN KEY([Type])
REFERENCES [dbo].[Type] ([IDType])
GO
ALTER TABLE [dbo].[BackAccount] CHECK CONSTRAINT [FK_BackAccount_Type]
GO
ALTER TABLE [dbo].[BackAccount]  WITH CHECK ADD  CONSTRAINT [FK_BackAccount_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[BackAccount] CHECK CONSTRAINT [FK_BackAccount_User]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_User]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_BackAccount] FOREIGN KEY([Account])
REFERENCES [dbo].[BackAccount] ([NumberAccount])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_BackAccount]
GO
