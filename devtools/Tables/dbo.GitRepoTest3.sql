CREATE TABLE [dbo].[GitRepoTest3]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[title] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GitRepoTest3] ADD CONSTRAINT [PK__GitRepoT__3213E83FE846470A] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
