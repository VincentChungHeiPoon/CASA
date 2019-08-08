USE [CASAInterview]
GO

/****** Object:  Table [dbo].[tblRosters]    Script Date: 8/8/2019 6:54:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblRosters](
	[tblRosterID] [varchar](50) NOT NULL,
	[tblStudent_ID] [varchar](50) NOT NULL,
	[tblSection_ID] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_tbtRoster] PRIMARY KEY CLUSTERED 
(
	[tblRosterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblRosters] ADD  CONSTRAINT [DF_tbtRoster_Modified]  DEFAULT (getdate()) FOR [Modified]
GO

ALTER TABLE [dbo].[tblRosters] ADD  CONSTRAINT [DF_tbtRoster_Created]  DEFAULT (getdate()) FOR [Created]
GO


CREATE TABLE [dbo].[tblSections](
	[tblSectionID] [varchar](50) NOT NULL,
	[SectionNumber] [int] NOT NULL,
	[CourseID] [varchar](50) NOT NULL,
	[Department] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_tblSections] PRIMARY KEY CLUSTERED 
(
	[tblSectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblSections] ADD  CONSTRAINT [DF_tblSections_Modified]  DEFAULT (getdate()) FOR [Modified]
GO

ALTER TABLE [dbo].[tblSections] ADD  CONSTRAINT [DF_tblSections_Created]  DEFAULT (getdate()) FOR [Created]
GO


CREATE TABLE [dbo].[tblStudents](
	[tblStudentID] [varchar](50) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[PSID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_tblStudents] PRIMARY KEY CLUSTERED 
(
	[tblStudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblStudents] ADD  CONSTRAINT [DF_tblStudents_Modified]  DEFAULT (getdate()) FOR [Modified]
GO

ALTER TABLE [dbo].[tblStudents] ADD  CONSTRAINT [DF_tblStudents_Created]  DEFAULT (getdate()) FOR [Created]
GO




