/****** Object:  Table [dbo].[Alert]    Script Date: 08.02.2017 08:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alert](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InterfaceId] [int] NULL,
	[Endpoint] [nvarchar](255) NULL,
	[Recipient] [nvarchar](255) NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[IsHtml] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Alert] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Instance]    Script Date: 08.02.2017 08:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instance](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[AddIn] [nvarchar](255) NOT NULL,
	[AddInType] [nchar](1) NOT NULL,
	[InterfaceId] [int] NULL,
	[InstallationId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Instance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Interface]    Script Date: 08.02.2017 08:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interface](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Interface] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MailQueue]    Script Date: 08.02.2017 08:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Recipient] [nvarchar](255) NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[IsHtml] [bit] NOT NULL,
 CONSTRAINT [PK_MailQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rule]    Script Date: 08.02.2017 08:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[InterfaceId] [int] NOT NULL,
	[Endpoint] [nvarchar](255) NULL,
	[Timeout] [int] NOT NULL,
	[LastAlert] [datetime] NULL,
	[RepeatAfter] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ExecutionTime] [time](7) NULL,
	[LimitMode] [int] NULL,
	[TransactionCount] [int] NULL,
 CONSTRAINT [PK_Rule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 08.02.2017 08:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Timestamp] [datetime] NOT NULL CONSTRAINT [DF_Transaction_Timestamp]  DEFAULT (getdate()),
	[InterfaceId] [int] NOT NULL,
	[Endpoint] [nvarchar](255) NULL,
	[Success] [bit] NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
	[InstanceName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransactionCache]    Script Date: 08.02.2017 08:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionCache](
	[InterfaceId] [int] NOT NULL,
	[Endpoint] [nvarchar](255) NOT NULL,
	[Success] [bit] NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_TransactionCache] PRIMARY KEY CLUSTERED 
(
	[InterfaceId] ASC,
	[Endpoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Alert]  WITH CHECK ADD  CONSTRAINT [FK_Alert_Interface] FOREIGN KEY([InterfaceId])
REFERENCES [dbo].[Interface] ([Id])
GO
ALTER TABLE [dbo].[Alert] CHECK CONSTRAINT [FK_Alert_Interface]
GO
ALTER TABLE [dbo].[Instance]  WITH CHECK ADD  CONSTRAINT [FK_Instance_Interface] FOREIGN KEY([InterfaceId])
REFERENCES [dbo].[Interface] ([Id])
GO
ALTER TABLE [dbo].[Instance] CHECK CONSTRAINT [FK_Instance_Interface]
GO
ALTER TABLE [dbo].[Rule]  WITH CHECK ADD  CONSTRAINT [FK_Rule_Interface] FOREIGN KEY([InterfaceId])
REFERENCES [dbo].[Interface] ([Id])
GO
ALTER TABLE [dbo].[Rule] CHECK CONSTRAINT [FK_Rule_Interface]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Interface] FOREIGN KEY([InterfaceId])
REFERENCES [dbo].[Interface] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Interface]
GO
