USE [RentaCar]
GO
/****** Object:  Table [dbo].[Models]    Script Date: 13.10.2019 23:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Series]    Script Date: 13.10.2019 23:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fuels]    Script Date: 13.10.2019 23:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fuels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](6) NOT NULL,
 CONSTRAINT [PK_Fuels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentCar]    Script Date: 13.10.2019 23:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentCar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModelId] [int] NOT NULL,
	[SeriesId] [int] NOT NULL,
	[TypeOfFuelId] [int] NOT NULL,
	[TransMissionId] [int] NOT NULL,
	[RentPerson] [nvarchar](100) NOT NULL,
	[WorkerId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transmissions]    Script Date: 13.10.2019 23:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transmissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Transmissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 13.10.2019 23:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VWrentcar]    Script Date: 13.10.2019 23:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VWrentcar] as
SELECT TOP (1000) rentcar.[Id]
      ,[ModelId]
	  ,Models.[Name] as ModelName
      ,[SeriesId]
	  ,Series.[Name] as ModelSeria
      ,[TypeOfFuelId]
	  ,Fuels.[Name] as FuelType
      ,[TransMissionId]
	  ,Transmissions.[Name] as TransmissionName
      ,[RentPerson]
      ,[WorkerId]
	  ,workers.[Name] as WorkerFullName
  FROM [RentaCar].[dbo].[RentCar]

  join Models on RentCar.ModelId=Models.id
  join Series on RentCar.SeriesId=Series.id
  join Fuels on RentCar.TypeOfFuelId=Fuels.id
  join Transmissions on RentCar.TransMissionId=Transmissions.id
  join Workers on RentCar.WorkerId=Workers.id
GO
SET IDENTITY_INSERT [dbo].[Fuels] ON 
GO
INSERT [dbo].[Fuels] ([Id], [Name]) VALUES (1, N'Benzin')
GO
INSERT [dbo].[Fuels] ([Id], [Name]) VALUES (2, N'Dizel')
GO
INSERT [dbo].[Fuels] ([Id], [Name]) VALUES (3, N'Qaz')
GO
SET IDENTITY_INSERT [dbo].[Fuels] OFF
GO
SET IDENTITY_INSERT [dbo].[Models] ON 
GO
INSERT [dbo].[Models] ([Id], [Name]) VALUES (1, N'Mercedes')
GO
INSERT [dbo].[Models] ([Id], [Name]) VALUES (2, N'Bmw')
GO
INSERT [dbo].[Models] ([Id], [Name]) VALUES (3, N'Toyota')
GO
SET IDENTITY_INSERT [dbo].[Models] OFF
GO
SET IDENTITY_INSERT [dbo].[RentCar] ON 
GO
INSERT [dbo].[RentCar] ([Id], [ModelId], [SeriesId], [TypeOfFuelId], [TransMissionId], [RentPerson], [WorkerId]) VALUES (1, 1, 1, 1, 1, N'Mamed Semedov', 1)
GO
INSERT [dbo].[RentCar] ([Id], [ModelId], [SeriesId], [TypeOfFuelId], [TransMissionId], [RentPerson], [WorkerId]) VALUES (2, 2, 2, 2, 2, N'Azer Cebrayilov', 2)
GO
SET IDENTITY_INSERT [dbo].[RentCar] OFF
GO
SET IDENTITY_INSERT [dbo].[Series] ON 
GO
INSERT [dbo].[Series] ([Id], [Name]) VALUES (1, N'E350')
GO
INSERT [dbo].[Series] ([Id], [Name]) VALUES (2, N'530')
GO
INSERT [dbo].[Series] ([Id], [Name]) VALUES (3, N'Corolla')
GO
SET IDENTITY_INSERT [dbo].[Series] OFF
GO
SET IDENTITY_INSERT [dbo].[Transmissions] ON 
GO
INSERT [dbo].[Transmissions] ([Id], [Name]) VALUES (1, N'Avtomat')
GO
INSERT [dbo].[Transmissions] ([Id], [Name]) VALUES (2, N'Mexanika')
GO
SET IDENTITY_INSERT [dbo].[Transmissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Workers] ON 
GO
INSERT [dbo].[Workers] ([Id], [Name]) VALUES (1, N'Hesen Memmedov')
GO
INSERT [dbo].[Workers] ([Id], [Name]) VALUES (2, N'Eli Abdullayev')
GO
SET IDENTITY_INSERT [dbo].[Workers] OFF
GO
ALTER TABLE [dbo].[RentCar]  WITH CHECK ADD  CONSTRAINT [FK_RentCar_Fuels] FOREIGN KEY([TypeOfFuelId])
REFERENCES [dbo].[Fuels] ([Id])
GO
ALTER TABLE [dbo].[RentCar] CHECK CONSTRAINT [FK_RentCar_Fuels]
GO
ALTER TABLE [dbo].[RentCar]  WITH CHECK ADD  CONSTRAINT [FK_RentCar_Models] FOREIGN KEY([ModelId])
REFERENCES [dbo].[Models] ([Id])
GO
ALTER TABLE [dbo].[RentCar] CHECK CONSTRAINT [FK_RentCar_Models]
GO
ALTER TABLE [dbo].[RentCar]  WITH CHECK ADD  CONSTRAINT [FK_RentCar_Transmissions] FOREIGN KEY([TransMissionId])
REFERENCES [dbo].[Transmissions] ([Id])
GO
ALTER TABLE [dbo].[RentCar] CHECK CONSTRAINT [FK_RentCar_Transmissions]
GO
ALTER TABLE [dbo].[RentCar]  WITH CHECK ADD  CONSTRAINT [FK_RentCar_Workers] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Workers] ([Id])
GO
ALTER TABLE [dbo].[RentCar] CHECK CONSTRAINT [FK_RentCar_Workers]
GO
