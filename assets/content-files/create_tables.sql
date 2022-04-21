/*
	OneConnexx Datenbank Tabellen
	Stand April 2022, OneConnexx Version 1.5.1
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alert](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InterfaceId] [int] NULL,
	[Endpoint] [nvarchar](255) NULL,
	[OnlyAtRuleViolation] [bit] NOT NULL,
	[Recipient] [nvarchar](511) NOT NULL,
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstanceActivity](
	[InstanceActivityId] [bigint] IDENTITY(1,1) NOT NULL,
	[InstanceId] [uniqueidentifier] NOT NULL,
	[ActivityStart] [datetime] NOT NULL,
	[ActivityEnd] [datetime] NOT NULL,
 CONSTRAINT [PK__Instance] PRIMARY KEY CLUSTERED 
(
	[InstanceActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Recipient] [nvarchar](511) NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_MailHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailQueue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Recipient] [nvarchar](511) NOT NULL,
	[Subject] [nvarchar](255) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[IsHtml] [bit] NOT NULL,
 CONSTRAINT [PK_MailQueue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
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
	[DaysOfWeek] [int] NULL,
	[DaysOfMonth] [nvarchar](100) NULL,
 CONSTRAINT [PK_Rule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InstallationId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[DiagramType] [int] NOT NULL,
	[Sql] [nvarchar](max) NOT NULL,
	[Height] [int] NOT NULL,
	[Width] [int] NOT NULL,
	[DataJson] [nvarchar](max) NOT NULL,
	[LegendLabels] [nvarchar](255) NULL,
	[StatisticAreaId] [int] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_Statistic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatisticArea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InstallationId] [uniqueidentifier] NOT NULL,
	[StatisticAreaName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_StatisticArea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[InterfaceId] [int] NOT NULL,
	[Endpoint] [nvarchar](255) NULL,
	[Success] [bit] NOT NULL,
	[Message] [nvarchar](1023) NOT NULL,
	[InstanceName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionCache](
	[InterfaceId] [int] NOT NULL,
	[Endpoint] [nvarchar](255) NOT NULL,
	[Success] [bit] NOT NULL,
	[Message] [nvarchar](1023) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
 CONSTRAINT [PK_TransactionCache] PRIMARY KEY CLUSTERED 
(
	[InterfaceId] ASC,
	[Endpoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_Enabled_InterfaceId_Endpoint] ON [dbo].[Alert]
(
	[Enabled] ASC,
	[InterfaceId] ASC,
	[Endpoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_InstallationId] ON [dbo].[Instance]
(
	[InstallationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDX_InstanceId] ON [dbo].[InstanceActivity]
(
	[InstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_Interface_Endpoint_Timestamp] ON [dbo].[Transaction]
(
	[InterfaceId] ASC,
	[Endpoint] ASC,
	[Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_Success_Interface_Endpoint_Timestamp] ON [dbo].[Transaction]
(
	[Success] ASC,
	[InterfaceId] ASC,
	[Endpoint] ASC,
	[Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Timestamp] ON [dbo].[Transaction]
(
	[Timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alert] ADD  CONSTRAINT [DF__Alert__OnlyAtRul__2DB1C7EE]  DEFAULT ((0)) FOR [OnlyAtRuleViolation]
GO
ALTER TABLE [dbo].[MailHistory] ADD  CONSTRAINT [DF_MailHistory_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Statistic] ADD  CONSTRAINT [DF__Statistic__DataJ__7BE56230]  DEFAULT ('') FOR [DataJson]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_Timestamp]  DEFAULT (getdate()) FOR [Timestamp]
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
ALTER TABLE [dbo].[InstanceActivity]  WITH CHECK ADD  CONSTRAINT [FK_AddinActivity_Instance] FOREIGN KEY([InstanceId])
REFERENCES [dbo].[Instance] ([Id])
GO
ALTER TABLE [dbo].[InstanceActivity] CHECK CONSTRAINT [FK_AddinActivity_Instance]
GO
ALTER TABLE [dbo].[Rule]  WITH CHECK ADD  CONSTRAINT [FK_Rule_Interface] FOREIGN KEY([InterfaceId])
REFERENCES [dbo].[Interface] ([Id])
GO
ALTER TABLE [dbo].[Rule] CHECK CONSTRAINT [FK_Rule_Interface]
GO
ALTER TABLE [dbo].[Statistic]  WITH CHECK ADD  CONSTRAINT [FK_Statistic_StatisticArea] FOREIGN KEY([StatisticAreaId])
REFERENCES [dbo].[StatisticArea] ([Id])
GO
ALTER TABLE [dbo].[Statistic] CHECK CONSTRAINT [FK_Statistic_StatisticArea]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Interface] FOREIGN KEY([InterfaceId])
REFERENCES [dbo].[Interface] ([Id])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Interface]
GO
