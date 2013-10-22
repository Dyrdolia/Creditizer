
--create database [Creditizer]
use [Creditizer]
go



/****** Object:  Table [dbo].[Cities]    Script Date: 10/17/2013 17:47:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Cities](
	[SOATO] [nvarchar](255) NOT NULL,
	[NAME] [nvarchar](255) NULL,
	[OBL] [nvarchar](255) NULL,
	[RAION] [nvarchar](255) NULL,
	[SOVET] [nvarchar](255) NULL,
	[TIP] [nvarchar](255) NULL,
	[GNI] [nvarchar](255) NULL,
	[DATAV] [datetime] NULL,
	[SOATON] [nvarchar](255) NULL,
	[DATEL] [nvarchar](255) NULL,
	[MAL] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SOATO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 10/17/2013 17:47:37 ******/



/****** Clients ******/
create table dbo.[Clients]
(
	[Id] int primary key identity,
	
	----------Personal data--------------
	[FirstName] nvarchar(255) not null,
	[LastName] nvarchar(255) not null,
	[MiddleName] nvarchar(255) not null,
	[MaidenName] nvarchar(255),
	[Birthday] date not null,
	[Sex] bit not null,
	----------Personal data--------------
	
	-----------Birthplace------------
	[BirthplaceId] nvarchar(255) not null foreign key references [Cities]([SOATO]),	
	-----------Birthplace------------	
	
	[IsClientResidentRB] bit not null,
	[IsClientCitizenRB] bit not null,
	
	--------------Passport data-----------------
	[SeriesNumberIdentityDoc] nvarchar(255) not null,
	[PersonalNumber] nvarchar(255) not null,
	[IssuedIdentityDoc] nvarchar(255) not null,
	[DateIssueIdentityDoc] date not null,
	[ValidityIdentityDoc] date not null,
	
	[SurnameLat] nvarchar(255) not null,
	[NameLat] nvarchar(255) not null,
	--------------Passport data-----------------
	
	---------------ContactData-------------------
	[Email] nvarchar(255),
	[MobilePhone] nvarchar(255),
	[HomePhone] nvarchar(255)	
	---------------ContactData-------------------
)
/****** Clients ******/


