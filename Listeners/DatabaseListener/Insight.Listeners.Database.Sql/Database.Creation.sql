CREATE TABLE [dbo].[RIMessage](
	[RILogId] [bigint] NOT NULL,
	[SessionId] [bigint] NULL,
	[RequestId] [bigint] NULL,
	[SourceUtcOffset] [smallint] NULL,
	[DateTime] [datetime] NULL,
	[DomainID] [int] NULL,
	[ProcessID] [int] NULL,
	[ThreadID] [int] NULL,
	[Category] [nvarchar](512) NULL,
	[Application] [nvarchar](512) NULL,
	[MachineName] [nvarchar](512) NULL,
	[UserDomainName] [nvarchar](512) NULL,
	[UserName] [nvarchar](512) NULL,
	[IndentLevel] [smallint] NULL,
	[BkColor] [int] NULL,
	[MessageType] [int] NULL,
	[MessageSubType] [smallint] NULL,
	[Message] [ntext] NULL,
	[DetailType] [int] NULL,
	[SubDetails] [varbinary](max) NULL,
	[Details] [varbinary](max) NULL,
	[TextDetails] [ntext] NULL,
 CONSTRAINT [PK_RIMessage] PRIMARY KEY CLUSTERED 
(
	[RILogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RIID]    Script Date: 12/10/2014 15:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIID](
	[ID] [bigint] NOT NULL,
 CONSTRAINT [PK_RIID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[RIID] (ID) VALUES(0)

/****** Object:  Table [dbo].[RIMessageExtension]    Script Date: 12/10/2014 15:05:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RIMessageExtension](
	[RILogExtensionId] [bigint] IDENTITY(1,1) NOT NULL,
	[RILogId] [bigint] NOT NULL,
	[Caption] [nvarchar](512) NULL,
	[ExtensionKey] [nvarchar](512) NULL,
	[ExtensionValue] [nvarchar](512) NULL,
 CONSTRAINT [PK_RIMessageExtension] PRIMARY KEY CLUSTERED 
(
	[RILogExtensionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RIMessageExtension] ON [dbo].[RIMessageExtension] 
(
	[RILogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_RIMessageExtension_RIMessage]    Script Date: 12/10/2014 15:05:14 ******/
ALTER TABLE [dbo].[RIMessageExtension]  WITH CHECK ADD  CONSTRAINT [FK_RIMessageExtension_RIMessage] FOREIGN KEY([RILogId])
REFERENCES [dbo].[RIMessage] ([RILogId])
GO
ALTER TABLE [dbo].[RIMessageExtension] CHECK CONSTRAINT [FK_RIMessageExtension_RIMessage]
GO

