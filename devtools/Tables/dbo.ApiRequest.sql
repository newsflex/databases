CREATE TABLE [dbo].[ApiRequest]
(
[requestDate] [datetime] NULL,
[thread] [int] NULL,
[execTimeMs] [int] NULL,
[method] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[personId] [int] NULL,
[route] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[source] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[server] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[tag] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[request] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[env] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
