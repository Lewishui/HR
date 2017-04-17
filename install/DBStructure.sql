/****** Object:  Table [dbo].[KS_LinkClass]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_LinkClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](100) NOT NULL,
	[Description] [ntext] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_LinkClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_LinkClass] 
(
	[ClassID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LinkClass', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LinkClass', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类简介' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LinkClass', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LinkClass', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
/****** Object:  Table [dbo].[KS_ProBrandR]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProBrandR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[BrandID] [int] NULL,
 CONSTRAINT [PK_KS_ProClassBrandR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品栏目ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrandR', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrandR', @level2type=N'COLUMN',@level2name=N'BrandID'
GO
/****** Object:  Table [dbo].[KS_SpecialR]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_SpecialR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SpecialID] [int] NOT NULL,
	[InfoID] [int] NOT NULL,
	[ChannelID] [int] NOT NULL,
 CONSTRAINT [PK_KS_SpecialR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialR', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialR', @level2type=N'COLUMN',@level2name=N'SpecialID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialR', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialR', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
/****** Object:  Table [dbo].[KS_FieldGroup]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_FieldGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NULL,
	[ChannelID] [int] NULL,
	[OrderID] [int] NULL,
	[IsSys] [int] NULL,
 CONSTRAINT [PK_KS_FieldGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ViewRecords]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ViewRecords](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[basicType] [int] NULL,
	[channelid] [int] NULL,
	[infoid] [int] NULL,
	[adddate] [datetime] NULL,
 CONSTRAINT [PK_KS_ViewRecords] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最近浏览的记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ViewRecords', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ViewRecords', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'基类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ViewRecords', @level2type=N'COLUMN',@level2name=N'basicType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ViewRecords', @level2type=N'COLUMN',@level2name=N'channelid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ViewRecords', @level2type=N'COLUMN',@level2name=N'infoid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ViewRecords', @level2type=N'COLUMN',@level2name=N'adddate'
GO
/****** Object:  Table [dbo].[KS_Comment]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NULL,
	[ClassID] [int] NULL,
	[InfoID] [int] NULL,
	[UserIP] [nvarchar](20) NULL,
	[Content] [ntext] NULL,
	[Support] [int] NULL,
	[Opposition] [int] NULL,
	[AddDate] [datetime] NULL,
	[Verify] [int] NULL,
	[Anonymous] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[Viewpoint] [int] NULL,
	[Reports] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_KS_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ChannelID] ON [KS_Comment] 
(
	[ChannelID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_Comment] 
(
	[ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [InfoID] ON [KS_Comment] 
(
	[InfoID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'UserIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支持票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'Support'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'反对票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'Opposition'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'审核标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'Verify'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否匿名评论' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'Anonymous'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'立场' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'Viewpoint'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'举报次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'Reports'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Comment', @level2type=N'COLUMN',@level2name=N'UserID'
GO
/****** Object:  Table [dbo].[KS_U_Photo]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_U_Photo](
	[InfoID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Content] [text] NULL,
	[ShowStyle] [int] NULL,
	[PageNum] [int] NULL,
	[Details] [ntext] NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[TitleFontColor] [nvarchar](50) NULL,
	[Attribute] [nvarchar](255) NULL,
	[DefaultPic] [nvarchar](255) NULL,
	[TurnUrl] [nvarchar](255) NULL,
	[priority] [int] NULL,
	[Hits] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[VoteID] [int] NULL,
	[TemplateFile] [nvarchar](255) NULL,
	[Template3GFile] [nvarchar](255) NULL,
	[ShowON3G] [tinyint] NULL,
	[FileName] [nvarchar](255) NULL,
	[RefreshTF] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[DelTF] [tinyint] NULL,
	[Inputer] [nvarchar](100) NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[SocialIDs] [nvarchar](255) NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWords] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](255) NULL,
	[CommentNum] [int] NULL,
	[CopyFrom] [nvarchar](255) NULL,
	[Author] [nvarchar](255) NULL,
	[ProvinceID] [int] NULL,
	[ArrGroupID] [nvarchar](255) NULL,
	[ReadPoint] [money] NULL,
	[ChargeType] [tinyint] NULL,
	[PitchTime] [int] NULL,
	[ReadTimes] [int] NULL,
	[DividePercent] [int] NULL,
	[PKID] [int] NULL,
	[InfoPurview] [tinyint] NULL,
	[ChannelID] [int] NULL,
	[GoodNum] [int] NULL,
	[BadNum] [int] NULL,
	[FavNum] [int] NULL,
	[ShareNum] [int] NULL,
 CONSTRAINT [PK_KS_U_Photo] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Photo', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档标题（图片名称）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Photo', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Photo', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'照片内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Photo', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Photo', @level2type=N'COLUMN',@level2name=N'ShowStyle'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'每页显示张数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Photo', @level2type=N'COLUMN',@level2name=N'PageNum'
GO
/****** Object:  Table [dbo].[KS_MoodProject]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_MoodProject](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](100) NULL,
	[ProjectContent] [nvarchar](3000) NULL,
	[OnlyUser] [tinyint] NULL,
	[UserOnce] [int] NULL,
	[AllowGroupID] [varchar](200) NULL,
	[Status] [tinyint] NULL,
	[TimeLimit] [tinyint] NULL,
	[StartDate] [datetime] NULL,
	[ExpiredDate] [datetime] NULL,
 CONSTRAINT [PK_KS_MoodProject] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'心情指数项目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodProject', @level2type=N'COLUMN',@level2name=N'ProjectID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodProject', @level2type=N'COLUMN',@level2name=N'ProjectName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodProject', @level2type=N'COLUMN',@level2name=N'ProjectContent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'只允许会员表态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodProject', @level2type=N'COLUMN',@level2name=N'OnlyUser'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'每个会员只能表态一次' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodProject', @level2type=N'COLUMN',@level2name=N'UserOnce'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组限制' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodProject', @level2type=N'COLUMN',@level2name=N'AllowGroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodProject', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'启用时间限制标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodProject', @level2type=N'COLUMN',@level2name=N'TimeLimit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodProject', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过期时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodProject', @level2type=N'COLUMN',@level2name=N'ExpiredDate'
GO
/****** Object:  Table [dbo].[KS_AskRank]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_AskRank](
	[RankID] [int] IDENTITY(1,1) NOT NULL,
	[RankName] [nvarchar](50) NULL,
	[IsSys] [tinyint] NULL,
	[Score] [int] NULL,
	[Ico] [nvarchar](50) NULL,
	[QueNum] [int] NULL,
	[AnsNum] [int] NULL,
	[color] [nvarchar](30) NULL,
 CONSTRAINT [PK_KS_AskGrade] PRIMARY KEY CLUSTERED 
(
	[RankID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问答等级ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskRank', @level2type=N'COLUMN',@level2name=N'RankID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'等级名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskRank', @level2type=N'COLUMN',@level2name=N'RankName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统自带' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskRank', @level2type=N'COLUMN',@level2name=N'IsSys'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所需积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskRank', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'等级图标' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskRank', @level2type=N'COLUMN',@level2name=N'Ico'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所需问题数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskRank', @level2type=N'COLUMN',@level2name=N'QueNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所需回答数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskRank', @level2type=N'COLUMN',@level2name=N'AnsNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'等级颜色' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskRank', @level2type=N'COLUMN',@level2name=N'color'
GO
/****** Object:  Table [dbo].[KS_BBSBoard]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BBSBoard](
	[BoardID] [int] IDENTITY(1,1) NOT NULL,
	[BoardName] [nvarchar](100) NULL,
	[ParentID] [int] NULL,
	[Root] [int] NULL,
	[Depth] [tinyint] NULL,
	[OrderID] [int] NULL,
	[ParentIDPath] [varchar](300) NULL,
	[Child] [int] NULL,
	[PrevID] [int] NULL,
	[NextID] [int] NULL,
	[AddDate] [datetime] NULL,
	[Setting] [ntext] NULL,
	[BoardMaster] [nvarchar](255) NULL,
	[ICO] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[BoardRules] [ntext] NULL,
	[TopicNum] [int] NULL,
	[PostNum] [int] NULL,
	[TodayNum] [int] NULL,
	[LastPost] [nvarchar](500) NULL,
 CONSTRAINT [PK_KS_BBSClass] PRIMARY KEY CLUSTERED 
(
	[BoardID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'版面名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSBoard', @level2type=N'COLUMN',@level2name=N'BoardName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSBoard', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'版主' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSBoard', @level2type=N'COLUMN',@level2name=N'BoardMaster'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'版面图标' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSBoard', @level2type=N'COLUMN',@level2name=N'ICO'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'版面介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSBoard', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'版规' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSBoard', @level2type=N'COLUMN',@level2name=N'BoardRules'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主题数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSBoard', @level2type=N'COLUMN',@level2name=N'TopicNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSBoard', @level2type=N'COLUMN',@level2name=N'PostNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'今日发帖数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSBoard', @level2type=N'COLUMN',@level2name=N'TodayNum'
GO
/****** Object:  Table [dbo].[KS_UserCard]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CardNum] [nvarchar](50) NULL,
	[CardPass] [nvarchar](50) NULL,
	[Money] [money] NULL,
	[ValidNum] [int] NULL,
	[ValidUnit] [int] NULL,
	[AddDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[UseDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[IsUsed] [int] NULL,
	[IsSale] [int] NULL,
 CONSTRAINT [PK_KS_UserCard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CardNum] ON [KS_UserCard] 
(
	[CardNum] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [id] ON [KS_UserCard] 
(
	[ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ValidNum] ON [KS_UserCard] 
(
	[ValidNum] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserCard', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'充值卡号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserCard', @level2type=N'COLUMN',@level2name=N'CardNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'充值卡密码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserCard', @level2type=N'COLUMN',@level2name=N'CardPass'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'面值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserCard', @level2type=N'COLUMN',@level2name=N'Money'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'有效天数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserCard', @level2type=N'COLUMN',@level2name=N'ValidNum'
GO
/****** Object:  Table [dbo].[KS_Announce]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Announce](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[Author] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Newest] [int] NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyId] [int] NULL,
 CONSTRAINT [PK_KS_Announce] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ChannelID] ON [KS_Announce] 
(
	[ChannelID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'公告ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Announce', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'公告所属频道' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Announce', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'公告标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Announce', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'公告内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Announce', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发者人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Announce', @level2type=N'COLUMN',@level2name=N'Author'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发布时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Announce', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最新标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Announce', @level2type=N'COLUMN',@level2name=N'Newest'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Announce', @level2type=N'COLUMN',@level2name=N'ProvinceID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Announce', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城镇ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Announce', @level2type=N'COLUMN',@level2name=N'CountyId'
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodProjectDel]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_MoodProjectDel]
 @projectids nvarchar(1000)
 AS
  declare @sql nvarchar(1500)
  set @sql='delete from KS_MoodProject Where projectid in('+@projectids+')'
  exec (@sql)
  set @sql='delete from KS_MoodList Where moodid in('+@projectids+')'
   exec (@sql)
GO
/****** Object:  Table [dbo].[KS_Author]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Author](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](50) NOT NULL,
	[Sex] [nvarchar](2) NULL,
	[Birthday] [nvarchar](100) NULL,
	[WorkUnits] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Telphone] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NULL,
	[QQ] [nvarchar](15) NULL,
	[HomePage] [nvarchar](100) NULL,
	[Resume] [ntext] NULL,
	[AddDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_KS_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_Author] 
(
	[AuthorID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ZipCode] ON [KS_Author] 
(
	[ZipCode] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'作者ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'AuthorID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'作者姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'AuthorName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'工作单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'WorkUnits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'Telphone'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ 号码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'QQ'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主页' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'HomePage'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'简介' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'Resume'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Author', @level2type=N'COLUMN',@level2name=N'UserName'
GO
/****** Object:  Table [dbo].[KS_LogMoney]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_LogMoney](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[ClientName] [nvarchar](100) NULL,
	[Money] [money] NULL,
	[CurrMoney] [money] NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[MoneyType] [int] NULL,
	[IncomeOrPayOut] [int] NULL,
	[OrderID] [nvarchar](30) NULL,
	[PaymentID] [int] NULL,
	[Remark] [nvarchar](255) NULL,
	[PayTime] [datetime] NULL,
	[Inputer] [nvarchar](50) NULL,
	[IP] [nvarchar](50) NULL,
	[Times] [int] NULL,
	[RealMoney] [money] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_KS_LogMoney] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'客户姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'ClientName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'资金' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'Money'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'当前余额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'CurrMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'交易方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'MoneyType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'扣费或是续费标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'IncomeOrPayOut'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付平台ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'PaymentID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'PayTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'Inputer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'操作IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'重复次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'Times'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'实收资金' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'RealMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogMoney', @level2type=N'COLUMN',@level2name=N'Discount'
GO
/****** Object:  Table [dbo].[KS_ProDeliveryCorp]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProDeliveryCorp](
	[CorpID] [int] IDENTITY(1,1) NOT NULL,
	[CorpName] [nvarchar](100) NOT NULL,
	[WebUrl] [nvarchar](150) NULL,
	[OrderUrl] [nvarchar](200) NULL,
	[OrderID] [int] NULL,
	[Intro] [ntext] NULL,
	[Template] [ntext] NULL,
	[PhotoUrl] [varchar](255) NULL,
	[CorpCode] [varchar](50) NULL,
 CONSTRAINT [PK_KS_ProDeliveryCorp] PRIMARY KEY CLUSTERED 
(
	[CorpID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'物流公司ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryCorp', @level2type=N'COLUMN',@level2name=N'CorpID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryCorp', @level2type=N'COLUMN',@level2name=N'CorpName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'公司网址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryCorp', @level2type=N'COLUMN',@level2name=N'WebUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单查询地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryCorp', @level2type=N'COLUMN',@level2name=N'OrderUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryCorp', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'物流公司介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryCorp', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'快递单打印模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryCorp', @level2type=N'COLUMN',@level2name=N'Template'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'快递单模板图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryCorp', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'快递公司代码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryCorp', @level2type=N'COLUMN',@level2name=N'CorpCode'
GO
/****** Object:  Table [dbo].[KS_Area]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Area](
	[ID] [int] NOT NULL,
	[City] [nvarchar](155) NULL,
	[E_City] [nvarchar](155) NULL,
	[ParentID] [int] NULL,
	[OrderID] [int] NULL,
	[Depth] [int] NULL,
	[Letter] [nvarchar](50) NULL,
	[WebUrl] [nvarchar](100) NULL,
	[WebTitle] [nvarchar](255) NULL,
	[WebLogo] [nvarchar](255) NULL,
	[MetaKeyWord] [nvarchar](255) NULL,
	[MetaDescript] [nvarchar](255) NULL,
	[CopyRight] [nvarchar](255) NULL,
	[ContactMan] [nvarchar](100) NULL,
	[Tel] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[QQ] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[IsShow] [tinyint] NULL,
 CONSTRAINT [PK_KS_Area] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProLogInvoice]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProLogInvoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[ClientName] [nvarchar](50) NULL,
	[Inputer] [nvarchar](50) NULL,
	[InvoiceType] [nvarchar](300) NULL,
	[InvoiceNum] [nvarchar](300) NULL,
	[InvoiceTitle] [nvarchar](300) NULL,
	[InvoiceContent] [ntext] NULL,
	[InvoiceDate] [datetime] NULL,
	[MoneyTotal] [money] NULL,
	[HandlerName] [nvarchar](50) NULL,
	[InputTime] [datetime] NULL,
 CONSTRAINT [PK_KS_ProLogInvoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'客户姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'ClientName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'Inputer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发票类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发票号码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发票抬头' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceTitle'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发票内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceContent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开发票日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开票金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'MoneyTotal'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开票人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'HandlerName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogInvoice', @level2type=N'COLUMN',@level2name=N'InputTime'
GO
/****** Object:  Table [dbo].[KS_ProSpecial]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProSpecial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NULL,
	[ItemNum] [int] NULL,
 CONSTRAINT [PK_KS_ProSpecial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'规格组名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecial', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'属性个数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecial', @level2type=N'COLUMN',@level2name=N'ItemNum'
GO
/****** Object:  Table [dbo].[KS_UserConfig]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserConfig](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserField] [ntext] NULL,
 CONSTRAINT [PK_KS_UserConfig] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProGroupPrice]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProGroupPrice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[GroupID] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_KS_ProGroupPrice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupPrice', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupPrice', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupPrice', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupPrice', @level2type=N'COLUMN',@level2name=N'Price'
GO
/****** Object:  Table [dbo].[KS_InnerLink]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_InnerLink](
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
	[LinkText] [nvarchar](150) NULL,
	[LinkColor] [nvarchar](50) NULL,
	[LinkUrl] [nvarchar](150) NULL,
	[Opentype] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Status] [int] NULL,
	[Times] [int] NULL,
 CONSTRAINT [PK_KS_InnerLink] PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_InnerLink] 
(
	[LinkID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InnerLink', @level2type=N'COLUMN',@level2name=N'LinkID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'链接文本' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InnerLink', @level2type=N'COLUMN',@level2name=N'LinkText'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文本链接颜色' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InnerLink', @level2type=N'COLUMN',@level2name=N'LinkColor'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'内部链接URL' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InnerLink', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'打开方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InnerLink', @level2type=N'COLUMN',@level2name=N'Opentype'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InnerLink', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InnerLink', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'替换次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InnerLink', @level2type=N'COLUMN',@level2name=N'Times'
GO
/****** Object:  Table [dbo].[KS_ProFightGroupClass]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProFightGroupClass](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[className] [nvarchar](50) NOT NULL,
	[rootid] [int] NULL,
	[orders] [int] NULL,
	[parentid] [int] NULL,
	[child] [int] NULL,
	[IsLock] [tinyint] NULL,
	[InfoNum] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProAddress]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[RealName] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[AddDate] [smalldatetime] NULL,
	[IsDefault] [tinyint] NULL,
	[Title] [nvarchar](255) NULL,
 CONSTRAINT [PK_KS_ProAddress] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'AddressId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系手机' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'ProvinceID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城镇ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'CountyID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'IsDefault'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'别名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAddress', @level2type=N'COLUMN',@level2name=N'Title'
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodListDel]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_MoodListDel] 
@ids varchar(1000)
AS
 if (@ids<>'')
  begin
 declare @sql nvarchar(4000)
 set @sql='delete from KS_MoodList Where ID in('+@ids+')'
 exec (@sql)
 end
GO
/****** Object:  StoredProcedure [dbo].[KS_GetDocInputerList]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_GetDocInputerList] AS
select inputer from KS_InfoList Group By Inputer
GO
/****** Object:  Table [dbo].[KS_PaymentPlat]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_PaymentPlat](
	[ID] [int] NOT NULL,
	[PlatName] [nvarchar](50) NULL,
	[Remark] [ntext] NULL,
	[AccountID] [nvarchar](50) NULL,
	[MD5Key] [nvarchar](100) NULL,
	[Rate] [float] NULL,
	[RateByUser] [tinyint] NULL,
	[OrderID] [int] NULL,
	[IsDisabled] [tinyint] NOT NULL,
	[IsDefault] [tinyint] NOT NULL,
	[ApplyUrl] [varchar](255) NULL,
	[showflag] [tinyint] NULL,
	[Logo] [nvarchar](255) NULL,
	[Setting] [text] NULL,
	[ShowDevice] [varchar](200) NULL,
 CONSTRAINT [PK_KS_PaymentPlat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付平台记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'平台名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'PlatName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'平台备注说明' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'平台的账号ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'AccountID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付密钥' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'MD5Key'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'费率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'Rate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手续费由付款人额外支付' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'RateByUser'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'IsDisabled'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'IsDefault'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'ApplyUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'前台是正式启用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlat', @level2type=N'COLUMN',@level2name=N'showflag'
GO
/****** Object:  StoredProcedure [dbo].[KS_AdminModifyPass]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_AdminModifyPass] 
@userName nvarchar(255),
@oldPassWord nvarchar(255),
@newPassWord nvarchar(255),
@result int out
AS
if exists(select top 1 * from KS_Admin Where [userName]=@userName and [passWord]=@oldPassWord)
   begin       
    update KS_Admin Set [passWord]=@newPassWord Where [userName]=@userName
    select @result=1
   end
else
   begin
   select @result=2
   end
GO
/****** Object:  Table [dbo].[KS_Adiplist]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Adiplist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adid] [int] NULL,
	[boardid] [int] NULL,
	[adddate] [datetime] NULL,
	[UserIP] [nvarchar](50) NULL,
	[userName] [varchar](50) NULL,
 CONSTRAINT [PK_KS_Adiplist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自动编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adiplist', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告条ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adiplist', @level2type=N'COLUMN',@level2name=N'adid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adiplist', @level2type=N'COLUMN',@level2name=N'boardid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点击时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adiplist', @level2type=N'COLUMN',@level2name=N'adddate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'IP地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adiplist', @level2type=N'COLUMN',@level2name=N'UserIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点击用户' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adiplist', @level2type=N'COLUMN',@level2name=N'userName'
GO
/****** Object:  Table [dbo].[KS_ProSpecificationPrice]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProSpecificationPrice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemNo] [nvarchar](250) NULL,
	[proid] [int] NULL,
	[attr1] [nvarchar](255) NULL,
	[attr2] [nvarchar](255) NULL,
	[attr3] [nvarchar](255) NULL,
	[price_market] [money] NULL,
	[price_cost] [money] NULL,
	[price] [money] NULL,
	[amount] [int] NULL,
	[weight] [float] NULL,
	[GroupPrice] [nvarchar](2000) NULL,
 CONSTRAINT [PK_KS_ShopSpecificationPrice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'itemNo'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'proid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'属性1' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'attr1'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'属性2' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'attr2'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'属性3' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'attr3'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'市场价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'price_market'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'进货价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'price_cost'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'单价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'price'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'库存量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'amount'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'重量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationPrice', @level2type=N'COLUMN',@level2name=N'weight'
GO
/****** Object:  Table [dbo].[KS_ProGroupBuyClass]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProGroupBuyClass](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[className] [nvarchar](50) NOT NULL,
	[rootid] [int] NULL,
	[orders] [int] NULL,
	[parentid] [int] NULL,
	[child] [int] NULL,
	[IsLock] [tinyint] NOT NULL,
	[InfoNum] [int] NULL,
 CONSTRAINT [PK_KS_ProGroupBuyClass] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyClass', @level2type=N'COLUMN',@level2name=N'classID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyClass', @level2type=N'COLUMN',@level2name=N'className'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类级别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyClass', @level2type=N'COLUMN',@level2name=N'rootid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyClass', @level2type=N'COLUMN',@level2name=N'orders'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属的父分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyClass', @level2type=N'COLUMN',@level2name=N'parentid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'子分类数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyClass', @level2type=N'COLUMN',@level2name=N'child'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyClass', @level2type=N'COLUMN',@level2name=N'IsLock'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyClass', @level2type=N'COLUMN',@level2name=N'InfoNum'
GO
/****** Object:  Table [dbo].[KS_Message]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectID] [int] NULL,
	[ToUserName] [nvarchar](200) NULL,
	[FromUserName] [nvarchar](50) NULL,
	[MsgTitle] [nvarchar](255) NULL,
	[MsgContactMan] [nvarchar](50) NULL,
	[MsgTel] [nvarchar](50) NULL,
	[MsgMail] [nvarchar](50) NULL,
	[MsgContent] [ntext] NULL,
	[RequestInfo] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[Verify] [int] NULL,
	[ReadTF] [int] NULL,
	[DelTf] [tinyint] NULL,
	[PMsgID] [int] NULL,
 CONSTRAINT [PK_KS_B2B_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_Message] 
(
	[ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [InfoID] ON [KS_Message] 
(
	[SubjectID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MessageID] ON [KS_Message] 
(
	[PMsgID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'SubjectID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'接收者用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'ToUserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发送者用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'FromUserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'消息标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'MsgTitle'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'MsgContactMan'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'MsgTel'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'MsgMail'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'消息内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'MsgContent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'审核标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'Verify'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'已读标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'ReadTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Message', @level2type=N'COLUMN',@level2name=N'DelTf'
GO
/****** Object:  StoredProcedure [dbo].[KS_TagsHits]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_TagsHits] 
 @KeyText nvarchar(100)
AS

  DECLARE @TagsHits int,@TodayHits int,@YesterDayHits int,@WeekHits int,@LastUseTime datetime
  DECLARE @NowDayHits int ,@NowYesterDayHits int, @NowWeekHits int, @NowHits int

    SELECT top 1 @TagsHits=TagsHits,@TodayHits=TodayHits,@YesterDayHits=YesterDayHits,@WeekHits=WeekHits,@LastUseTime=LastUseTime FROM [KS_KeyTags] WHERE KeyText=@KeyText
  

     Set @NowHits=@TagsHits+1
     If DateDiff(week,@LastUseTime, GetDate())<=0
       SET @NowWeekHits=@WeekHits+1
     Else
      SET @NowWeekHits=1
     IF DateDiff(day,@LastUseTime,GetDate())=1
      SET @NowYesterDayHits=@YesterDayHits+1
    ELSE
     SET @NowYesterDayHits=1
    IF DateDiff(day,@LastUseTime,GetDate())<=0
     SET @NowDayHits=@TodayHits+1
   Else
     Set @NowDayHits=1

     UPDATE [KS_KeyTags] Set TagsHits=@NowDayHits,WeekHits=@NowWeekHits,YesterDayHits=@NowYesterDayHits,TodayHits=@NowDayHits,LastUseTime=GetDate()  Where KeyText=@KeyText
GO
/****** Object:  Table [dbo].[KS_User]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL,
	[AskRankId] [int] NULL,
	[DepartId] [int] NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](100) NULL,
	[Question] [nvarchar](50) NULL,
	[Answer] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[RealName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[IsMobileRZ] [tinyint] NULL,
	[Sex] [nvarchar](50) NULL,
	[Birthday] [nvarchar](50) NULL,
	[IDCard] [nvarchar](50) NULL,
	[ProId] [int] NULL,
	[CityId] [int] NULL,
	[CountyId] [int] NULL,
	[Address] [nvarchar](200) NULL,
	[HomePage] [nvarchar](50) NULL,
	[UserFace] [varchar](255) NULL,
	[Sign] [ntext] NULL,
	[Privacy] [int] NULL,
	[CheckNum] [nvarchar](50) NULL,
	[RegDate] [datetime] NULL,
	[JoinDate] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
	[LastLoginIP] [nvarchar](50) NULL,
	[LoginTimes] [int] NULL,
	[ChargeType] [int] NULL,
	[BeginDate] [datetime] NULL,
	[EDays] [int] NULL,
	[Money] [money] NULL,
	[Score] [int] NULL,
	[ScoreHasUse] [int] NULL,
	[Point] [money] NULL,
	[Locked] [int] NULL,
	[RndPassword] [nvarchar](50) NULL,
	[companyname] [nvarchar](255) NULL,
	[zipcode] [nvarchar](255) NULL,
	[interest] [nvarchar](200) NULL,
	[intro] [ntext] NULL,
	[qqtoken] [nvarchar](50) NULL,
	[qqopenid] [nvarchar](50) NULL,
	[SinaId] [nvarchar](50) NULL,
	[SinaToken] [nvarchar](50) NULL,
	[AlipayID] [nvarchar](50) NULL,
	[IsApi] [tinyint] NULL,
	[Agent] [nvarchar](50) NULL,
	[WeiXinOpenID] [nvarchar](50) NULL,
	[UserQQ] [varchar](255) NULL,
	[UnionID] [varchar](255) NULL,
	[AppID] [varchar](255) NULL,
	[IsWeixinUnBind] [tinyint] NULL,
	[LoadType] [tinyint] NULL,
	[Enddate] [datetime] NULL,
	[PUserId] [int] NULL,
	[PPUserId] [int] NULL,
 CONSTRAINT [PK_KS_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [GroupID] ON [KS_User] 
(
	[GroupID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_User] 
(
	[UserID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDCard] ON [KS_User] 
(
	[IDCard] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [VerificCode] ON [KS_User] 
(
	[CheckNum] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属用户组ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属问答等级ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'AskRankId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属部门ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'DepartId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密码（MD5加密）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'PassWord'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提问问题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Question'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问题答案' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Answer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手机是否经过实名认证' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'IsMobileRZ'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出生日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'IDCard'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'ProId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'CityId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城镇ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'CountyId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'个人主页' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'HomePage'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'UserFace'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'签名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Sign'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'隐私设置' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Privacy'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'激活码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'CheckNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'注册日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'RegDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'加入日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'JoinDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录的时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'LastLoginTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录的IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'LastLoginIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'登录次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'LoginTimes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收费模式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'ChargeType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收费开始日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'有效天数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'EDays'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'可用金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Money'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'可用积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'已消费积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'ScoreHasUse'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'可用点券' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Point'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'0 正常 1锁定 2待人工审核 3待邮件验证' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Locked'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'随机密码（用于防止多人同时登录）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'RndPassword'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'companyname'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'zipcode'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'qq接口返回的token值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'qqtoken'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'qq登录接口返回的openid' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'qqopenid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'新浪微博接口返回的用户id' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'SinaId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'新浪微博接口返回的用户token' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'SinaToken'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付宝快捷登录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'AlipayID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是不是通过第三方快速注册登录的' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'IsApi'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'Agent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'微信OpenID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_User', @level2type=N'COLUMN',@level2name=N'WeiXinOpenID'
GO
/****** Object:  Table [dbo].[KS_JSFile]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_JSFile](
	[JSID] [int] IDENTITY(1,1) NOT NULL,
	[JSName] [nvarchar](100) NULL,
	[JSFileName] [nvarchar](100) NULL,
	[JSConfig] [ntext] NULL,
	[JSType] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
	[OrderID] [tinyint] NULL,
	[ClassID] [int] NULL,
	[From3g] [tinyint] NULL,
	[TemplateID] [int] NULL,
 CONSTRAINT [PK_KS_JSFile] PRIMARY KEY CLUSTERED 
(
	[JSID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ClassID] ON [KS_JSFile] 
(
	[ClassID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'JS名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_JSFile', @level2type=N'COLUMN',@level2name=N'JSName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'JS生成的文件名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_JSFile', @level2type=N'COLUMN',@level2name=N'JSFileName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'JS配置信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_JSFile', @level2type=N'COLUMN',@level2name=N'JSConfig'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'JS类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_JSFile', @level2type=N'COLUMN',@level2name=N'JSType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_JSFile', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_JSFile', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_JSFile', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_JSFile', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否手机版建的JS' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_JSFile', @level2type=N'COLUMN',@level2name=N'From3g'
GO
/****** Object:  Table [dbo].[KS_ProOrderService]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProOrderService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [varchar](50) NULL,
	[Content] [ntext] NULL,
	[adddate] [datetime] NULL,
	[qsr] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_KS_ProOrderService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderService', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'服务内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderService', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderService', @level2type=N'COLUMN',@level2name=N'adddate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'签收人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderService', @level2type=N'COLUMN',@level2name=N'qsr'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'服务人员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderService', @level2type=N'COLUMN',@level2name=N'UserName'
GO
/****** Object:  Table [dbo].[KS_ProLimitBuy]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProLimitBuy](
	[taskid] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](255) NOT NULL,
	[TaskType] [int] NULL,
	[LimitBuyBeginTime] [datetime] NULL,
	[LimitBuyEndTime] [datetime] NULL,
	[LimitBuyPayTime] [int] NULL,
	[Intro] [ntext] NULL,
	[Status] [tinyint] NULL,
	[AddDate] [smalldatetime] NULL,
	[TemplateFile] [nvarchar](255) NULL,
	[Recommend] [tinyint] NULL,
	[PhotoUrl] [varchar](255) NULL,
	[JGRange] [varchar](255) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyId] [int] NULL,
 CONSTRAINT [PK_KS_ProLimitBuy] PRIMARY KEY CLUSTERED 
(
	[taskid] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量项目记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'taskid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量任务名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'TaskName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'类型 1限时 2限量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'TaskType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量开始时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'LimitBuyBeginTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量结束时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'LimitBuyEndTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量最迟付款时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'LimitBuyPayTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量任务介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量任务状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量绑定的模板文件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'TemplateFile'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'Recommend'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量任务封面图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量价格范围' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'JGRange'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'ProvinceID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城镇ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLimitBuy', @level2type=N'COLUMN',@level2name=N'CountyId'
GO
/****** Object:  Table [dbo].[KS_ProStore]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProStore](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[Address] [nvarchar](255) NULL,
	[Tel] [nvarchar](50) NULL,
	[Intro] [ntext] NULL,
	[ContactMan] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[OrderID] [int] NULL,
	[storeType] [int] NULL,
 CONSTRAINT [PK_KS_ProShop] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'店铺名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProStore', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所在省份ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProStore', @level2type=N'COLUMN',@level2name=N'ProvinceID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所在城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProStore', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProStore', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProStore', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'简要介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProStore', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'负责人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProStore', @level2type=N'COLUMN',@level2name=N'ContactMan'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProStore', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProStore', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
/****** Object:  Table [dbo].[KS_Template]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Template](
	[TemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](250) NULL,
	[Author] [varchar](250) NULL,
	[TemplateEname] [nvarchar](250) NULL,
	[IsDefault] [int] NULL,
	[DefaultPic] [nvarchar](150) NULL,
	[AddDate] [datetime] NULL,
	[TemplateType] [int] NULL,
	[GroupLevel] [varchar](255) NULL,
	[OriTemplateID] [int] NULL,
	[Intro] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProGroupOne]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProGroupOne](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) NULL,
	[PhotoUrl] [nvarchar](200) NULL,
	[BigPhoto] [nvarchar](250) NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[BigClassID] [int] NULL,
	[ClassID] [int] NULL,
	[Intro] [ntext] NULL,
	[Locked] [tinyint] NULL,
	[EndTF] [tinyint] NULL,
	[AllowBMFlag] [tinyint] NULL,
	[AllowArrGroupID] [nvarchar](200) NULL,
	[IsSuccess] [tinyint] NULL,
	[Price_Original] [money] NULL,
	[Price] [money] NULL,
	[Weight] [real] NULL,
	[Unit] [varchar](50) NULL,
	[LimitBuyNum] [int] NULL,
	[Recommend] [tinyint] NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[HasSellNum] [int] NULL,
	[RealSellNum] [int] NULL,
	[ShowDelivery] [tinyint] NULL,
	[Comment] [tinyint] NULL,
	[ChangesUrl] [nvarchar](255) NULL,
	[TemplateID] [nvarchar](255) NULL,
	[MapMarker] [nvarchar](255) NULL,
	[Inputer] [varchar](50) NULL,
	[IsBusiness] [tinyint] NULL,
	[FreightType] [tinyint] NULL,
	[Freight] [money] NULL,
	[Amount] [int] NULL,
	[AmountNum] [int] NULL,
	[PayID] [int] NULL,
	[GroupNum] [int] NULL,
	[Issue] [int] NULL,
	[CountDown] [int] NULL,
	[Progress] [smallmoney] NULL,
	[CmtNum] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProComment]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [varchar](50) NULL,
	[ProID] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[UserIP] [varchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Content] [text] NULL,
	[StarNum] [int] NULL,
	[CmtType] [tinyint] NULL,
	[Support] [int] NULL,
	[CmtNum] [int] NULL,
	[BuyDate] [datetime] NULL,
	[ProAttr] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[OrderType] [tinyint] NULL,
	[PhotoUrls] [text] NULL,
	[AddContent] [text] NULL,
	[AddContentTime] [datetime] NULL,
	[IsReply] [int] NULL,
	[ReplyContent] [ntext] NULL,
	[ReplyUser] [nvarchar](100) NULL,
	[ReplyDate] [datetime] NULL,
 CONSTRAINT [PK_KS_ProComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自动编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'ProID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论者用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论人IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'UserIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发表时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发表内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'星星数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'StarNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'0好评 1中评 2差评' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'CmtType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支持数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'Support'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'CmtNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购买日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'BuyDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购买的商品属性' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'ProAttr'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否审核' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'0普通订单 1团购订单' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'OrderType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'晒图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'PhotoUrls'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'追加评价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'AddContent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'追回评价时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProComment', @level2type=N'COLUMN',@level2name=N'AddContentTime'
GO
/****** Object:  Table [dbo].[KS_ProSpecification]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProSpecification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[ShowType] [tinyint] NULL,
	[SValue] [ntext] NULL,
	[orderid] [int] NULL,
 CONSTRAINT [PK_KS_ShopSpecification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecification', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品规格名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecification', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecification', @level2type=N'COLUMN',@level2name=N'ShowType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecification', @level2type=N'COLUMN',@level2name=N'SValue'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecification', @level2type=N'COLUMN',@level2name=N'orderid'
GO
/****** Object:  Table [dbo].[KS_ProOrderItem]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProOrderItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[InfoID] [int] NULL,
	[Price_Market] [money] NULL,
	[Price_Cost] [money] NULL,
	[Price] [money] NULL,
	[num] [int] NULL,
	[TotalPrice] [money] NULL,
	[AttrID] [int] NULL,
	[IsChangeBuy] [tinyint] NULL,
	[Remark] [nvarchar](255) NULL,
	[LimitBuyTaskID] [int] NULL,
	[IsLimitBuy] [int] NULL,
	[IsBundleSale] [tinyint] NULL,
	[ChangeScore] [int] NULL,
	[FreightType] [tinyint] NULL,
	[Freight] [money] NULL,
	[Business] [nvarchar](50) NULL,
	[CityID] [int] NULL,
	[BookCode] [varchar](50) NULL,
	[IsCmt] [tinyint] NULL,
	[channelid] [int] NULL,
 CONSTRAINT [PK_KS_ProOrderItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单项记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属订单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'市场价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'Price_Market'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'进货价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'Price_Cost'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'单价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购买数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'num'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'小计' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'TotalPrice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品规格属性ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'AttrID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否换购' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'IsChangeBuy'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量任务ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'LimitBuyTaskID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否限时限量购买' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'IsLimitBuy'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否捆绑定销售' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'IsBundleSale'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'ChangeScore'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否包邮 0包邮 1不包邮' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'FreightType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'Freight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商家名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'Business'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邀请码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'BookCode'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否说评价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderItem', @level2type=N'COLUMN',@level2name=N'IsCmt'
GO
/****** Object:  Table [dbo].[KS_U_download]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_U_download](
	[InfoID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[Category] [nvarchar](200) NULL,
	[Language] [nvarchar](200) NULL,
	[Authorization] [nvarchar](200) NULL,
	[Platform] [nvarchar](255) NULL,
	[FileSize] [nvarchar](100) NULL,
	[Details] [ntext] NULL,
	[syxt] [nvarchar](255) NULL,
	[rjxj] [nvarchar](255) NULL,
	[rjlx] [nvarchar](255) NULL,
	[yuyan] [nvarchar](255) NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[TitleFontColor] [nvarchar](50) NULL,
	[Attribute] [nvarchar](255) NULL,
	[DefaultPic] [nvarchar](255) NULL,
	[TurnUrl] [nvarchar](255) NULL,
	[priority] [int] NULL,
	[Hits] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[VoteID] [int] NULL,
	[TemplateFile] [nvarchar](255) NULL,
	[Template3GFile] [nvarchar](255) NULL,
	[ShowON3G] [tinyint] NULL,
	[FileName] [nvarchar](255) NULL,
	[RefreshTF] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[DelTF] [tinyint] NULL,
	[Inputer] [nvarchar](100) NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[SocialIDs] [nvarchar](255) NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWords] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](255) NULL,
	[CommentNum] [int] NULL,
	[CopyFrom] [nvarchar](255) NULL,
	[Author] [nvarchar](255) NULL,
	[ProvinceID] [int] NULL,
	[ArrGroupID] [nvarchar](255) NULL,
	[ReadPoint] [money] NULL,
	[ChargeType] [tinyint] NULL,
	[PitchTime] [int] NULL,
	[ReadTimes] [int] NULL,
	[DividePercent] [int] NULL,
	[PKID] [int] NULL,
	[InfoPurview] [tinyint] NULL,
	[ChannelID] [int] NULL,
	[GoodNum] [int] NULL,
	[BadNum] [int] NULL,
	[FavNum] [int] NULL,
	[ShareNum] [int] NULL,
 CONSTRAINT [PK_KS_U_download] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_download', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_download', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_download', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档详细内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_download', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'类别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_download', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'语言' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_download', @level2type=N'COLUMN',@level2name=N'Language'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'授权' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_download', @level2type=N'COLUMN',@level2name=N'Authorization'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'运行平台' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_download', @level2type=N'COLUMN',@level2name=N'Platform'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'软件大小' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_download', @level2type=N'COLUMN',@level2name=N'FileSize'
GO
/****** Object:  Table [dbo].[KS_ProCommentReply]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProCommentReply](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [text] NULL,
	[adddate] [datetime] NULL,
	[status] [tinyint] NULL,
	[username] [varchar](50) NULL,
	[userip] [varchar](50) NULL,
	[cmtid] [int] NULL,
	[userid] [int] NULL,
 CONSTRAINT [PK_KS_ProCommentReply] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复评论内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCommentReply', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCommentReply', @level2type=N'COLUMN',@level2name=N'adddate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCommentReply', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCommentReply', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCommentReply', @level2type=N'COLUMN',@level2name=N'userip'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评价ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCommentReply', @level2type=N'COLUMN',@level2name=N'cmtid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCommentReply', @level2type=N'COLUMN',@level2name=N'userid'
GO
/****** Object:  Table [dbo].[KS_Advertise]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Advertise](
	[adid] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[boardid] [nvarchar](255) NULL,
	[AdType] [int] NULL,
	[ShowType] [int] NULL,
	[LinkUrl] [nvarchar](255) NULL,
	[LinkTips] [nvarchar](255) NULL,
	[LinkTarget] [int] NULL,
	[Content] [ntext] NULL,
	[PicFlashUrl] [nvarchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Clicks] [int] NULL,
	[Views] [int] NULL,
	[TimeLimit] [int] NULL,
	[BeginDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[Status] [int] NULL,
	[RecordClickIP] [tinyint] NULL,
	[ClickAddScorePerTime] [int] NULL,
	[ClickScore] [int] NULL,
 CONSTRAINT [PK_KS_Advertise] PRIMARY KEY CLUSTERED 
(
	[adid] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [id] ON [KS_Advertise] 
(
	[adid] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告条ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'adid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告条名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'boardid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'AdType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'ShowType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'链接地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'LinkUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'链接提示' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'LinkTips'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'链接目标' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'LinkTarget'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'图片或是flash地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'PicFlashUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'宽度' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'Width'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'高度' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'Height'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点击数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'Clicks'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'Views'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否时间限制标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'TimeLimit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'ExpireDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位状态标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否记录点击IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'RecordClickIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'隔多长时间点广告加积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'ClickAddScorePerTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点击广告条赠送积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Advertise', @level2type=N'COLUMN',@level2name=N'ClickScore'
GO
/****** Object:  StoredProcedure [dbo].[KS_ModelGetMaxID]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_ModelGetMaxID] AS

 declare @modelid int
 if (exists(select top 1 channelid from ks_model))
   begin
    select @modelid=max(channelid) from ks_model
    set @modelid=@modelid+1
   end 
 else
   begin
   set @modelid=1
   end
   select @modelid
GO
/****** Object:  StoredProcedure [dbo].[KS_ProLimitBuyDel]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_ProLimitBuyDel] 
@ids varchar(1000)
AS
 if (@ids<>'')
  begin
  declare @sql nvarchar(4000)
  set @sql='delete from [KS_ProLimitBuy] Where TaskID in('+@ids+')'
  exec (@sql)
  set @sql='delete from [KS_UploadFiles] Where channelid=100002 and infoid in('+@ids+')'
  exec(@sql)
  set @sql='update [KS_ProductList] Set IsLimitBuy=0,LimitBuyTaskID=0,LimitBuyPrice=0,LimitBuyAmount=0 Where LimitBuyTaskID in('+@ids+')'
  exec (@sql)
 end
GO
/****** Object:  Table [dbo].[KS_Class]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Class](
	[ClassID] [int] NOT NULL,
	[ChannelID] [smallint] NULL,
	[ClassName] [nvarchar](100) NULL,
	[ClassEname] [nvarchar](150) NULL,
	[ParentID] [int] NULL,
	[Root] [int] NULL,
	[Depth] [tinyint] NULL,
	[OrderID] [int] NULL,
	[ParentIDPath] [varchar](1500) NULL,
	[Child] [int] NULL,
	[PrevID] [int] NULL,
	[NextID] [int] NULL,
	[ClassDir] [varchar](255) NULL,
	[ClassType] [tinyint] NULL,
	[UserName] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[ClassTemplate] [nvarchar](255) NULL,
	[ContentTemplate] [nvarchar](255) NULL,
	[Class3GTemplate] [nvarchar](255) NULL,
	[Content3GTemplate] [nvarchar](255) NULL,
	[ShowInTop] [tinyint] NULL,
	[ShowOn3G] [tinyint] NULL,
	[ShowInCir] [tinyint] NULL,
	[AllowPubInfo] [tinyint] NULL,
	[PubFlag] [tinyint] NULL,
	[AllowPubGroupID] [varchar](255) NULL,
	[PubAddMoney] [int] NULL,
	[PubAddPoint] [int] NULL,
	[PubAddScore] [int] NULL,
	[CmtAddScore] [int] NULL,
	[ShareAddScore] [int] NULL,
	[CreateHtmlFlag] [tinyint] NULL,
	[AutoCreateType] [tinyint] NULL,
	[ClassFsoIndex] [varchar](50) NULL,
	[ClassFsoDirRule] [int] NULL,
	[ClassFsoPre] [nvarchar](50) NULL,
	[CreateInfoPath] [varchar](200) NULL,
	[CreateInfoFname] [varchar](150) NULL,
	[ClassDomain] [varchar](100) NULL,
	[DomainBindType] [tinyint] NULL,
	[ClassPurview] [smallint] NULL,
	[DefaultArrGroupID] [nvarchar](255) NULL,
	[DefaultReadPoint] [smallint] NULL,
	[DefaultChargeType] [smallint] NULL,
	[DefaultPitchTime] [smallint] NULL,
	[DefaultReadTimes] [smallint] NULL,
	[DefaultDividePercent] [smallint] NULL,
	[ClassBasicInfo] [ntext] NULL,
	[ClassDefineContent] [ntext] NULL,
	[AdminPurview] [ntext] NULL,
	[InfoNum] [int] NULL,
	[ProSpecialID] [int] NULL,
 CONSTRAINT [PK_KS_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_KS_Class] ON [KS_Class] 
(
	[ClassType] ASC,
	[CreateHtmlFlag] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NextID] ON [KS_Class] 
(
	[NextID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PreID] ON [KS_Class] 
(
	[PrevID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目中文名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目英文名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassEname'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'父栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'级别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'Root'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目深度' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'Depth'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'对应的栏目ID集合' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ParentIDPath'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'子栏目数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'Child'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'上一个栏目的ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'PrevID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下一个栏目的ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'NextID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生成静态的路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassDir'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创始人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassTemplate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'内容模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ContentTemplate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手机版栏目模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'Class3GTemplate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手机版内容模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'Content3GTemplate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'导航栏目标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ShowInTop'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示在3G版本上' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ShowOn3G'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目循环里显示标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ShowInCir'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许投稿标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'AllowPubInfo'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许在本栏目下发表' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'PubFlag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许投稿的用户组' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'AllowPubGroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'投稿赠送资金' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'PubAddMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'投稿赠送点券' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'PubAddPoint'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'投稿赠送积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'PubAddScore'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论赠送积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'CmtAddScore'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点分享赠送积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ShareAddScore'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生成HTML标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'CreateHtmlFlag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自动生成的选项' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'AutoCreateType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目生成首页文件名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassFsoIndex'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目页生成的路径规则' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassFsoDirRule'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目页生成的前缀' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassFsoPre'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'内容页生成路径规则' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'CreateInfoPath'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'内容页生成文件名规则' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'CreateInfoFname'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目绑定的域名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassDomain'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'二级域名绑定方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'DomainBindType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目浏览权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassPurview'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认允许浏览的用户组ID集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'DefaultArrGroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认查看本栏目下收费点券数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'DefaultReadPoint'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认本栏目下文档的收费方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'DefaultChargeType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'距离上次收费时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'DefaultPitchTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'会员重复阅读次数重新收费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'DefaultReadTimes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'与投稿者的分成比率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'DefaultDividePercent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目的配置信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassBasicInfo'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目的自定义内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ClassDefineContent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'AdminPurview'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'本栏目下文档数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'InfoNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商城绑定的规格组ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Class', @level2type=N'COLUMN',@level2name=N'ProSpecialID'
GO
/****** Object:  Table [dbo].[KS_ProSpecificationR]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProSpecificationR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[SID] [int] NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_KS_ProSpecificationR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationR', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationR', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品规格属性ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProSpecificationR', @level2type=N'COLUMN',@level2name=N'SID'
GO
/****** Object:  Table [dbo].[KS_ProInvoice]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProInvoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[InvoiceType] [tinyint] NULL,
	[TitleType] [tinyint] NULL,
	[CompanyName] [nvarchar](255) NULL,
	[NSRSBH] [varchar](100) NULL,
	[Address] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Bank] [nvarchar](255) NULL,
	[BankNum] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[IsDefault] [tinyint] NULL,
	[ContactMan] [nvarchar](255) NULL,
	[Mobile] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyId] [int] NULL,
	[ContactAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_KS_ProInvoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发票类型 0普通发票 1增值税发票' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'InvoiceType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'抬头类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'TitleType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'纳税人识别号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'NSRSBH'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'注册地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'注册电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开户银行' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'Bank'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'银行账号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'BankNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收票人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'ContactMan'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收票人手机' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收票人省份' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'ProvinceID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收票人城市' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收票人城镇' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'CountyId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收票人地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProInvoice', @level2type=N'COLUMN',@level2name=N'ContactAddress'
GO
/****** Object:  StoredProcedure [dbo].[KS_ProLimtBuyStatus]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_ProLimtBuyStatus] 
 @taskIds nvarchar(4000)
AS
  if @taskIds=''
  return null
 else
  begin

    declare @sql nvarchar(4000),@taskid int,@status int
    set @sql='declare rs cursor for select taskid,status From KS_ProLimitBuy Where taskid in('+@taskIds+')'
    exec (@sql)
     open rs
     fetch next from rs
     into @taskid,@status
     while @@fetch_status=0
     begin
         if @status=1
           update KS_ProLimitBuy Set Status=0 Where taskid=@taskid
        else
          update KS_ProLimitBuy Set Status=1 Where taskid=@taskid
         fetch next from rs
         into @taskid,@status
     end
     close rs
     deallocate rs
 end
GO
/****** Object:  Table [dbo].[KS_Link]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Link](
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[SiteName] [nvarchar](255) NULL,
	[WebMaster] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Url] [nvarchar](255) NULL,
	[Password] [nvarchar](50) NULL,
	[LinkType] [int] NULL,
	[Logo] [nvarchar](150) NULL,
	[Description] [ntext] NULL,
	[Hits] [int] NULL,
	[Recommend] [int] NULL,
	[AddDate] [datetime] NULL,
	[Locked] [tinyint] NULL,
	[Verify] [int] NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_KS_Link] PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FolderID] ON [KS_Link] 
(
	[ClassID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_Link] 
(
	[LinkID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'LinkID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'网站名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'SiteName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'站长' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'WebMaster'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'网址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'管理密码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'链接类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'LinkType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'LOGO图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'Logo'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'站点描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点击数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'Hits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'Recommend'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'锁定标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'Locked'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'审核标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Link', @level2type=N'COLUMN',@level2name=N'Verify'
GO
/****** Object:  StoredProcedure [dbo].[KS_ItemHits]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_ItemHits] 
 @Action varchar(50),
 @InfoID Int=0,
 @GetFlag int=0,
 @BasicType int=0,
 @OutHits int output
AS

  DECLARE @Hits int ,@dayhits int,@weekhits int,@monthhits int,@LastHitsTime datetime
  DECLARE @nowDayHits int ,@NowWeekHits int, @NowMonthHits int, @NowHits int
 If @BasicType=4 
    SELECT top 1 @Hits=Hits ,@DayHits=HitsByDay,@weekhits=HitsByWeek,@monthHits=HitsByMonth,@LastHitsTime=LastHitsTime FROM [KS_ProductList] WHERE InfoID=@InfoID
 Else
    SELECT top 1 @Hits=Hits ,@DayHits=HitsByDay,@weekhits=HitsByWeek,@monthHits=HitsByMonth,@LastHitsTime=LastHitsTime FROM [KS_InfoList] WHERE InfoID=@InfoID
  If @Action='count'
   BEGIN
     Set @NowHits=@Hits+1
     If DateDiff(week,@LastHitsTime, GetDate())<=0
       SET @NowWeekHits=@WeekHits+1
     Else
      SET @NowWeekHits=1
     IF DateDiff(month,@LastHitsTime,GetDate())<=0
      SET @NowMonthHits=@MonthHits+1
    ELSE
     SET @NowMonthHits=1
    IF DateDiff(day,@LastHitsTime,GetDate())<=0
     SET @NowDayHits=@DayHits+1
   Else
     Set @NowDayHits=1
   If @BasicType=4 
    UPDATE [KS_ProductList] Set Hits=@NowHits,HitsByWeek=@NowWeekHits,HitsByMonth=@NowMonthHits,HitsByDay=@NowDayHits,LastHitsTime=GetDate()  Where InfoID=@InfoID
    Else
     UPDATE [KS_InfoList] Set Hits=@NowHits,HitsByWeek=@NowWeekHits,HitsByMonth=@NowMonthHits,HitsByDay=@NowDayHits,LastHitsTime=GetDate()  Where InfoID=@InfoID

  END 
 Else
   Begin
     Set @NowHits=@Hits
     Set @NowDayHits=@DayHits
     Set @NowWeekHits=@WeekHits
     Set @NowMonthHits=@MonthHits
  END

  If @GetFlag=0 
     SELECT @OutHits= @NowHits
  Else If @GetFlag=1
     SELECT @OutHits= @NowDayHits
  Else If @GetFlag=2 
     SELECT @OutHits= @NowWeekHits
  Else If @GetFlag=3
     SELECT @OutHits=  @NowMonthHits
  Else
     SELECT @OutHits=  0
GO
/****** Object:  Table [dbo].[KS_ProGroupBuyConsumer]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProGroupBuyConsumer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[AddDate] [datetime] NULL,
	[OrderID] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Remark] [ntext] NULL,
	[Times] [int] NULL,
	[Mobile] [varchar](50) NULL,
 CONSTRAINT [PK_KS_ProGroupBuyConsumer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyConsumer', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyConsumer', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'消费时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyConsumer', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyConsumer', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyConsumer', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'消费次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyConsumer', @level2type=N'COLUMN',@level2name=N'Times'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'客户手机号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuyConsumer', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
/****** Object:  Table [dbo].[KS_CollectionHistory]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_CollectionHistory](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NULL,
	[ModelID] [int] NULL,
	[InfoID] [int] NULL,
	[ClassID] [int] NULL,
	[Title] [varchar](255) NULL,
	[ItemUrl] [varchar](255) NULL,
	[Remark] [varchar](255) NULL,
	[IsSucceed] [int] NULL,
	[RecordTime] [datetime] NULL,
 CONSTRAINT [PK_KS_CollectionHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集历史记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionHistory', @level2type=N'COLUMN',@level2name=N'HistoryID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集项目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionHistory', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionHistory', @level2type=N'COLUMN',@level2name=N'ModelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionHistory', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionHistory', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionHistory', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集的URL' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionHistory', @level2type=N'COLUMN',@level2name=N'ItemUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionHistory', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否采集成功' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionHistory', @level2type=N'COLUMN',@level2name=N'IsSucceed'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionHistory', @level2type=N'COLUMN',@level2name=N'RecordTime'
GO
/****** Object:  Table [dbo].[KS_ProBundleSale]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProBundleSale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[infoid] [int] NULL,
	[kbinfoid] [int] NULL,
	[kbprice] [money] NULL,
	[attrid] [int] NULL,
 CONSTRAINT [PK_KS_ProBundleSale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSale', @level2type=N'COLUMN',@level2name=N'infoid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'捆绑销售的商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSale', @level2type=N'COLUMN',@level2name=N'kbinfoid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'捆绑销售价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSale', @level2type=N'COLUMN',@level2name=N'kbprice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品属性id' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSale', @level2type=N'COLUMN',@level2name=N'attrid'
GO
/****** Object:  Table [dbo].[KS_AskTable]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_AskTable](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NULL,
	[TableName] [varchar](100) NULL,
	[IsDefault] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[IsSys] [tinyint] NULL,
 CONSTRAINT [PK_KS_AskPostTable] PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问答回复表ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTable', @level2type=N'COLUMN',@level2name=N'TableId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'表别名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTable', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'数据表名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTable', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTable', @level2type=N'COLUMN',@level2name=N'IsDefault'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTable', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统自带的表' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTable', @level2type=N'COLUMN',@level2name=N'IsSys'
GO
/****** Object:  Table [dbo].[KS_PKGD]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_PKGD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PKID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[UserIP] [nvarchar](50) NULL,
	[Status] [tinyint] NULL,
	[AddDate] [smalldatetime] NULL,
	[Role] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_KS_PKGD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKGD', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'PK项目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKGD', @level2type=N'COLUMN',@level2name=N'PKID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKGD', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'PK内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKGD', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKGD', @level2type=N'COLUMN',@level2name=N'UserIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKGD', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提交观点的时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKGD', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提交角色' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKGD', @level2type=N'COLUMN',@level2name=N'Role'
GO
/****** Object:  Table [dbo].[KS_ProGroupBuy]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProGroupBuy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) NULL,
	[PhotoUrl] [nvarchar](200) NULL,
	[BigPhoto] [nvarchar](250) NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[BigClassID] [int] NULL,
	[ClassID] [int] NULL,
	[Intro] [ntext] NULL,
	[Highlights] [ntext] NULL,
	[Protection] [ntext] NULL,
	[Notes] [ntext] NULL,
	[Locked] [tinyint] NULL,
	[EndTF] [tinyint] NULL,
	[AllowBMFlag] [tinyint] NULL,
	[AllowArrGroupID] [nvarchar](200) NULL,
	[minnum] [int] NULL,
	[minnumtime] [datetime] NULL,
	[IsSuccess] [tinyint] NULL,
	[Price_Original] [money] NULL,
	[Price] [money] NULL,
	[Discount] [real] NULL,
	[Weight] [real] NULL,
	[Unit] [varchar](50) NULL,
	[LimitBuyNum] [int] NULL,
	[Recommend] [tinyint] NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[HasSellNum] [int] NULL,
	[RealSellNum] [int] NULL,
	[CleanCart] [tinyint] NULL,
	[ShowDelivery] [tinyint] NULL,
	[ShowPayMent] [tinyint] NULL,
	[Comment] [tinyint] NULL,
	[ChangesUrl] [nvarchar](255) NULL,
	[TemplateID] [nvarchar](255) NULL,
	[MapMarker] [nvarchar](255) NULL,
	[Inputer] [varchar](50) NULL,
	[IsBusiness] [tinyint] NULL,
	[FreightType] [tinyint] NULL,
	[Freight] [money] NULL,
	[Amount] [int] NULL,
	[AmountNum] [int] NULL,
	[PayID] [int] NULL,
	[CmtNum] [int] NULL,
 CONSTRAINT [PK_KS_ProGroupBuy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购商品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购商品小图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购商品大图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'BigPhoto'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购开始时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购结束时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购商品添加日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购商品大类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'BigClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购商品小类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购商品介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购商品精彩卖点' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Highlights'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购保障' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Protection'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'温馨提示' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'锁定标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Locked'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'结束标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'EndTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'许参加团购的权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'AllowBMFlag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许参加团购的会员组' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'AllowArrGroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最低人数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'minnum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'达到最低团购人数的时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'minnumtime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否成功团购标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'IsSuccess'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'原价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Price_Original'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'团购价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'重量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Unit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'每人限制购买' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'LimitBuyNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Recommend'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'ProvinceID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'已销售量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'HasSellNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'实际销售量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'RealSellNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'清空购物车' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'CleanCart'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示物流信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'ShowDelivery'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示支付方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'ShowPayMent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许评论' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Comment'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购买链接' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'ChangesUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定的模板文件路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'TemplateID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'地图标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'MapMarker'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Inputer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否商家发布' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'IsBusiness'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'运费方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'FreightType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Freight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'库存量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'库存报警' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'AmountNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收款账号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProGroupBuy', @level2type=N'COLUMN',@level2name=N'PayID'
GO
/****** Object:  Table [dbo].[KS_ProBookCodeType]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProBookCodeType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](255) NULL,
	[note] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[CityNum] [int] NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsOpenApply] [tinyint] NULL,
	[ApplyMustLogin] [tinyint] NULL,
	[ApplyNum] [int] NULL,
	[DefaultPic] [varchar](255) NULL,
	[UseApplyCity] [tinyint] NULL,
	[TemplateFile] [nvarchar](255) NULL,
	[Intro] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邀请码分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCodeType', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCodeType', @level2type=N'COLUMN',@level2name=N'note'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'每个城市允许申请数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCodeType', @level2type=N'COLUMN',@level2name=N'CityNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开始申请时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCodeType', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'结束申请时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCodeType', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开放申请' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCodeType', @level2type=N'COLUMN',@level2name=N'IsOpenApply'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'登录会员才可申请' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCodeType', @level2type=N'COLUMN',@level2name=N'ApplyMustLogin'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'每个会员限制申请张数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCodeType', @level2type=N'COLUMN',@level2name=N'ApplyNum'
GO
/****** Object:  Table [dbo].[KS_PKZT]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_PKZT](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[ZFGD] [text] NULL,
	[FFGD] [text] NULL,
	[UserTF] [tinyint] NULL,
	[OnceTF] [tinyint] NULL,
	[VerifyTF] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[TimeLimit] [tinyint] NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[InfoID] [int] NULL,
	[ZFVotes] [int] NULL,
	[FFVotes] [int] NULL,
	[SFVotes] [int] NULL,
 CONSTRAINT [PK_KS_PKZT] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'PKID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'PK标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'正方观点' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'ZFGD'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'反方观点' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'FFGD'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'只允许会员参与PK' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'UserTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'每个用户只能参与PK一次' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'OnceTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户PK意见需要审核' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'VerifyTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用时间限制' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'TimeLimit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过期时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'对应的文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'正方票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'ZFVotes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'反方票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'FFVotes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'第三方票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PKZT', @level2type=N'COLUMN',@level2name=N'SFVotes'
GO
/****** Object:  Table [dbo].[KS_ProductList]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProductList](
	[InfoID] [int] IDENTITY(1,1) NOT NULL,
	[ProID] [nvarchar](20) NOT NULL,
	[ChannelID] [int] NULL,
	[ClassID] [int] NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NOT NULL,
	[TitleFontColor] [nvarchar](20) NULL,
	[ProductType] [int] NULL,
	[Attribute] [nvarchar](255) NULL,
	[BarCode] [nvarchar](100) NULL,
	[Unit] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[DefaultPic] [nvarchar](255) NULL,
	[BigPhoto] [nvarchar](255) NULL,
	[Intro] [nvarchar](300) NULL,
	[TurnUrl] [nvarchar](250) NULL,
	[priority] [int] NULL,
	[ProducerName] [nvarchar](50) NULL,
	[TrademarkName] [nvarchar](50) NULL,
	[ServiceTerm] [int] NULL,
	[Hits] [int] NULL,
	[BrandID] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[Amount] [int] NULL,
	[AlarmNum] [int] NULL,
	[Price] [money] NULL,
	[Price_Member] [money] NULL,
	[Price_Cost] [money] NULL,
	[GroupPrice] [tinyint] NULL,
	[TaxTF] [tinyint] NULL,
	[Tax] [float] NULL,
	[MinOrderNum] [int] NULL,
	[MaxOrderNum] [int] NULL,
	[AddDate] [datetime] NULL,
	[VoteID] [int] NULL,
	[ShowOn3G] [tinyint] NULL,
	[FileName] [nvarchar](255) NULL,
	[RefreshTF] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[Score] [int] NULL,
	[DelTF] [tinyint] NULL,
	[Inputer] [nvarchar](50) NULL,
	[IsChangeBuy] [tinyint] NULL,
	[ChangeBuyNeedPrice] [money] NULL,
	[ChangeBuyPresentPrice] [money] NULL,
	[IsLimitbuy] [tinyint] NULL,
	[LimitBuyPrice] [money] NULL,
	[LimitBuyTaskID] [int] NULL,
	[LimitBuyAmount] [int] NULL,
	[AttributeCart] [nvarchar](50) NULL,
	[HasSold] [int] NULL,
	[CommentNum] [int] NULL,
	[CmtNum] [int] NULL,
	[AskNum] [int] NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[IsScoreChange] [tinyint] NULL,
	[ChangeScore] [int] NULL,
	[SocialIDs] [varchar](255) NULL,
	[PayType] [tinyint] NULL,
	[PayID] [int] NULL,
	[FrontPrice] [money] NULL,
	[LimitBeginDate] [datetime] NULL,
	[LimitEndDate] [datetime] NULL,
	[IsBookCode] [tinyint] NULL,
	[BookCodeTypeID] [int] NULL,
	[LimitCityNum] [int] NULL,
	[IsPromotions] [tinyint] NULL,
	[IsGroupRate] [tinyint] NULL,
	[DownUrl] [varchar](255) NULL,
	[ProvinceId] [int] NULL,
	[CityId] [int] NULL,
	[CountyId] [int] NULL,
	[LimitBuyType] [int] NULL,
	[LimitBuyNum] [int] NULL,
	[GoodNum] [int] NULL,
	[BadNum] [int] NULL,
	[FavNum] [int] NULL,
	[ShareNum] [int] NULL,
	[FreightFree] [tinyint] NULL,
 CONSTRAINT [PK_KS_ProductList] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ProID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字Tags' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'KeyTags'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题颜色' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'TitleFontColor'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ProductType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品属性' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Attribute'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'条形码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'BarCode'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Unit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品重量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Weight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品首页图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'DefaultPic'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品大图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'BigPhoto'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'转向链接' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'TurnUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'优先级' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'priority'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生产商' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ProducerName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'TrademarkName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'服务年限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ServiceTerm'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'总浏览数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Hits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'所属品牌' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'BrandID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'日浏览量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'HitsByDay'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'周浏览量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'HitsByWeek'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'月浏览量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'HitsByMonth'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后浏览时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'LastHitsTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'库存量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'库存量报警' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'AlarmNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'参考价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商城价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Price_Member'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'成本价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Price_Cost'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'启用不同价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'GroupPrice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'价格含税' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'TaxTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'税率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最少订购' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'MinOrderNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最大订购' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'MaxOrderNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'投查ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'VoteID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示在3G版' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ShowOn3G'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生成的文件名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生成标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'RefreshTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'审核标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Verify'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'DelTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'Inputer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否换购商品' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'IsChangeBuy'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单满足换购金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ChangeBuyNeedPrice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'换购价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ChangeBuyPresentPrice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否限量限量抢购商品' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'IsLimitbuy'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'抢购价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'LimitBuyPrice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'抢购任务ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'LimitBuyTaskID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限制抢购数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'LimitBuyAmount'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购物车属性' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'AttributeCart'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'已销售量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'HasSold'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'CommentNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评价数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'CmtNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'售前咨询量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'AskNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下载附件费用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'AttachmentCharge'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'多个附件下载重复收费标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'AttachmentChargeOnce'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否是积分兑换品' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'IsScoreChange'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'需要的积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ChangeScore'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发布到第三方社交网站返回的ID集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'SocialIDs'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许支付订金' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收款账号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'PayID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'定金' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'FrontPrice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限制购买开始日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'LimitBeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限制购买结束日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'LimitEndDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用邀请码限制' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'IsBookCode'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定邀请码分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'BookCodeTypeID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'每个城市限购数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'LimitCityNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否参与全场促销活动' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'IsPromotions'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否参考用户组的优惠折扣' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'IsGroupRate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下载地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'DownUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'ProvinceId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'CityId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城镇ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProductList', @level2type=N'COLUMN',@level2name=N'CountyId'
GO
/****** Object:  Table [dbo].[KS_AskPost]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_AskPost](
	[postid] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NULL,
	[content] [ntext] NULL,
	[addDate] [datetime] NULL,
	[IsBest] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[UserIP] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[IsZj] [tinyint] NULL,
 CONSTRAINT [PK_KS_AskPost] PRIMARY KEY CLUSTERED 
(
	[postid] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_KS_AskPost] ON [KS_AskPost] 
(
	[IsBest] DESC,
	[postid] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_KS_AskPost_1] ON [KS_AskPost] 
(
	[UserId] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回答ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskPost', @level2type=N'COLUMN',@level2name=N'postid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问题ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskPost', @level2type=N'COLUMN',@level2name=N'TopicID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回答内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskPost', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回答时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskPost', @level2type=N'COLUMN',@level2name=N'addDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否最佳答案' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskPost', @level2type=N'COLUMN',@level2name=N'IsBest'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否审核' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskPost', @level2type=N'COLUMN',@level2name=N'Verify'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskPost', @level2type=N'COLUMN',@level2name=N'UserIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Id' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskPost', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskPost', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否专家回答' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskPost', @level2type=N'COLUMN',@level2name=N'IsZj'
GO
/****** Object:  Table [dbo].[KS_ProPaymentType]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProPaymentType](
	[Typeid] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
	[Discount] [float] NULL,
	[orderid] [int] NULL,
	[Status] [tinyint] NULL,
	[isDefault] [tinyint] NULL,
	[Intro] [nvarchar](1000) NULL,
	[TypeFlag] [tinyint] NULL,
	[PaymentIds] [nvarchar](100) NULL,
 CONSTRAINT [PK_KS_ProPaymentType] PRIMARY KEY CLUSTERED 
(
	[Typeid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProPaymentType', @level2type=N'COLUMN',@level2name=N'Typeid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'付款方式名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProPaymentType', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'付款方式折扣率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProPaymentType', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProPaymentType', @level2type=N'COLUMN',@level2name=N'orderid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProPaymentType', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProPaymentType', @level2type=N'COLUMN',@level2name=N'isDefault'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'付款方式介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProPaymentType', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'类型设置' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProPaymentType', @level2type=N'COLUMN',@level2name=N'TypeFlag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选择支付平台' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProPaymentType', @level2type=N'COLUMN',@level2name=N'PaymentIds'
GO
/****** Object:  Table [dbo].[KS_PaymentPlatItem]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_PaymentPlatItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PayId] [int] NULL,
	[AccountID] [varchar](150) NULL,
	[Md5Key] [varchar](255) NULL,
	[IsDefault] [int] NULL,
 CONSTRAINT [PK_KS_PaymentPlatItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlatItem', @level2type=N'COLUMN',@level2name=N'PayId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'平台账号ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlatItem', @level2type=N'COLUMN',@level2name=N'AccountID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'平台密钥' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlatItem', @level2type=N'COLUMN',@level2name=N'Md5Key'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PaymentPlatItem', @level2type=N'COLUMN',@level2name=N'IsDefault'
GO
/****** Object:  Table [dbo].[KS_BBSPost]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BBSPost](
	[postid] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NULL,
	[content] [nvarchar](2000) NULL,
	[addDate] [datetime] NULL,
	[Verify] [tinyint] NULL,
	[UserIP] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[Annex] [varchar](1000) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSPost', @level2type=N'COLUMN',@level2name=N'postid'
GO
/****** Object:  Table [dbo].[KS_ProOrderLog]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProOrderLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NULL,
	[Inputer] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Remark] [ntext] NULL,
	[UserName] [nvarchar](50) NULL,
	[statusCode] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderLog', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderLog', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'操作员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderLog', @level2type=N'COLUMN',@level2name=N'Inputer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderLog', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'操作说明' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderLog', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'产生记录的用户，如会员名称或管理员名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderLog', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态码 1生成订单 2支付成功 3发货成功 4确认收货 5结清订单 6开发票 7退货退款' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderLog', @level2type=N'COLUMN',@level2name=N'statusCode'
GO
/****** Object:  Table [dbo].[KS_UserPhotos]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserPhotos](
	[PicID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserName] [varchar](255) NULL,
	[TypeID] [int] NULL,
	[ClassID] [int] NULL,
	[Title] [varchar](255) NULL,
	[Tags] [varchar](255) NULL,
	[Content] [text] NULL,
	[Source] [varchar](255) NULL,
	[Author] [varchar](255) NULL,
	[Hit] [int] NULL,
	[AddDate] [datetime] NULL,
	[PhotoUrl] [varchar](255) NULL,
	[PicUrls] [text] NULL,
	[Status] [tinyint] NULL,
	[Fund] [int] NULL,
	[PageSize] [int] NULL,
	[Hot] [tinyint] NULL,
	[TopList] [tinyint] NULL,
	[Best] [tinyint] NULL,
	[Model] [int] NULL,
 CONSTRAINT [PK_KS_USERPHOTOS] PRIMARY KEY CLUSTERED 
(
	[PicID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'图片ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'PicID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户自己分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'总分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'说明内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'图片来源' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'作者' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'Author'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点击数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'Hit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'增加\修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'缩略图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主组图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'PicUrls'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否审核' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户 阅读 权限（资金）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'Fund'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'每页多少张' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'PageSize'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'热门标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'Hot'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'置顶标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'TopList'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'显示模式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos', @level2type=N'COLUMN',@level2name=N'Model'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户相册表' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserPhotos'
GO
/****** Object:  Table [dbo].[KS_WeixinPigmsg]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WeixinPigmsg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](300) NULL,
	[IsPic] [tinyint] NULL,
	[ParentID] [int] NULL,
	[Info] [varchar](600) NULL,
	[PicUrl] [varchar](600) NULL,
	[Type] [tinyint] NULL,
	[Content] [ntext] NULL,
	[Url] [varchar](600) NULL,
	[AddTime] [datetime] NULL,
	[ClassID] [nvarchar](255) NULL,
	[AddPeople] [nvarchar](50) NULL,
	[Media_ID] [varchar](600) NULL,
	[TuWenID] [varchar](100) NULL,
	[ShopID] [varchar](100) NULL,
	[TypeFlag] [tinyint] NULL,
	[Show_cover_pic] [tinyint] NULL,
	[Thumb_media_id] [varchar](600) NULL,
	[SystemType] [tinyint] NULL,
 CONSTRAINT [PK_KS_WeixinPigmsg] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'前后台标志：0代表后台，1代表前台' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WeixinPigmsg', @level2type=N'COLUMN',@level2name=N'TypeFlag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否显示封面：0不显示，1显示' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WeixinPigmsg', @level2type=N'COLUMN',@level2name=N'Show_cover_pic'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'区分系统类型：1代表图文，2商品' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WeixinPigmsg', @level2type=N'COLUMN',@level2name=N'SystemType'
GO
/****** Object:  Table [dbo].[KS_AskZJType]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_AskZJType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](100) NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_KS_AskZJType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJType', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专家类别名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJType', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJType', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
/****** Object:  Table [dbo].[KS_WeiXinQunFA]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WeiXinQunFA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SendType] [tinyint] NULL,
	[SuCaiID] [int] NULL,
	[Content] [ntext] NULL,
	[AddPeoPle] [varchar](50) NULL,
	[AddDate] [datetime] NULL,
	[TypeFlag] [tinyint] NULL,
	[TuwenID] [varchar](100) NULL,
	[ShopID] [varchar](100) NULL,
	[MassObject] [varchar](300) NULL,
	[MassStatus] [varchar](50) NULL,
	[MassMessageID] [varchar](100) NULL,
	[WeiXinOpenID] [varchar](600) NULL,
 CONSTRAINT [PK_KS_WeiXinGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_UserRecord]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserIP] [nvarchar](50) NULL,
	[flag] [int] NULL,
	[note] [nvarchar](255) NULL,
	[adddate] [datetime] NULL,
	[userid] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[orderId] [varchar](50) NULL,
 CONSTRAINT [PK_KS_UserRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'操作IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserRecord', @level2type=N'COLUMN',@level2name=N'UserIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型1管理登录错误 2会员登录 3取回密码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserRecord', @level2type=N'COLUMN',@level2name=N'flag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'操作说明' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserRecord', @level2type=N'COLUMN',@level2name=N'note'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserRecord', @level2type=N'COLUMN',@level2name=N'userid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserRecord', @level2type=N'COLUMN',@level2name=N'UserName'
GO
/****** Object:  Table [dbo].[KS_WeiXinGroupInfo]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WeiXinGroupInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [varchar](100) NULL,
	[GroupName] [varchar](100) NULL,
	[GroupCount] [int] NULL,
 CONSTRAINT [PK_KS_WeiXinGroupInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_UserDepartment]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserDepartment](
	[DepartID] [int] IDENTITY(1,1) NOT NULL,
	[DepartMentName] [nvarchar](100) NULL,
	[DepartMentEname] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[Root] [int] NULL,
	[Depth] [tinyint] NULL,
	[OrderID] [int] NULL,
	[ParentIDPath] [varchar](4000) NULL,
	[Child] [int] NULL,
	[PrevID] [int] NULL,
	[NextID] [int] NULL,
	[ClassDir] [varchar](255) NULL,
	[UserName] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Intro] [ntext] NULL,
	[PhotoUrl] [varchar](255) NULL,
	[AdminPurview] [ntext] NULL,
 CONSTRAINT [PK_KS_UserDepartment] PRIMARY KEY CLUSTERED 
(
	[DepartID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'会员部门ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'DepartID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'部门中文名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'DepartMentName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'部门英文名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'DepartMentEname'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'部门父ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'级别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'Root'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'深度' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'Depth'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'父ID集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'ParentIDPath'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'子部门数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'Child'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'上一个部门ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'PrevID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下一个部门ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'NextID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'部门英文名称集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'ClassDir'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创始人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'部门图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserDepartment', @level2type=N'COLUMN',@level2name=N'AdminPurview'
GO
/****** Object:  Table [dbo].[KS_WeixinOpenuser]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WeixinOpenuser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WeiXinOpenID] [varchar](50) NULL,
	[Subscribe] [tinyint] NULL,
	[OpenID] [varchar](100) NULL,
	[NickName] [nvarchar](50) NULL,
	[Sex] [tinyint] NULL,
	[Language] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[HeadImgurl] [nvarchar](255) NULL,
	[Subscribe_Time] [datetime] NULL,
	[Verify] [tinyint] NULL,
	[GroupID] [varchar](100) NULL,
	[Remark] [ntext] NULL,
	[Flag] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分组编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WeixinOpenuser', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WeixinOpenuser', @level2type=N'COLUMN',@level2name=N'Remark'
GO
/****** Object:  Table [dbo].[KS_UserForm]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserForm](
	[FormID] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [nvarchar](200) NOT NULL,
	[FieldNameList] [ntext] NULL,
	[Template] [ntext] NULL,
	[Note] [ntext] NULL,
 CONSTRAINT [PK_KS_UserForm] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FormID] ON [KS_UserForm] 
(
	[FormID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'会员表单记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserForm', @level2type=N'COLUMN',@level2name=N'FormID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'会员表单名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserForm', @level2type=N'COLUMN',@level2name=N'FormName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'表单项的字段集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserForm', @level2type=N'COLUMN',@level2name=N'FieldNameList'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'表单模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserForm', @level2type=N'COLUMN',@level2name=N'Template'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserForm', @level2type=N'COLUMN',@level2name=N'Note'
GO
/****** Object:  Table [dbo].[KS_Blog]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [varchar](50) NULL,
	[BlogName] [varchar](200) NULL,
	[Domain] [varchar](100) NULL,
	[Logo] [varchar](200) NULL,
	[ClassID] [int] NOT NULL,
	[Descript] [text] NULL,
	[Announce] [text] NULL,
	[ContentLen] [int] NOT NULL,
	[ListBlogNum] [int] NOT NULL,
	[ListLogNum] [int] NOT NULL,
	[ListReplayNum] [int] NOT NULL,
	[ListGuestNum] [int] NOT NULL,
	[TemplateID] [int] NULL,
	[AddDate] [datetime] NULL,
	[Best] [tinyint] NULL,
	[TopList] [tinyint] NULL,
	[Hot] [tinyint] NULL,
	[Status] [tinyint] NOT NULL,
	[Hits] [int] NOT NULL,
	[Banner] [varchar](200) NULL,
 CONSTRAINT [PK_KS_BLOG] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'配置ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'BlogID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户对应ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'空间名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'BlogName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'二级域名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'Domain'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户上传LOGO ' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'Logo'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'站点描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'Descript'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'空间公告' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'Announce'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'新鲜事，列表每页显示条数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'ContentLen'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'博文，首页显示编数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'ListBlogNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'博文，列表显示编数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'ListLogNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复，首页显示回复' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'ListReplayNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'留言，首页显示留言' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'ListGuestNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'TemplateID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'Best'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否置顶' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'TopList'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'Hot'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否审核' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点击数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'Hits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'Banner图片路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog', @level2type=N'COLUMN',@level2name=N'Banner'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户博客配制表' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Blog'
GO
/****** Object:  Table [dbo].[KS_U_Product]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_U_Product](
	[InfoID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[spggt] [nvarchar](200) NULL,
	[KeyTags] [nvarchar](255) NULL,
	[TitleFontColor] [nvarchar](50) NULL,
	[Attribute] [nvarchar](255) NULL,
	[DefaultPic] [nvarchar](255) NULL,
	[priority] [int] NULL,
	[Hits] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[VoteID] [int] NULL,
	[TemplateFile] [nvarchar](255) NULL,
	[Template3GFile] [nvarchar](255) NULL,
	[ShowON3G] [tinyint] NULL,
	[FileName] [nvarchar](255) NULL,
	[RefreshTF] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[DelTF] [tinyint] NULL,
	[Inputer] [nvarchar](100) NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[SocialIDs] [nvarchar](255) NULL,
	[ProID] [nvarchar](100) NULL,
	[ProductType] [int] NULL,
	[ChannelID] [int] NULL,
	[Unit] [nvarchar](50) NULL,
	[BarCode] [nvarchar](100) NULL,
	[Weight] [float] NULL,
	[BigPhoto] [nvarchar](255) NULL,
	[ProducerName] [nvarchar](50) NULL,
	[TrademarkName] [nvarchar](50) NULL,
	[ServiceTerm] [int] NULL,
	[BrandID] [int] NULL,
	[Amount] [int] NULL,
	[AlarmNum] [int] NULL,
	[Price] [money] NULL,
	[Price_Member] [money] NULL,
	[Price_Cost] [money] NULL,
	[GroupPrice] [tinyint] NULL,
	[TaxTF] [tinyint] NULL,
	[Tax] [float] NULL,
	[MinOrderNum] [int] NULL,
	[MaxOrderNum] [int] NULL,
	[Score] [int] NULL,
	[IsChangeBuy] [tinyint] NULL,
	[ChangeBuyNeedPrice] [money] NULL,
	[ChangeBuyPresentPrice] [money] NULL,
	[IsLimitbuy] [tinyint] NULL,
	[LimitBuyPrice] [money] NULL,
	[LimitBuyTaskID] [int] NULL,
	[LimitBuyAmount] [int] NULL,
	[AttributeCart] [nvarchar](50) NULL,
	[HasSold] [int] NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWords] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](255) NULL,
	[CommentNum] [int] NULL,
	[CmtNum] [int] NULL,
	[AskNum] [int] NULL,
	[IsScoreChange] [tinyint] NULL,
	[ChangeScore] [int] NULL,
	[PayType] [tinyint] NULL,
	[PayID] [int] NULL,
	[FrontPrice] [money] NULL,
	[LimitBeginDate] [datetime] NULL,
	[LimitEndDate] [datetime] NULL,
	[IsBookCode] [tinyint] NULL,
	[BookCodeTypeID] [int] NULL,
	[LimitCityNum] [int] NULL,
	[DownUrl] [nvarchar](255) NULL,
	[TurnUrl] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[ProvinceId] [int] NULL,
	[IsPromotions] [int] NULL,
	[IsGroupRate] [tinyint] NULL,
	[LimitBuyType] [int] NULL,
	[LimitBuyNum] [int] NULL,
	[a11] [int] NULL,
	[GoodNum] [int] NULL,
	[BadNum] [int] NULL,
	[FavNum] [int] NULL,
	[ShareNum] [int] NULL,
	[FreightFree] [tinyint] NULL,
 CONSTRAINT [PK_KS_U_Product] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Product', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Product', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Product', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品详细内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Product', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'成本价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Product', @level2type=N'COLUMN',@level2name=N'Price_Cost'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收款账号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Product', @level2type=N'COLUMN',@level2name=N'PayID'
GO
/****** Object:  Table [dbo].[KS_UserFeeSell]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserFeeSell](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[PackID] [int] NOT NULL,
	[PackBeginDate] [datetime] NULL,
	[PackDays] [int] NULL,
	[Limit] [int] NULL,
	[ExamTF] [int] NULL,
	[ContentTF] [int] NULL,
	[ContentClassIds] [text] NULL,
	[ExamClassIds] [text] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_UserFeeSell] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购买的套餐包记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'套餐包ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'PackID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期开始日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'PackBeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'有效天数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'PackDays'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'权限分配 1所有权限 0指定权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'Limit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'考场是否可用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'ExamTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'内容模型是否可用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'ContentTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'内容模型可用的栏目ID集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'ContentClassIds'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'考场可用的分类ID集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'ExamClassIds'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购买时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeSell', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
/****** Object:  Table [dbo].[KS_DiggList]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_DiggList](
	[DiggID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NOT NULL,
	[InfoID] [int] NOT NULL,
	[LastDiggTime] [datetime] NULL,
	[LastDiggUser] [nvarchar](120) NULL,
	[SupportNum] [int] NOT NULL,
	[AgainstNum] [int] NULL,
 CONSTRAINT [PK_KS_DiggList] PRIMARY KEY CLUSTERED 
(
	[DiggID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ChannelID] ON [KS_DiggList] 
(
	[InfoID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ChannelID1] ON [KS_DiggList] 
(
	[ChannelID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [InfoID] ON [KS_DiggList] 
(
	[InfoID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SupportNum] ON [KS_DiggList] 
(
	[SupportNum] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DiggList', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DiggList', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后Digg时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DiggList', @level2type=N'COLUMN',@level2name=N'LastDiggTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后Digg的用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DiggList', @level2type=N'COLUMN',@level2name=N'LastDiggUser'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支持票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DiggList', @level2type=N'COLUMN',@level2name=N'SupportNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'反对票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DiggList', @level2type=N'COLUMN',@level2name=N'AgainstNum'
GO
/****** Object:  Table [dbo].[KS_RechargeRecords]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_RechargeRecords](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[adddate] [datetime] NULL,
	[PayTime] [datetime] NULL,
	[status] [int] NULL,
	[paymoney] [money] NULL,
	[realmoney] [money] NULL,
	[remark] [ntext] NULL,
	[platID] [int] NULL,
	[alipaytradeno] [varchar](50) NULL,
	[alipaytradestatus] [varchar](50) NULL,
	[platName] [nvarchar](50) NULL,
 CONSTRAINT [PK_KS_RechargeRecords] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'orderid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'充值时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'adddate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'付款时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'PayTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0未支付  1已支付，已入账 2已支付，未入账' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付金额，包括手续费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'paymoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'实际入账金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'realmoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付平台接口ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'platID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付宝交易流水号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'alipaytradeno'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付宝状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'alipaytradestatus'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'平台名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_RechargeRecords', @level2type=N'COLUMN',@level2name=N'platName'
GO
/****** Object:  Table [dbo].[KS_YunManage]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_YunManage](
	[YunID] [int] IDENTITY(1,1) NOT NULL,
	[YunType] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[ClassName] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[Price] [money] NULL,
	[AddDate] [datetime] NULL,
	[Domain] [nvarchar](255) NULL,
	[AppID] [nvarchar](255) NULL,
	[OriYunID] [int] NULL,
	[InfoID] [int] NULL,
	[ClassID] [int] NULL,
	[UserName] [nvarchar](255) NULL,
	[PassWord] [nvarchar](255) NULL,
	[ACCESS_KEY] [nvarchar](255) NULL,
	[SECRET_KEY] [nvarchar](255) NULL,
	[SecretKey] [nvarchar](255) NULL,
	[UploadFiles] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[PayTime] [datetime] NULL,
	[VideoType] [tinyint] NULL,
	[EffectiveMonth] [int] NULL,
	[EffectiveDate] [datetime] NULL,
	[OrderID] [nvarchar](255) NULL,
	[CapacityNum] [nvarchar](255) NULL,
	[Traffic] [nvarchar](255) NULL,
	[AlreadyMsg] [int] NULL,
	[ProOrderID] [int] NULL,
	[CurrentLevel] [int] NULL,
	[email] [nvarchar](100) NULL,
	[userid] [int] NULL,
	[OpenDate] [datetime] NULL,
	[CPU] [nvarchar](255) NULL,
	[LinePeople] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProLogDeliver]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProLogDeliver](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NULL,
	[ClientName] [nvarchar](100) NULL,
	[UserName] [nvarchar](50) NULL,
	[Inputer] [nvarchar](50) NULL,
	[HandlerName] [nvarchar](50) NULL,
	[DeliverDate] [datetime] NULL,
	[DeliverType] [tinyint] NULL,
	[ExpressCorpId] [nvarchar](50) NULL,
	[ExpressNumber] [nvarchar](50) NULL,
	[Remark] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[MoneyReturnType] [tinyint] NULL,
	[MoneyReturnBankCard] [varchar](100) NULL,
	[MoneyReturnBankName] [varchar](150) NULL,
	[MoneyReturnCardName] [varchar](100) NULL,
	[HandlerDate] [datetime] NULL,
	[HandlerStatus] [tinyint] NULL,
 CONSTRAINT [PK_KS_ProLogDeliver] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'客户姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'ClientName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'Inputer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处理人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'HandlerName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发送货时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'DeliverDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'送货方式 1发货 3 客户申请退货退款 4 客户申请换货' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'DeliverType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'物流公司ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'ExpressCorpId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'物流单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'ExpressNumber'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处理状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'资金返还方式：1返还账号余额 2其它方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'MoneyReturnType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'退款时资金打入的银行账号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'MoneyReturnBankCard'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'退款时资金打入的银行名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'MoneyReturnBankName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'退款时资金打入的银行户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'MoneyReturnCardName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处理时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'HandlerDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'处理结果 1退款 2妥协交易 3同意换货' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProLogDeliver', @level2type=N'COLUMN',@level2name=N'HandlerStatus'
GO
/****** Object:  Table [dbo].[KS_BlogMessage]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [varchar](255) NULL,
	[SenderId] [int] NULL,
	[UserId] [varchar](255) NULL,
	[Title] [varchar](500) NULL,
	[Message] [text] NULL,
	[AddDate] [datetime] NULL,
	[Flag] [tinyint] NULL,
	[ReplayDate] [datetime] NULL,
	[Replay] [text] NULL,
 CONSTRAINT [PK_KS_BLOGMESSAGE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'留言ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogMessage', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发送者' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogMessage', @level2type=N'COLUMN',@level2name=N'Sender'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发送者ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogMessage', @level2type=N'COLUMN',@level2name=N'SenderId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogMessage', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogMessage', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'留言内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogMessage', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'留言时间
   ' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogMessage', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'未读/已读' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogMessage', @level2type=N'COLUMN',@level2name=N'Flag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogMessage', @level2type=N'COLUMN',@level2name=N'ReplayDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogMessage', @level2type=N'COLUMN',@level2name=N'Replay'
GO
/****** Object:  Table [dbo].[KS_UserFeePackages]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserFeePackages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[adddate] [datetime] NULL,
	[Descript] [ntext] NULL,
	[flag] [int] NULL,
	[days] [int] NULL,
	[price] [money] NULL,
	[status] [int] NULL,
	[limit] [int] NULL,
	[examtf] [int] NULL,
	[contenttf] [int] NULL,
	[examclassids] [text] NULL,
	[contentclassids] [text] NULL,
 CONSTRAINT [PK_KS_UserFeePackages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收费套餐包ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收费套餐包名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'adddate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'套餐包介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'Descript'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'此套餐有效天数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'days'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'销售价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'price'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'套餐状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'权限分配 1所有权限 0指定权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'limit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'考试系统权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'examtf'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'内容系统权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'contenttf'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定考场的分类ID集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'examclassids'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定内容模型的栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeePackages', @level2type=N'COLUMN',@level2name=N'contentclassids'
GO
/****** Object:  Table [dbo].[KS_BlogNav]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogNav](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UserName] [varchar](255) NULL,
	[BlogId] [int] NULL,
	[NavName] [varchar](255) NULL,
	[NavId] [int] NULL,
	[NavAlias] [varchar](255) NULL,
	[NavOrderId] [int] NULL,
	[OwnSys] [tinyint] NULL,
	[CustomPage] [text] NULL,
	[Flag] [tinyint] NULL,
	[Marks] [text] NULL,
 CONSTRAINT [PK_KS_BLOGNAV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'空间用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'空间用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'博客ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'BlogId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'导航显示名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'NavName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'导航识别ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'NavId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'导航别名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'NavAlias'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序（越大越靠前）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'NavOrderId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自否是系统自带' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'OwnSys'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义页面' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'CustomPage'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'Flag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注或者标记' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogNav', @level2type=N'COLUMN',@level2name=N'Marks'
GO
/****** Object:  Table [dbo].[KS_ProCoupon]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProCoupon](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[Couponname] [nvarchar](250) NULL,
	[FaceValue] [money] NULL,
	[MinAmount] [money] NULL,
	[CouponType] [int] NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Inputer] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[MaxDiscount] [float] NULL,
	[LimitType] [int] NULL,
	[LimitProIds] [nvarchar](500) NULL,
	[LimitClassIDs] [nvarchar](500) NULL,
	[DefaultPic] [varchar](255) NULL,
	[Describe] [varchar](255) NULL,
 CONSTRAINT [PK_KS_ProCoupon] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'CouponID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'Couponname'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'面值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'FaceValue'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最小购买数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'MinAmount'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'CouponType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入者' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'Inputer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最大抵扣额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'MaxDiscount'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限制类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'LimitType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限制购买的商品ID集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'LimitProIds'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限制购买的商品分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCoupon', @level2type=N'COLUMN',@level2name=N'LimitClassIDs'
GO
/****** Object:  StoredProcedure [dbo].[KS_PKZTAddOrModify]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKZTAddOrModify] 
 @Title nvarchar(255),
 @ZFGD nvarchar(3000),
 @FFGD nvarchar(3000),
 @ZFVotes int=0,
 @FFVotes int=0,
 @SFVotes int=0,
 @UserTF tinyint=0,
 @OnceTF tinyint=0,
 @VerifyTF tinyint=0,
 @Status tinyint=0,
 @TimeLimit tinyint=0,
 @BeginDate smalldatetime=getdate,
 @EndDate smalldatetime=getdate,
 @InfoID int=0,
 @pkid int=0
AS
    If (exists(Select top 1 pkid From KS_PKZT Where InfoID=@InfoID) and @Infoid<>0) or (exists(select top 1 pkid from ks_pkzt where pkid=@pkid) and @pkid<>0)
     Begin  
     UPDATE KS_PKZT Set  Title=@Title, ZFGD=@ZFGD, FFGD=@FFGD, UserTF=@UserTF, OnceTF=@OnceTF, VerifyTF=@VerifyTF, Status=@Status,TimeLimit=@TimeLimit, BeginDate=@BeginDate, EndDate=@EndDate,ZFVotes=@ZFVotes,FFVotes=@FFVotes,SFVotes=@SFVotes   Where pkid=@PKID
    End
   else
     Begin
    INSERT INTO KS_PKZT(
      Title,ZFGD,FFGD,UserTF,OnceTF,VerifyTF,Status,TimeLimit,BeginDate,EndDate,InfoID,ZFVotes,FFVotes,SFVotes
    )
     VALUES(
     @Title,@ZFGD,@FFGD,@UserTF,@OnceTF,@VerifyTF,@Status,@TimeLimit,@BeginDate,@EndDate,@InfoID,@ZFVotes,@FFVotes,@SFVotes
   )
     If @InfoID!=0
      Begin
       SELECT @pkid=@@identity
       UPDATE [KS_InfoList] Set PKID=@pkid WHERE InfoID=@InfoID
     End
   End
GO
/****** Object:  Table [dbo].[KS_CopyFrom]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_CopyFrom](
	[CopyFromID] [int] IDENTITY(1,1) NOT NULL,
	[CopyFromName] [nvarchar](50) NOT NULL,
	[WebSite] [nvarchar](100) NULL,
	[Address] [nvarchar](255) NULL,
	[ContactMan] [nvarchar](50) NULL,
	[Telphone] [nvarchar](50) NULL,
	[Fax] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NULL,
	[Class] [nvarchar](15) NULL,
	[Intro] [ntext] NULL,
	[AddDate] [datetime] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_KS_CopyFrom] PRIMARY KEY CLUSTERED 
(
	[CopyFromID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_CopyFrom] 
(
	[CopyFromID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'来源ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'CopyFromID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'来源名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'CopyFromName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'网址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'WebSite'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'ContactMan'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'Telphone'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'传真' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'来源分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CopyFrom', @level2type=N'COLUMN',@level2name=N'Status'
GO
/****** Object:  Table [dbo].[KS_ProBiddingAsk]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProBiddingAsk](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[Money] [money] NULL,
	[AddDate] [datetime] NULL,
	[UserName] [varchar](50) NULL,
	[UserID] [int] NULL,
	[UserIP] [varchar](50) NULL,
	[Status] [int] NULL,
	[IsZB] [int] NULL,
	[RealName] [varchar](100) NULL,
	[Mobile] [varchar](100) NULL,
	[Address] [varchar](200) NULL,
	[ZipCode] [varchar](50) NULL,
	[AgentPrice] [money] NULL,
 CONSTRAINT [PK_KS_ProBiddingAsk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBiddingAsk', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBiddingAsk', @level2type=N'COLUMN',@level2name=N'Money'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBiddingAsk', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'竞价人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBiddingAsk', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBiddingAsk', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBiddingAsk', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否中标' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBiddingAsk', @level2type=N'COLUMN',@level2name=N'IsZB'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'代理价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBiddingAsk', @level2type=N'COLUMN',@level2name=N'AgentPrice'
GO
/****** Object:  Table [dbo].[KS_Dictionary]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Dictionary](
	[KeyID] [int] IDENTITY(1,1) NOT NULL,
	[KeyText] [nvarchar](50) NULL,
	[KeyValue] [ntext] NULL,
	[DefaultValue] [nvarchar](200) NULL,
 CONSTRAINT [PK_KS_Dictionary] PRIMARY KEY CLUSTERED 
(
	[KeyID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_Dictionary] 
(
	[KeyID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'词典ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Dictionary', @level2type=N'COLUMN',@level2name=N'KeyID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'词典KEY名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Dictionary', @level2type=N'COLUMN',@level2name=N'KeyText'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'词典KEY值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Dictionary', @level2type=N'COLUMN',@level2name=N'KeyValue'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Dictionary', @level2type=N'COLUMN',@level2name=N'DefaultValue'
GO
/****** Object:  Table [dbo].[KS_UserFeeDiscount]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserFeeDiscount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[groupid] [int] NOT NULL,
	[discount] [real] NULL,
	[status] [int] NULL,
	[packid] [int] NOT NULL,
 CONSTRAINT [PK_KS_UserFeeDiscount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录D' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeDiscount', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeDiscount', @level2type=N'COLUMN',@level2name=N'groupid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeDiscount', @level2type=N'COLUMN',@level2name=N'discount'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许购买此套餐标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeDiscount', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'套餐包ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserFeeDiscount', @level2type=N'COLUMN',@level2name=N'packid'
GO
/****** Object:  Table [dbo].[KS_Digg]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Digg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NOT NULL,
	[InfoID] [int] NOT NULL,
	[DiggID] [int] NOT NULL,
	[DiggTime] [datetime] NULL,
	[UserName] [nvarchar](100) NULL,
	[UserIP] [nvarchar](100) NULL,
	[DiggType] [int] NULL,
 CONSTRAINT [PK_KS_Digg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ChannelID] ON [KS_Digg] 
(
	[ChannelID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DiggID] ON [KS_Digg] 
(
	[InfoID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DiggID1] ON [KS_Digg] 
(
	[DiggID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [InfoID] ON [KS_Digg] 
(
	[InfoID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Digg', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Digg', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Digg', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'DIGG ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Digg', @level2type=N'COLUMN',@level2name=N'DiggID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Digg', @level2type=N'COLUMN',@level2name=N'DiggTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Digg', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Digg', @level2type=N'COLUMN',@level2name=N'UserIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支持或是反对标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Digg', @level2type=N'COLUMN',@level2name=N'DiggType'
GO
/****** Object:  Table [dbo].[KS_BlogVisitors]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogVisitors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UserName] [varchar](255) NULL,
	[VisitorId] [int] NULL,
	[Visitor] [varchar](255) NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_BLOGVISITORS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogVisitors', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主人空间ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogVisitors', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主人空间用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogVisitors', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'访客用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogVisitors', @level2type=N'COLUMN',@level2name=N'VisitorId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'访客用户' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogVisitors', @level2type=N'COLUMN',@level2name=N'Visitor'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'访问时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogVisitors', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
/****** Object:  Table [dbo].[KS_ProBidding]    Script Date: 01/13/2017 10:53:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProBidding](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[Money] [int] NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Bail] [money] NULL,
	[Num] [int] NULL,
	[ExtendTime] [int] NULL,
	[HightMoney] [money] NOT NULL,
	[Times] [int] NULL,
	[HightUserName] [varchar](50) NULL,
	[IsEnd] [int] NULL,
 CONSTRAINT [PK_KS_ProBidding] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'起拍价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'Money'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'起拍时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'保证金' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'Bail'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'可供竞价的商品数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'Num'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'延长时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'ExtendTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'当前最高价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'HightMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'出价次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'Times'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最高出价者' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'HightUserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否结束' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBidding', @level2type=N'COLUMN',@level2name=N'IsEnd'
GO
/****** Object:  Table [dbo].[KS_KeyTags]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_KeyTags](
	[TagsID] [int] IDENTITY(1,1) NOT NULL,
	[KeyText] [nvarchar](100) NOT NULL,
	[AddDate] [datetime] NULL,
	[TagsHits] [int] NULL,
	[TodayHits] [int] NULL,
	[YesterDayHits] [int] NULL,
	[WeekHits] [int] NULL,
	[LastUseTime] [datetime] NULL,
	[Status] [int] NULL,
	[FirstAlphabet] [varchar](50) NULL,
 CONSTRAINT [PK_KS_KeyTags] PRIMARY KEY CLUSTERED 
(
	[TagsID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_KeyTags] 
(
	[TagsID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KeyText] ON [KS_KeyTags] 
(
	[KeyText] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_KeyTags', @level2type=N'COLUMN',@level2name=N'TagsID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'Tags名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_KeyTags', @level2type=N'COLUMN',@level2name=N'KeyText'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_KeyTags', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'使用次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_KeyTags', @level2type=N'COLUMN',@level2name=N'TagsHits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'今日使用次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_KeyTags', @level2type=N'COLUMN',@level2name=N'TodayHits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'昨天使用次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_KeyTags', @level2type=N'COLUMN',@level2name=N'YesterDayHits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'周使用次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_KeyTags', @level2type=N'COLUMN',@level2name=N'WeekHits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后使用时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_KeyTags', @level2type=N'COLUMN',@level2name=N'LastUseTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_KeyTags', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'首字母' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_KeyTags', @level2type=N'COLUMN',@level2name=N'FirstAlphabet'
GO
/****** Object:  Table [dbo].[KS_YunManageItem]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_YunManageItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[YunType] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[ClassName] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[Price] [money] NULL,
	[AddDate] [datetime] NULL,
	[InfoID] [int] NULL,
	[ClassID] [int] NULL,
	[Status] [tinyint] NULL,
	[PayTime] [datetime] NULL,
	[VideoType] [tinyint] NULL,
	[EffectiveMonth] [int] NULL,
	[EffectiveDate] [datetime] NULL,
	[OrderID] [nvarchar](255) NULL,
	[CapacityNum] [nvarchar](255) NULL,
	[Traffic] [nvarchar](255) NULL,
	[AlreadyMsg] [int] NULL,
	[ProOrderID] [int] NULL,
	[CurrentLevel] [int] NULL,
	[OpenDate] [datetime] NULL,
	[CPU] [nvarchar](255) NULL,
	[LinePeople] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_UserMobileLog]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserMobileLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[UserID] [int] NULL,
	[UserIP] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[mobile] [nvarchar](255) NULL,
	[tjmobile] [nvarchar](255) NULL,
	[DeviceType] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProShoppingCart]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProShoppingCart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[Price] [money] NULL,
	[Num] [int] NULL,
	[AddDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[IsAnonymous] [tinyint] NULL,
	[IsChangeBuy] [tinyint] NULL,
	[IsBundleSale] [tinyint] NULL,
	[IsLimitBuy] [tinyint] NULL,
	[LimitBuyTaskID] [int] NULL,
	[AttrID] [int] NULL,
	[flag] [int] NULL,
	[cityid] [int] NULL,
	[BookCode] [nvarchar](50) NULL,
	[Business] [nvarchar](50) NULL,
	[IsToPay] [int] NULL,
 CONSTRAINT [PK_KS_ProShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [username] ON [KS_ProShoppingCart] 
(
	[UserName] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购物车ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'CartID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'单价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购买数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'Num'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'加入购物车时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否匿名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'IsAnonymous'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否换购' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'IsChangeBuy'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否捆绑销售商品' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'IsBundleSale'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否限时限量抢购' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'IsLimitBuy'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'限时限量抢购任务ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'LimitBuyTaskID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品规格属性ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'AttrID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'flag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购买城市' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'cityid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邀请码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProShoppingCart', @level2type=N'COLUMN',@level2name=N'BookCode'
GO
/****** Object:  Table [dbo].[KS_ProGroupOneOrder]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProGroupOneOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PayOrderId] [nvarchar](50) NULL,
	[InfoID] [int] NULL,
	[OrderID] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[UserIP] [nvarchar](50) NULL,
	[Price] [money] NULL,
	[InputTime] [datetime] NULL,
	[PaymentPlatId] [int] NULL,
	[PayTime] [datetime] NULL,
	[goodsmoney] [money] NULL,
	[OrderNowPrice] [money] NULL,
	[OrderTotalPrice] [money] NULL,
	[PayDiscountMoney] [money] NULL,
	[SaveMoney] [money] NULL,
	[Isleader] [int] NULL,
	[JoinTimes] [int] NULL,
	[JoinNumber] [int] NULL,
	[NowNum] [int] NULL,
	[Status] [int] NULL,
	[NowStatus] [int] NULL,
	[IsWin] [int] NULL,
	[WinNumber] [nvarchar](800) NULL,
	[ResultsDate] [datetime] NULL,
	[RealName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[zipCode] [nvarchar](100) NULL,
	[email] [nvarchar](50) NULL,
	[DeliverID] [int] NULL,
	[DeliverStatus] [int] NULL,
	[DeliveryDate] [datetime] NULL,
	[Remark] [nvarchar](800) NULL,
	[ConsumptionMode] [int] NULL,
	[deliveryTime] [datetime] NULL,
	[IsCmt] [int] NULL,
	[Istips] [int] NULL,
	[changeints] [int] NULL,
	[IsEnd] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_BBSTable]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BBSTable](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NULL,
	[TableName] [varchar](100) NULL,
	[IsDefault] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[IsSys] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'表别名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSTable', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'表名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSTable', @level2type=N'COLUMN',@level2name=N'TableName'
GO
/****** Object:  Table [dbo].[KS_WeixinMenu]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WeixinMenu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](100) NULL,
	[ParentID] [int] NULL,
	[OrderID] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[KeyWord] [nvarchar](200) NULL,
	[Url] [nvarchar](200) NULL,
	[TypeName] [nvarchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[ModifyNum] [tinyint] NULL,
	[UserID] [int] NULL,
	[ClassID] [int] NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[TypeFlag] [int] NULL,
	[SuCaiID] [int] NULL,
 CONSTRAINT [PK_KS_WeixinMenu] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_BlogStatus]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NULL,
	[UserId] [int] NULL,
	[ArticleTotal] [int] NULL,
	[AlbumTotal] [int] NULL,
	[CorpusTotal] [int] NULL,
	[AskTotal] [int] NULL,
	[MessageTotal] [int] NULL,
 CONSTRAINT [PK_KS_BLOGSTATUS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogStatus', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogStatus', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogStatus', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'博文总数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogStatus', @level2type=N'COLUMN',@level2name=N'ArticleTotal'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'相册总数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogStatus', @level2type=N'COLUMN',@level2name=N'AlbumTotal'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文集总数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogStatus', @level2type=N'COLUMN',@level2name=N'CorpusTotal'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问答总数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogStatus', @level2type=N'COLUMN',@level2name=N'AskTotal'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'留言总数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogStatus', @level2type=N'COLUMN',@level2name=N'MessageTotal'
GO
/****** Object:  Table [dbo].[KS_Vote]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Vote](
	[VoteID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [ntext] NOT NULL,
	[BeginDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[VoteType] [tinyint] NULL,
	[LimitIP] [int] NULL,
	[UserTF] [int] NULL,
	[InfoID] [int] NULL,
	[VoteScore] [int] NULL,
 CONSTRAINT [PK_KS_Vote] PRIMARY KEY CLUSTERED 
(
	[VoteID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'调查ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Vote', @level2type=N'COLUMN',@level2name=N'VoteID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'调查项目名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Vote', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Vote', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过期时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Vote', @level2type=N'COLUMN',@level2name=N'ExpireDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'调查类型单选项是多选' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Vote', @level2type=N'COLUMN',@level2name=N'VoteType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'启用IP限制' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Vote', @level2type=N'COLUMN',@level2name=N'LimitIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'只允许会员投票' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Vote', @level2type=N'COLUMN',@level2name=N'UserTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Vote', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
/****** Object:  Table [dbo].[KS_WeixinMsg]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WeixinMsg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserName] [nvarchar](200) NULL,
	[ToUserName] [nvarchar](200) NULL,
	[CreateTime] [datetime] NULL,
	[MsgType] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[MediaId] [nvarchar](200) NULL,
	[PicUrl] [nvarchar](200) NULL,
	[Format] [nvarchar](255) NULL,
	[ThumbMediaId] [nvarchar](50) NULL,
	[Location_X] [nvarchar](50) NULL,
	[Location_Y] [nvarchar](50) NULL,
	[Scale] [ntext] NULL,
	[Label] [nvarchar](250) NULL,
	[Title] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
	[Remark] [ntext] NULL,
	[AddTime] [datetime] NULL,
	[ReplyPeople] [nvarchar](50) NULL,
	[ReplyContent] [ntext] NULL,
	[ReplyTime] [datetime] NULL,
	[ReplyType] [tinyint] NULL,
	[ReplyStatus] [tinyint] NULL,
	[TuWenID] [varchar](100) NULL,
	[ShopID] [varchar](100) NULL,
	[SuCaiID] [varchar](100) NULL,
	[IsRead] [tinyint] NULL,
 CONSTRAINT [PK_KS_WeixinMsg] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已读：1代表已读，0代表未读' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WeixinMsg', @level2type=N'COLUMN',@level2name=N'IsRead'
GO
/****** Object:  Table [dbo].[KS_ProDelivery]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProDelivery](
	[DeliveryID] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryName] [nvarchar](200) NOT NULL,
	[CorpId] [int] NULL,
	[FreightType] [tinyint] NULL,
	[Freight] [money] NULL,
	[FirstHeavy] [float] NULL,
	[ContinueHeavy] [float] NULL,
	[FirstFreight] [money] NULL,
	[ContinueFreight] [money] NULL,
	[LimitFreight] [money] NULL,
	[ChargeType] [tinyint] NULL,
	[IsCOD] [tinyint] NULL,
	[Intro] [ntext] NULL,
	[PromotionType] [tinyint] NULL,
	[OrderAmount1] [money] NULL,
	[OrderAmount2] [money] NULL,
	[OrderAmount3] [money] NULL,
	[Freight1] [money] NULL,
	[Freight2] [money] NULL,
	[Status] [tinyint] NULL,
	[OrderID] [int] NULL,
	[IsDefault] [tinyint] NULL,
	[CityFirstFreight] [money] NULL,
	[CityContinueFreight] [money] NULL,
	[CityLimitFreight] [money] NULL,
	[CityIsCod] [tinyint] NULL,
	[IsCityTF] [tinyint] NULL,
	[ProvinceFirstFreight] [money] NULL,
	[ProvinceContinueFreight] [money] NULL,
	[ProvinceLimitFreight] [money] NULL,
	[ProvinceIsCod] [tinyint] NULL,
	[IsProvinceTF] [tinyint] NULL,
	[DetailTipsTF] [tinyint] NULL,
	[IsZT] [tinyint] NULL,
	[OneWeight] [tinyint] NULL,
	[IsFreightFree] [int] NULL,
 CONSTRAINT [PK_KS_ProDelivery] PRIMARY KEY CLUSTERED 
(
	[DeliveryID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'DeliveryID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'送货方式名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'DeliveryName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'物流公司的ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'CorpId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'运费设置' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'FreightType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'Freight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'首重重量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'FirstHeavy'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'续重重量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'ContinueHeavy'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'首重运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'FirstFreight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'续重运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'ContinueFreight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最高运费不超过' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'LimitFreight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否分别设置地区运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'ChargeType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支持货到付款' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'IsCOD'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'详细介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'运费促销设置' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'PromotionType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'在本商城购买满1' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'OrderAmount1'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'在本商城购买满2' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'OrderAmount2'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'在本商城购买满3' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'OrderAmount3'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'减免1' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'Freight1'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'减免2' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'Freight2'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'IsDefault'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'启用同城运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'IsCityTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'启用同省运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'IsProvinceTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购车页面，显示详细明细' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'DetailTipsTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否上门自提' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDelivery', @level2type=N'COLUMN',@level2name=N'IsZT'
GO
/****** Object:  Table [dbo].[KS_BBSRank]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_BBSRank](
	[RankID] [int] IDENTITY(1,1) NOT NULL,
	[RankName] [nvarchar](50) NULL,
	[IsSys] [tinyint] NULL,
	[Score] [int] NULL,
	[Ico] [nvarchar](50) NULL,
	[TopicNum] [int] NULL,
	[PostNum] [int] NULL,
	[color] [nvarchar](30) NULL
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'达到积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSRank', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主题数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSRank', @level2type=N'COLUMN',@level2name=N'TopicNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSRank', @level2type=N'COLUMN',@level2name=N'PostNum'
GO
/****** Object:  Table [dbo].[KS_WeixinOnlineMessage]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WeixinOnlineMessage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[UserName] [nvarchar](255) NULL,
	[UserID] [int] NULL,
	[UserIP] [varchar](100) NULL,
	[MessageContent] [ntext] NULL,
	[AddDate] [datetime] NULL,
	[ReplyContent] [ntext] NULL,
	[ReplyUser] [nvarchar](200) NULL,
	[ReplyDate] [datetime] NULL,
	[IsReply] [int] NULL,
	[Verify] [int] NULL,
 CONSTRAINT [PK_KS_WeixinOnlineMessage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_WeixinUser]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WeixinUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[URL] [nvarchar](255) NULL,
	[Token] [nvarchar](50) NULL,
	[OpenName] [nvarchar](50) NULL,
	[WeiXinName] [nvarchar](50) NULL,
	[WeiXinOpenID] [nvarchar](50) NULL,
	[WeiXinType] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[Appid] [nvarchar](50) NULL,
	[Secret] [nvarchar](100) NULL,
	[Access_Token] [nvarchar](512) NULL,
	[Access_YouXRQ] [datetime] NULL,
	[WeiXinStatus] [int] NULL,
	[EncodingAESKey] [varchar](100) NULL,
	[MessageEnType] [varchar](50) NULL,
	[ErCodeimg] [varchar](255) NULL,
	[Intro] [ntext] NULL,
	[TypeFlag] [tinyint] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_KS_WeixinUser] PRIMARY KEY NONCLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_UserLoginLog]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserLoginLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[UserID] [int] NULL,
	[UserIP] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[Remark] [nvarchar](255) NULL,
	[loginFrom] [int] NULL,
	[DeviceType] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_WeixinKeyWord]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WeixinKeyWord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IsKeyWord] [tinyint] NULL,
	[KeyWord] [nvarchar](50) NULL,
	[Type] [tinyint] NULL,
	[Content] [ntext] NULL,
	[Picmsg] [int] NULL,
	[AddTime] [datetime] NULL,
	[Hits] [int] NULL,
	[AddPeople] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[TypeFlag] [int] NULL,
	[TypeName] [varchar](50) NULL,
	[TuWenID] [varchar](100) NULL,
	[ShopID] [varchar](100) NULL,
	[Title] [varchar](60) NULL,
	[SuCaiID] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromLimitBuy]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_ProGetProFromLimitBuy] 
@NUM INT=0,
@TaskID INT=0
AS
 DECLARE @SQL Nvarchar(2200)
 Set @SQL='SELECT  top '+Cast(@num as varchar(20))+'  I.Title,I.LinkUrl,i.DefaultPic,I.Price_market,I.Price_member,I.Price,I.LimitBuyPrice,I.LimitBuyAmount,I.Unit,L.LimitBuyBeginTime,L.LimitBuyEndTime,L.TaskType FROM KS_ProductList I Inner Join KS_ProLimitBuy L ON I.LimitBuyTaskID=L.Taskid Where L.Status=1 and L.taskid='+Cast(@TaskID as varchar(20))+' Order BY I.InfoID Desc'
 Exec (@SQL)
GO
/****** Object:  Table [dbo].[KS_PhotoClass]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_PhotoClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[OrderID] [int] NOT NULL,
	[IsDefault] [tinyint] NULL,
 CONSTRAINT [PK_KS_PHOTOCLASS] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PhotoClass', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PhotoClass', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PhotoClass', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PhotoClass', @level2type=N'COLUMN',@level2name=N'IsDefault'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'相册分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_PhotoClass'
GO
/****** Object:  Table [dbo].[KS_WeixinTemplate]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_WeixinTemplate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [nvarchar](255) NULL,
	[TemplateFolder] [nvarchar](255) NULL,
	[TemplateType] [int] NULL,
	[TemplateAuthor] [nvarchar](100) NULL,
	[TemplatePic] [nvarchar](255) NULL,
	[IsDefault] [int] NULL,
	[CopyRight] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_WeixinTemplate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ADClass]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ADClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](250) NULL,
	[Descript] [text] NULL,
	[OrderId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告分类ＩＤ' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ADClass', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ADClass', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ADClass', @level2type=N'COLUMN',@level2name=N'Descript'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ADClass', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
/****** Object:  Table [dbo].[KS_UserGroup]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserGroup](
	[GroupID] [int] NOT NULL,
	[GroupName] [nvarchar](100) NOT NULL,
	[PowerList] [ntext] NULL,
	[Descript] [ntext] NULL,
	[Type] [int] NULL,
	[ChargeType] [int] NULL,
	[GroupPoint] [int] NULL,
	[ValidDays] [int] NULL,
	[FormID] [int] NULL,
	[IsReg] [int] NULL,
	[SpaceSize] [float] NULL,
	[UpfilesDir] [varchar](255) NULL,
	[Settings] [ntext] NULL,
	[OrderID] [int] NULL,
	[IsGroupPrice] [int] NULL,
 CONSTRAINT [PK_KS_UserGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_UserGroup] 
(
	[GroupID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'PowerList'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'Descript'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标志，是否系统自带的用户组' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认收费方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'ChargeType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认赠送积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'GroupPoint'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认有效天数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'ValidDays'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'绑定的表单ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'FormID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用前台注册' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'IsReg'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分配的空间大小' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'SpaceSize'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'上传的目录' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'UpfilesDir'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组参数配置' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'Settings'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商城用户组单独设置价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserGroup', @level2type=N'COLUMN',@level2name=N'IsGroupPrice'
GO
/****** Object:  StoredProcedure [dbo].[KS_ProLimitBuyCheckPayEndTime]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_ProLimitBuyCheckPayEndTime]
 AS
Select i.Infoid,i.Num,i.OrderID,o.paytime,L.LimitBuyPayTime,O.status,O.InputTime From (KS_ProOrderItem i inner join ks_ProOrder o on i.orderid=o.orderid) inner join KS_ProLimitBuy L on I.LimitBuyTaskID=L.TaskID Where (L.LimitBuyPayTime)<>0 and i.IsLimitBuy<>0 and o.status=0 and o.MoneyReceipt=0
GO
/****** Object:  Table [dbo].[KS_UserBlogClass]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserBlogClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NULL,
	[ClassName] [varchar](255) NULL,
	[Descript] [varchar](1000) NULL,
	[AddDate] [datetime] NULL,
	[OrderID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_KS_USERBLOGCLASS] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserBlogClass', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserBlogClass', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserBlogClass', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserBlogClass', @level2type=N'COLUMN',@level2name=N'Descript'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserBlogClass', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserBlogClass', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserBlogClass', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户日志分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UserBlogClass'
GO
/****** Object:  Table [dbo].[KS_AskClass]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_AskClass](
	[ClassID] [int] NOT NULL,
	[ClassName] [nvarchar](100) NULL,
	[ClassEname] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[Root] [int] NULL,
	[Depth] [tinyint] NULL,
	[OrderID] [int] NULL,
	[ParentIDPath] [varchar](4000) NULL,
	[Child] [int] NULL,
	[PrevID] [int] NULL,
	[NextID] [int] NULL,
	[ClassDir] [varchar](255) NULL,
	[UserName] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[ShowInTop] [tinyint] NULL,
	[ClassBasicInfo] [ntext] NULL,
	[ClassDefineContent] [ntext] NULL,
	[AdminPurview] [ntext] NULL,
	[QueNum] [int] NULL,
	[AnsNum] [int] NULL,
 CONSTRAINT [PK_KS_AskClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问答的分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类英文名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'ClassEname'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目父ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'级别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'Root'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'深度' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'Depth'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'ID集合' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'ParentIDPath'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'子分类数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'Child'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'前一个分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'PrevID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下一个分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'NextID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生成的路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'ClassDir'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创始人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否导航显示' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'ShowInTop'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类的基本配置信息集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'ClassBasicInfo'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类的自定义选项集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'ClassDefineContent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'AdminPurview'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问题数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'QueNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回答数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskClass', @level2type=N'COLUMN',@level2name=N'AnsNum'
GO
/****** Object:  Table [dbo].[KS_WeixinTemplateClass]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_WeixinTemplateClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassType] [tinyint] NULL,
	[ClassName] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_WeixinTemplateClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_Special]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Special](
	[SpecialID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[SpecialName] [nvarchar](100) NOT NULL,
	[SpecialEName] [nvarchar](50) NOT NULL,
	[SpecialPic] [nvarchar](255) NULL,
	[TemplateFile] [nvarchar](255) NOT NULL,
	[Descript] [ntext] NULL,
	[Recommend] [int] NULL,
	[AddDate] [smalldatetime] NULL,
	[FsoName] [nvarchar](255) NULL,
	[MetaKeyWord] [ntext] NULL,
	[MetaDescript] [ntext] NULL,
	[UserName] [nvarchar](50) NULL,
	[SpecialDefineContent] [ntext] NULL,
	[SpecialPurView] [int] NULL,
	[ArrGroupID] [nvarchar](100) NULL,
	[ReadPoint] [int] NULL,
	[ChargeType] [int] NULL,
	[PitchTime] [int] NULL,
	[ReadTimes] [int] NULL,
	[Hits] [int] NULL,
 CONSTRAINT [PK_KS_Special] PRIMARY KEY CLUSTERED 
(
	[SpecialID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'SpecialID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'SpecialName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题英文名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'SpecialEName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'SpecialPic'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题绑定的模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'TemplateFile'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'Descript'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'Recommend'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生成的文件名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'FsoName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'Seo 关键字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'MetaKeyWord'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'Seo 描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'MetaDescript'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自定义内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'SpecialDefineContent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'SpecialPurView'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许浏览的用户组' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'ArrGroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览点数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'ReadPoint'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收费方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'ChargeType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'间隔时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'PitchTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'ReadTimes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Special', @level2type=N'COLUMN',@level2name=N'Hits'
GO
/****** Object:  StoredProcedure [dbo].[KS_PKZTDel]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_PKZTDel]
@pkid varchar(255)
 AS
  declare @Sql varchar(3000)
  Set @Sql='Delete From KS_PKZT Where PKID in('+@pkid+')'
  exec (@SQL)
  Set @Sql='Delete From KS_PKGD Where PKID IN('+@PKID+')'
  exec (@SQL)
  Set @Sql='Update KS_InfoList Set pkid=0 Where PKID IN('+@PKID+')'
  EXEC(@SQL)
GO
/****** Object:  StoredProcedure [dbo].[KS_GetUserByDepartIDS]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_GetUserByDepartIDS]
@departids varchar(200)
 AS
 Declare @SQL Varchar(1000)
 Set @SQL='SELECT UserID,UserFace,UserName,RealName,Email,Sex,IDCard FROM [KS_USER] WHERE departID in'+'('+@departids+')'+' Order BY UserID Desc'
 Exec (@SQL)
GO
/****** Object:  Table [dbo].[KS_ProCouponUser]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProCouponUser](
	[CouponUserID] [int] IDENTITY(1,1) NOT NULL,
	[CouponId] [int] NULL,
	[CouponNum] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[OrderID] [nvarchar](50) NULL,
	[UseTime] [datetime] NULL,
	[UseFlag] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[MailTF] [tinyint] NULL,
	[AvailableMoney] [money] NULL,
	[Note] [nvarchar](1000) NULL,
	[IsExtend] [int] NULL,
 CONSTRAINT [PK_KS_ProCouponUser] PRIMARY KEY CLUSTERED 
(
	[CouponUserID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'CouponUserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券项目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'CouponId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券号码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'CouponNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券所属的用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'使用时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'UseTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否使用标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'UseFlag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件通知标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'MailTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'可用余额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'AvailableMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProCouponUser', @level2type=N'COLUMN',@level2name=N'Note'
GO
/****** Object:  Table [dbo].[KS_BlogTemplate]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogTemplate](
	[SkinID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](255) NOT NULL,
	[templateMain] [varchar](255) NULL,
	[TemplateAuthor] [varchar](100) NULL,
	[TemplatePic] [varchar](255) NULL,
	[IsDefault] [tinyint] NOT NULL,
	[groupLevel] [varchar](255) NOT NULL,
	[Sharetag] [int] NULL,
	[UserTag] [int] NULL,
 CONSTRAINT [PK_KS_BLOGTEMPLATE] PRIMARY KEY CLUSTERED 
(
	[SkinID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模板ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogTemplate', @level2type=N'COLUMN',@level2name=N'SkinID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模板名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogTemplate', @level2type=N'COLUMN',@level2name=N'TemplateName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模板目录路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogTemplate', @level2type=N'COLUMN',@level2name=N'templateMain'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模板作者' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogTemplate', @level2type=N'COLUMN',@level2name=N'TemplateAuthor'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模板缩略图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogTemplate', @level2type=N'COLUMN',@level2name=N'TemplatePic'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogTemplate', @level2type=N'COLUMN',@level2name=N'IsDefault'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'组别(个人，企业)' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogTemplate', @level2type=N'COLUMN',@level2name=N'groupLevel'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否共享' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogTemplate', @level2type=N'COLUMN',@level2name=N'Sharetag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否用户模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogTemplate', @level2type=N'COLUMN',@level2name=N'UserTag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'个人空间模板管理' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogTemplate'
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGetInfo]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_PKGetInfo] 
@pkid int=0
AS
select top 1 * From KS_PKZT Where pkid=@pkid
GO
/****** Object:  Table [dbo].[KS_Adboard]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Adboard](
	[boardid] [int] IDENTITY(1,1) NOT NULL,
	[BoardName] [nvarchar](50) NULL,
	[AdRate] [int] NULL,
	[FileName] [nvarchar](50) NULL,
	[Maxads] [smallint] NULL,
	[Note] [ntext] NULL,
	[Status] [int] NULL,
	[ClassID] [int] NULL,
 CONSTRAINT [PK_KS_Adboard] PRIMARY KEY CLUSTERED 
(
	[boardid] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [boardid] ON [KS_Adboard] 
(
	[boardid] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adboard', @level2type=N'COLUMN',@level2name=N'boardid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adboard', @level2type=N'COLUMN',@level2name=N'BoardName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adboard', @level2type=N'COLUMN',@level2name=N'AdRate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位JS文件名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adboard', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最多广告数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adboard', @level2type=N'COLUMN',@level2name=N'Maxads'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adboard', @level2type=N'COLUMN',@level2name=N'Note'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位状态 0活动 1暂停' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adboard', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adboard', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'广告位数据表' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Adboard'
GO
/****** Object:  Table [dbo].[KS_AskZJ]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_AskZJ](
	[zjId] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[username] [nvarchar](50) NULL,
	[realname] [nvarchar](50) NULL,
	[birthday] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[UserFace] [nvarchar](255) NULL,
	[Tel] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[ProvinceId] [int] NULL,
	[CityId] [int] NULL,
	[CountyId] [int] NULL,
	[DanWei] [nvarchar](250) NULL,
	[TypeID] [int] NULL,
	[SCFL] [ntext] NULL,
	[Intro] [ntext] NULL,
	[IDCard] [nvarchar](255) NULL,
	[ZYZ] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[Verify] [tinyint] NULL,
	[Sex] [nvarchar](50) NULL,
	[Recommend] [tinyint] NULL,
	[AskNum] [int] NULL,
	[BestNum] [int] NULL,
	[ClassID] [int] NULL,
	[istop] [int] NULL,
 CONSTRAINT [PK_KS_AskZJ] PRIMARY KEY CLUSTERED 
(
	[zjId] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专家ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'zjId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'会员ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'userid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'会员名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'username'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专家姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'realname'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专家出生日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'birthday'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ号码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'QQ'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专家照片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'UserFace'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'ProvinceId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'CityId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城镇ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'CountyId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'工作单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'DanWei'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专家分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'擅长分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'SCFL'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专家介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'IDCard'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'执业证书' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'ZYZ'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'申请添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'审核标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'Verify'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'Recommend'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收到的提问总数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'AskNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最佳答案总数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'BestNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问答分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'置顶标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskZJ', @level2type=N'COLUMN',@level2name=N'istop'
GO
/****** Object:  Table [dbo].[KS_ProAsk]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProAsk](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProID] [int] NULL,
	[UserName] [varchar](50) NULL,
	[UserID] [int] NULL,
	[UserIP] [varchar](50) NULL,
	[Content] [varchar](255) NULL,
	[AddDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[ReplyUser] [varchar](50) NULL,
	[ReplyContent] [nvarchar](500) NULL,
	[ReplyDate] [datetime] NULL,
	[IsReply] [tinyint] NULL,
	[PhotoUrl] [text] NULL,
	[ProductType] [int] NULL,
 CONSTRAINT [PK_KS_ProAsk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自动编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'ProID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提问用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提问用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提问时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'UserIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提问内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提问时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否审核 1已审 0未审' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复的管理员名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'ReplyUser'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复的内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'ReplyContent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'ReplyDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否回复' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProAsk', @level2type=N'COLUMN',@level2name=N'IsReply'
GO
/****** Object:  Table [dbo].[KS_Favorite]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Favorite](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_Favorite] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ChannelID] ON [KS_Favorite] 
(
	[ChannelID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [InfoID] ON [KS_Favorite] 
(
	[InfoID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [UserID] ON [KS_Favorite] 
(
	[UserName] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Favorite', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Favorite', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Favorite', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收藏时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Favorite', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
/****** Object:  Table [dbo].[KS_ProFightGroup]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProFightGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) NULL,
	[PhotoUrl] [nvarchar](200) NULL,
	[BigPhoto] [nvarchar](250) NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[BigClassID] [int] NULL,
	[ClassID] [int] NULL,
	[Intro] [ntext] NULL,
	[Highlights] [ntext] NULL,
	[Protection] [ntext] NULL,
	[Notes] [ntext] NULL,
	[Locked] [tinyint] NULL,
	[EndTF] [tinyint] NULL,
	[AllowBMFlag] [tinyint] NULL,
	[AllowArrGroupID] [nvarchar](200) NULL,
	[minnum] [int] NULL,
	[minnumtime] [datetime] NULL,
	[IsSuccess] [tinyint] NULL,
	[FightGroupNum] [int] NULL,
	[Price_Original] [money] NULL,
	[FightGroupPrice] [money] NULL,
	[SinglePrice] [money] NULL,
	[Weight] [real] NULL,
	[Unit] [varchar](50) NULL,
	[LimitBuyNum] [int] NULL,
	[Recommend] [tinyint] NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[HasSellNum] [int] NULL,
	[RealSellNum] [int] NULL,
	[CleanCart] [tinyint] NULL,
	[ShowDelivery] [tinyint] NULL,
	[ShowPayMent] [tinyint] NULL,
	[Comment] [tinyint] NULL,
	[ChangesUrl] [nvarchar](255) NULL,
	[TemplateID] [nvarchar](255) NULL,
	[MapMarker] [nvarchar](255) NULL,
	[Inputer] [varchar](50) NULL,
	[IsBusiness] [tinyint] NULL,
	[FreightType] [tinyint] NULL,
	[Freight] [money] NULL,
	[Amount] [int] NULL,
	[AmountNum] [int] NULL,
	[PayID] [int] NULL,
	[LimitTime] [int] NULL,
	[FavNum] [int] NULL,
	[CmtNum] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProBrand]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProBrand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](200) NULL,
	[OrderID] [int] NULL,
	[ShowInTop] [tinyint] NULL,
	[PhotoUrl] [nvarchar](250) NULL,
	[Recommend] [tinyint] NULL,
	[Intro] [ntext] NULL,
	[firstAlphabet] [nvarchar](50) NULL,
	[BrandEName] [nvarchar](50) NULL,
	[num] [int] NULL,
	[TemplateFile] [nvarchar](255) NULL,
	[BigPhoto] [varchar](255) NULL,
 CONSTRAINT [PK_KS_ClassBrand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'BrandName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否前台显示' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'ShowInTop'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'Recommend'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌简介' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌首字母' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'firstAlphabet'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌英文名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'BrandEName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'品牌下的商品数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'num'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBrand', @level2type=N'COLUMN',@level2name=N'TemplateFile'
GO
/****** Object:  Table [dbo].[KS_AskTopic]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_AskTopic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[classid] [int] NULL,
	[UserId] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[UserIP] [varchar](50) NULL,
	[title] [nvarchar](255) NOT NULL,
	[Content] [ntext] NULL,
	[PostTable] [nvarchar](30) NULL,
	[AddDate] [datetime] NULL,
	[LastPostTime] [datetime] NULL,
	[SolveTime] [datetime] NULL,
	[verify] [tinyint] NULL,
	[IsSolve] [tinyint] NULL,
	[IsTop] [tinyint] NULL,
	[Reward] [int] NULL,
	[Hits] [int] NULL,
	[PostNum] [int] NULL,
	[Recommend] [tinyint] NULL,
	[AskUserID] [int] NULL,
	[BestUserName] [nvarchar](50) NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWords] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](255) NULL,
	[KeyTags] [nvarchar](255) NULL,
	[titleFontColor] [nvarchar](50) NULL,
	[DefaultPic] [nvarchar](50) NULL,
 CONSTRAINT [PK_KS_AskTopic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_KS_AskTopic] ON [KS_AskTopic] 
(
	[UserId] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问题ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'TopicID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'classid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'UserIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问题标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'问题详细内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复数据存放的表' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'PostTable'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提问时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后回答的时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'LastPostTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'解决时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'SolveTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'审核标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'verify'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否解决 1已解决 2关闭' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'IsSolve'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'置顶标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'IsTop'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'悬赏积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'Reward'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'Hits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回答数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'PostNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'Recommend'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专家ID号，是否向专家提问' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'AskUserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最佳答案的用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'BestUserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO 标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'SEOTitle'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关键字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'SEOKeyWords'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO 描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'SEODescription'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字Tags' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AskTopic', @level2type=N'COLUMN',@level2name=N'KeyTags'
GO
/****** Object:  Table [dbo].[KS_BBSTopic]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BBSTopic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[boardId] [int] NULL,
	[UserId] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[UserIP] [varchar](50) NULL,
	[Content] [nvarchar](4000) NULL,
	[PostTable] [nvarchar](30) NULL,
	[AddDate] [datetime] NULL,
	[LastPostTime] [datetime] NULL,
	[verify] [tinyint] NULL,
	[IsTop] [tinyint] NULL,
	[Hits] [int] NULL,
	[PostNum] [int] NULL,
	[Digg] [int] NULL,
	[IsBest] [tinyint] NULL,
	[KeyTags] [varchar](255) NULL,
	[Annex] [varchar](1000) NULL,
	[ReplyText] [nvarchar](4000) NULL,
 CONSTRAINT [PK_KS_BBSTopic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主题ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSTopic', @level2type=N'COLUMN',@level2name=N'TopicID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'版面ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSTopic', @level2type=N'COLUMN',@level2name=N'boardId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSTopic', @level2type=N'COLUMN',@level2name=N'UserId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BBSTopic', @level2type=N'COLUMN',@level2name=N'Annex'
GO
/****** Object:  Table [dbo].[KS_Model]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Model](
	[ChannelID] [int] NOT NULL,
	[ModelType] [tinyint] NULL,
	[ModelName] [nvarchar](50) NOT NULL,
	[ModelTable] [nvarchar](255) NOT NULL,
	[ModelItem] [nvarchar](50) NULL,
	[ModelItemUnit] [nvarchar](50) NULL,
	[ModelStatus] [tinyint] NULL,
	[ModelFolder] [nvarchar](50) NULL,
	[ModelFsoFolder] [nvarchar](255) NULL,
	[FsoListNum] [int] NULL,
	[Intro] [nvarchar](255) NULL,
	[SeoOption] [tinyint] NULL,
	[ChargesOption] [tinyint] NULL,
	[AttributeOption] [tinyint] NULL,
	[ReceiptOption] [tinyint] NULL,
	[PKOption] [tinyint] NULL,
	[ShowOption] [varchar](255) NULL,
	[FieldsXML] [ntext] NULL,
	[BasicType] [int] NULL,
	[AdminUpFilesTF] [tinyint] NULL,
	[AdminUpFilesDir] [nvarchar](100) NULL,
	[UserUpFilesTF] [int] NULL,
	[UserUpFilesDir] [nvarchar](255) NULL,
	[AllowUpFilesSize] [int] NULL,
	[AllowUpPhotoType] [nvarchar](200) NULL,
	[AllowUpFlashType] [nvarchar](200) NULL,
	[AllowUpMediaType] [nvarchar](200) NULL,
	[AllowUpRealType] [nvarchar](200) NULL,
	[AllowUpOtherType] [nvarchar](200) NULL,
	[AllowPublication] [int] NULL,
	[RecycleBin] [tinyint] NULL,
	[PublicationVerify] [tinyint] NULL,
	[PublicationRefreshHtmlOption] [nvarchar](50) NULL,
	[PublicationModifyVerify] [tinyint] NULL,
	[CommentType] [int] NULL,
	[CommentLen] [int] NULL,
	[NewestDay] [int] NULL,
	[CommentTemplate] [nvarchar](255) NULL,
	[SearchTF] [tinyint] NULL,
	[SearchTemplate] [nvarchar](255) NULL,
	[FsoHtmlType] [int] NULL,
	[DiggByVisitor] [tinyint] NULL,
	[DiggRepeat] [tinyint] NULL,
	[DiggPerTimes] [int] NULL,
	[Setting] [text] NULL,
	[ModelOrderId] [int] NULL,
 CONSTRAINT [PK_KS_Model] PRIMARY KEY CLUSTERED 
(
	[ChannelID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ChannelID] ON [KS_Model] 
(
	[ChannelID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FsoListNum] ON [KS_Model] 
(
	[FsoListNum] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型类型，系统自带或是用户自定义' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ModelType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ModelName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型数据表' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ModelTable'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ModelItem'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'项目单位' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ModelItemUnit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ModelStatus'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型英文目录' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ModelFolder'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型生成总目录' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ModelFsoFolder'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'自动生成列表分页数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'FsoListNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'启用SEO选项' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'SeoOption'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'启用收费选项' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ChargesOption'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'启用属性选项' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'AttributeOption'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'启用收费选项' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ReceiptOption'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'启用PK选项' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'PKOption'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型字段集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'FieldsXML'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型基类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'BasicType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许管理员上传标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'AdminUpFilesTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员上传目录' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'AdminUpFilesDir'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许会员上传标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'UserUpFilesTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'会员上传目录' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'UserUpFilesDir'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许上传的文件大小' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'AllowUpFilesSize'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许上传的图片类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'AllowUpPhotoType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许上传的flash类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'AllowUpFlashType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许上传的Windows 媒体类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'AllowUpMediaType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许上传的Real 媒体类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'AllowUpRealType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许上传的其它类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'AllowUpOtherType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'前台投稿总开关' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'AllowPublication'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'前台发布是否需要审核' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'PublicationVerify'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'投稿生成选项' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'PublicationRefreshHtmlOption'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'审核过的稿件是否允许修改' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'PublicationModifyVerify'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'本模型是否允许评论' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'CommentType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许评论字数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'CommentLen'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最新信息设置' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'NewestDay'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'CommentTemplate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用搜索' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'SearchTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'搜索模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'SearchTemplate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许游客Digg' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'DiggByVisitor'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许重复Digg' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'DiggRepeat'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户每digg一下自动增加' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'DiggPerTimes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型的一些配置参数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'Setting'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Model', @level2type=N'COLUMN',@level2name=N'ModelOrderId'
GO
/****** Object:  StoredProcedure [dbo].[KS_SJTKAdd]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_SJTKAdd]
@typeid int=0,
@classid int=0,
@tmtype int=0,
@title nvarchar(255),
@tmnr ntext,
@dajs ntext,
@tmfs float=0,
@answer ntext,
@optionnum int=0,
@orderid int=0,
@isrnd tinyint=0,
@ismedia tinyint=0,
@mediaurl varchar(255),
@mediatxt ntext,
@dajsmedia varchar(255),
@difficulty int=0,
@knowledgeid int=0,
@keywords nvarchar(255)
 AS
Insert Into KS_SJTK([typeid],[classid],[tmtype],[title],[tmnr],[dajs],[tmfs],[answer],[optionnum],[orderid],[isrnd],[ismedia],[mediaurl],[mediatxt],[dajsmedia],[difficulty],[knowledgeid],[keywords])                  
values(@typeid,@classid,@tmtype,@title,@tmnr,@dajs,@tmfs,@answer,@optionnum,@orderid,@isrnd,@ismedia,@mediaurl,@mediatxt,@dajsmedia,@difficulty,@knowledgeid,@keywords)
GO
/****** Object:  Table [dbo].[KS_SpecialClass]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SpecialClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](200) NOT NULL,
	[ClassEname] [nvarchar](50) NULL,
	[Descript] [ntext] NULL,
	[FsoIndex] [nvarchar](50) NULL,
	[TemplateFile] [nvarchar](255) NULL,
	[AddDate] [smalldatetime] NULL,
	[OrderID] [int] NULL,
	[PhotoUrl] [varchar](255) NULL,
 CONSTRAINT [PK_KS_SpecialClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialClass', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialClass', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'专题分类英文名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialClass', @level2type=N'COLUMN',@level2name=N'ClassEname'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialClass', @level2type=N'COLUMN',@level2name=N'Descript'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生成的分类首页文件名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialClass', @level2type=N'COLUMN',@level2name=N'FsoIndex'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类模板文件路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialClass', @level2type=N'COLUMN',@level2name=N'TemplateFile'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialClass', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialClass', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_SpecialClass', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
/****** Object:  Table [dbo].[KS_LabelClass]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_LabelClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[ParentIDPath] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[OrderID] [tinyint] NULL,
	[ClassType] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[From3G] [tinyint] NULL,
	[TemplateID] [int] NULL,
 CONSTRAINT [PK_KS_LabelClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LabelClass', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标签分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LabelClass', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LabelClass', @level2type=N'COLUMN',@level2name=N'ParentIDPath'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类说明' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LabelClass', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'父栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LabelClass', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LabelClass', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类类别' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LabelClass', @level2type=N'COLUMN',@level2name=N'ClassType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LabelClass', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否手机版建的' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LabelClass', @level2type=N'COLUMN',@level2name=N'From3G'
GO
/****** Object:  StoredProcedure [dbo].[KS_CommentNum]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CommentNum] 
 @InfoID Int=0,
 @BasicType int=0,
 @OutCommentNum int output
AS

  DECLARE @CommentNum int 
   If @BasicType=4 
    SELECT top 1 @CommentNum=CommentNum FROM [KS_ProductList] WHERE InfoID=@InfoID
 Else
    SELECT top 1 @CommentNum=CommentNum FROM [KS_InfoList] WHERE InfoID=@InfoID
    
    SELECT @OutCommentNum= @CommentNum
GO
/****** Object:  StoredProcedure [dbo].[KS_SJTKModify]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_SJTKModify]
@tmid int=0,
@classid int=0,
@tmtype int=0,
@title nvarchar(255),
@tmnr ntext,
@dajs ntext,
@tmfs float=0,
@answer ntext,
@optionnum int=0,
@orderid int=0,
@isrnd tinyint=0,
@ismedia tinyint=0,
@mediaurl varchar(255),
@mediatxt ntext,
@dajsmedia varchar(255),
@difficulty int=0,
@knowledgeid int=0,
@keywords nvarchar(255)
 AS
 UPDATE KS_SJTK SET 
 [classid]=@classid,
 [tmtype]=@tmtype,
 [title]=@title,
 [tmnr]=@tmnr,
 [dajs]=@dajs,
 [tmfs]=@tmfs,
 [answer]=@answer,
 [optionnum]=@optionnum,
 [orderid]=@orderid,
 [isrnd]=@isrnd,
 [ismedia]=@ismedia,
 [mediaurl]=@mediaurl,
 [mediatxt]=@mediatxt,
 [dajsmedia]=@dajsmedia,
 [difficulty]=@difficulty,
 [knowledgeid]=@knowledgeid,
 [keywords]=@keywords WHERE tmid=@tmid
GO
/****** Object:  Table [dbo].[KS_Business]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Business](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[UserID] [int] NULL,
	[TemplateID] [int] NULL,
	[verify] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[CompanyName] [varchar](200) NULL,
	[logo] [varchar](100) NULL,
	[introduce] [text] NULL,
	[Details] [text] NULL,
	[Characteristic] [text] NULL,
	[BusinessLicense] [varchar](50) NULL,
	[LegalPeople] [varchar](100) NULL,
	[Address] [varchar](500) NULL,
	[EarnestMoney] [money] NULL,
	[Business] [varchar](200) NULL,
	[Foundation] [varchar](50) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyId] [int] NULL,
	[CatetoryID] [int] NULL,
	[mapID] [varchar](100) NULL,
	[ContactMan] [varchar](100) NULL,
	[ZipCode] [int] NULL,
	[QQ] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[telephone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[WebUrl] [varchar](200) NULL,
	[BankPeople] [nvarchar](50) NULL,
	[BankAccount] [varchar](50) NULL,
	[branch] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[Alipay] [varchar](50) NULL,
	[SMSNunber] [varchar](50) NULL,
	[photo] [varchar](50) NULL,
	[cardid] [varchar](18) NULL,
	[cardphoto] [varchar](50) NULL,
	[adddate] [datetime] NULL,
	[Hits] [int] NULL,
	[Recommend] [tinyint] NULL,
	[SeoKeyWords] [varchar](100) NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Free] [int] NULL,
	[ShopTotal] [int] NULL,
	[BestTotal] [int] NULL,
	[BetterToal] [int] NULL,
	[BadTotal] [int] NULL,
	[CreditScore] [int] NULL,
	[CorrespondToal] [float] NULL,
	[ServiceTotal] [float] NULL,
	[DeliverToal] [float] NULL,
	[LogDeliverToal] [float] NULL,
	[OrderTotal] [int] NULL,
	[ShopCmtTotal] [int] NULL,
	[newsTotal] [int] NULL,
	[AskTotal] [int] NULL,
	[MessageTotal] [int] NULL,
	[SmsTotal] [int] NULL,
	[LetterTotal] [int] NULL,
	[IsContact] [tinyint] NULL,
	[Dlogo] [varchar](100) NULL,
	[OtherMan] [varchar](100) NULL,
	[OtherPhone] [varchar](100) NULL,
	[IsSite] [tinyint] NULL,
	[IsPhcon] [tinyint] NULL,
	[PhconNum] [varchar](50) NULL,
	[IsReply] [tinyint] NULL,
	[Replycon] [text] NULL,
	[Quick] [text] NULL,
	[IsFamous] [tinyint] NULL,
	[Hot] [tinyint] NULL,
	[Important] [tinyint] NULL,
	[FreeEnddate] [datetime] NULL,
	[OpenTime] [datetime] NULL,
	[EpFreeEnddate] [datetime] NULL,
	[IsSms] [tinyint] NULL,
	[SmsNumber] [varchar](50) NULL,
	[SmsContent] [varchar](500) NULL,
	[IsEmail] [tinyint] NULL,
	[OtherEmail] [varchar](50) NULL,
	[EmailContent] [varchar](500) NULL,
	[RankID] [int] NULL,
	[BusinessAction] [tinyint] NULL,
	[FavoriteHits] [int] NULL,
	[BestRate] [float] NULL,
	[BetterRate] [float] NULL,
	[BadRate] [float] NULL,
 CONSTRAINT [PK_KS_Business_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Label]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Label](
	[LabelID] [int] NOT NULL,
	[LabelName] [nvarchar](50) NOT NULL,
	[LabelContent] [ntext] NULL,
	[Description] [ntext] NULL,
	[ClassID] [int] NULL,
	[OrderID] [tinyint] NULL,
	[LabelType] [tinyint] NULL,
	[LabelFlag] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[From3G] [tinyint] NULL,
	[TemplateID] [int] NULL,
	[JsonID] [nvarchar](200) NULL,
 CONSTRAINT [PK_KS_Label] PRIMARY KEY NONCLUSTERED 
(
	[LabelID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否手机版建的' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Label', @level2type=N'COLUMN',@level2name=N'From3G'
GO
/****** Object:  Table [dbo].[KS_ProCouponMessage]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProCouponMessage](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[MessageTypeName] [nvarchar](255) NULL,
	[Content1] [ntext] NULL,
	[Content2] [ntext] NULL,
	[Content3] [ntext] NULL,
	[AddDate] [datetime] NULL,
	[DefaultNum] [int] NULL,
	[MsgWarnType] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_InfoList]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_InfoList](
	[InfoID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[TitleFontColor] [nvarchar](20) NULL,
	[DefaultPic] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Hits] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[CopyFrom] [nvarchar](100) NULL,
	[Author] [nvarchar](100) NULL,
	[AddDate] [datetime] NULL,
	[Attribute] [nvarchar](50) NULL,
	[Priority] [int] NULL,
	[Inputer] [nvarchar](100) NULL,
	[RefreshTF] [tinyint] NULL,
	[ShowOn3G] [tinyint] NULL,
	[FileName] [nvarchar](255) NULL,
	[TurnUrl] [nvarchar](255) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[Verify] [tinyint] NULL,
	[InfoPurview] [tinyint] NULL,
	[ArrGroupID] [nvarchar](100) NULL,
	[ReadPoint] [money] NULL,
	[ChargeType] [tinyint] NULL,
	[PitchTime] [int] NULL,
	[ReadTimes] [int] NULL,
	[DividePercent] [int] NULL,
	[PKID] [int] NULL,
	[VoteID] [int] NULL,
	[CommentNum] [int] NULL,
	[DelTF] [tinyint] NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[SocialIDs] [varchar](255) NULL,
	[IsTips] [tinyint] NULL,
	[GoodNum] [int] NULL,
	[BadNum] [int] NULL,
	[FavNum] [int] NULL,
	[ShareNum] [int] NULL,
 CONSTRAINT [PK_KS_InfoList] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ArrGroupID] ON [KS_InfoList] 
(
	[ArrGroupID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ChannelID] ON [KS_InfoList] 
(
	[ChannelID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_KS_InfoList] ON [KS_InfoList] 
(
	[ClassID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_KS_InfoList_1] ON [KS_InfoList] 
(
	[Priority] ASC
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [NewsID] ON [KS_InfoList] 
(
	[InfoID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题颜色' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'TitleFontColor'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'默认图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'DefaultPic'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档简介' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字Tags' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'KeyTags'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'总点击数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'Hits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'日点击数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'HitsByDay'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'周点击量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'HitsByWeek'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'月点击量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'HitsByMonth'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后点击时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'LastHitsTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'来源' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'CopyFrom'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'作者' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'Author'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档属性' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'Attribute'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档优先级' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'Priority'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入者' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'Inputer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生成标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'RefreshTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'3G版里显示' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'ShowOn3G'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'生成的文件名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'转向链接' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'TurnUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'ProvinceID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城镇ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'CountyID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'审核标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'Verify'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览权限' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'InfoPurview'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许浏览的用户组ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'ArrGroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览点券数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'ReadPoint'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收费方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'ChargeType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收费间隔时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'PitchTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读次数后重新收费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'ReadTimes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分成比率' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'DividePercent'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'PKID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'PKID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'调查ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'VoteID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'CommentNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下载附件费用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'AttachmentCharge'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'多个附件是否重复收费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'AttachmentChargeOnce'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发布到社交网站返回的ID集，格式为：新浪微博|QQ微博|' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'SocialIDs'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'投稿是否邮件通知' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_InfoList', @level2type=N'COLUMN',@level2name=N'IsTips'
GO
/****** Object:  Table [dbo].[KS_ProOrder]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PayOrderID] [nvarchar](50) NULL,
	[OrderID] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[OrderTotalPrice] [money] NULL,
	[GoodsMoney] [money] NULL,
	[Freight] [money] NULL,
	[Taxes] [float] NULL,
	[PayDiscountMoney] [money] NULL,
	[Invoice] [text] NULL,
	[IsInvoice] [tinyint] NULL,
	[Invoiced] [tinyint] NULL,
	[MoneyReceipt] [money] NULL,
	[InputTime] [datetime] NULL,
	[deliveryDate] [nvarchar](100) NULL,
	[SpecifiedDate] [nvarchar](100) NULL,
	[deliveryTime] [nvarchar](100) NULL,
	[Remark] [nvarchar](500) NULL,
	[PaymentID] [int] NULL,
	[DeliverID] [int] NULL,
	[Status] [int] NULL,
	[OrderScore] [int] NULL,
	[ScoreTF] [tinyint] NULL,
	[RealName] [varchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[DeliverStatus] [int] NULL,
	[IsAnonymous] [tinyint] NULL,
	[CouponUserID] [int] NULL,
	[NoUseCouponMoney] [money] NULL,
	[UseCouponMoney] [money] NULL,
	[PayTime] [datetime] NULL,
	[PaymentPlatId] [int] NULL,
	[PayStatus] [int] NULL,
	[alipaytradestatus] [varchar](50) NULL,
	[alipaytradeno] [varchar](50) NULL,
	[OrderType] [tinyint] NULL,
	[SmsNum] [int] NULL,
	[IsTips] [tinyint] NULL,
	[ChangeScore] [int] NULL,
	[VerifyCode] [nvarchar](50) NULL,
	[Business] [nvarchar](50) NULL,
	[IsBusinessConfirm] [tinyint] NULL,
	[ConsumptionMode] [tinyint] NULL,
	[IsBusiness] [tinyint] NULL,
	[IsFrontPay] [tinyint] NULL,
	[FrontMoney] [money] NULL,
	[SaveMoney] [money] NULL,
	[PayID] [int] NULL,
	[StoreID] [int] NULL,
	[Agent] [nvarchar](200) NULL,
	[OrderDevice] [int] NULL,
	[SettleTime] [datetime] NULL,
	[SettleInputer] [nvarchar](50) NULL,
	[CouponUserID1] [int] NULL,
	[UseRedPacketMoney] [money] NULL,
	[DeliverDate] [datetime] NULL,
	[IsReceivExtended] [tinyint] NULL,
	[UserID] [int] NULL,
	[ExpressNumber] [nvarchar](255) NULL,
	[ExpressCorpId] [int] NULL,
	[IsLeader] [int] NULL,
	[JoinNum] [int] NULL,
	[GoupNum] [int] NULL,
	[IsEnd] [int] NULL,
 CONSTRAINT [PK_KS_ProOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_KS_ProOrder] ON [KS_ProOrder] 
(
	[UserName] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号（自动生成）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单总金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'OrderTotalPrice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'GoodsMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Freight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'税金' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Taxes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'付款方式优惠金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'PayDiscountMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发票信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Invoice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否要发票' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'IsInvoice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已开发票' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Invoiced'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'已收到的定金' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'MoneyReceipt'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下单时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'InputTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发货时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'deliveryDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'客户指定的送货日期' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'SpecifiedDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'客户指定的送货时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'deliveryTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'付款方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'PaymentID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'送货方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'DeliverID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单状态 0待确认 1已确认 2已结清 3.退货 4、申请退货 5、申请换货' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'得总积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'OrderScore'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'积分是否送出' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'ScoreTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'客户姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'送货地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮正编码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'ProvinceID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城市ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'城镇ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'CountyID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'送货标志 0未发货 1发货 2确认收货 3退货成功 4换货成功' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'DeliverStatus'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否匿名订单' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'IsAnonymous'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'CouponUserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'没有使用优惠券的订单金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'NoUseCouponMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'优惠券抵扣金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'UseCouponMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'付款时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'PayTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'使用的支付平台ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'PaymentPlatId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'付款状态 1付清 2已收定金　0未付款' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'PayStatus'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付宝返回的交易状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'alipaytradestatus'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'支付宝的交易订单流水号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'alipaytradeno'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'1团购订单' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'OrderType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'短信通知次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'SmsNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标志是否已经新订单通知管理员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'IsTips'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'兑换积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'ChangeScore'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手机消费验证码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'VerifyCode'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商家名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'Business'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商家已确认' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'IsBusinessConfirm'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'消费方式 1邮寄' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'ConsumptionMode'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否是商家订单' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'IsBusiness'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否定金支付订单' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'IsFrontPay'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'需要支付的定金' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'FrontMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商城活动优惠金额' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'SaveMoney'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收款ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'PayID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'上门自提门店ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'StoreID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'订单来源 0 PC 1手机 2微信' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'OrderDevice'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'结清时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'SettleTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'结清操作员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrder', @level2type=N'COLUMN',@level2name=N'SettleInputer'
GO
/****** Object:  Table [dbo].[KS_LogSMS]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_LogSMS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Mobile] [varchar](50) NULL,
	[AddDate] [datetime] NULL,
	[IsSuccess] [tinyint] NULL,
	[UserName] [varchar](50) NULL,
	[Remark] [text] NULL,
	[Content] [text] NULL,
	[UserIP] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
 CONSTRAINT [PK_KS_LogSMS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogSMS', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogSMS', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'成功标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogSMS', @level2type=N'COLUMN',@level2name=N'IsSuccess'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogSMS', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogSMS', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发送内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogSMS', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发送的模型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogSMS', @level2type=N'COLUMN',@level2name=N'Model'
GO
/****** Object:  Table [dbo].[KS_LogPoint]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_LogPoint](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[AddDate] [datetime] NULL,
	[IP] [nvarchar](50) NULL,
	[InOrOutFlag] [int] NULL,
	[Point] [money] NULL,
	[NowPoint] [money] NULL,
	[Times] [int] NULL,
	[Inputer] [nvarchar](50) NULL,
	[Remark] [nvarchar](255) NULL,
 CONSTRAINT [PK_KS_LogPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ChannelID] ON [KS_LogPoint] 
(
	[ChannelID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_LogPoint] 
(
	[ID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [InfoID] ON [KS_LogPoint] 
(
	[InfoID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'序号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'入账或扣费标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'InOrOutFlag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点券' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'Point'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'当前剩余点券' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'NowPoint'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'重复次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'Times'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入者' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'Inputer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogPoint', @level2type=N'COLUMN',@level2name=N'Remark'
GO
/****** Object:  Table [dbo].[KS_ProSendManage]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProSendManage](
	[SendID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](255) NULL,
	[Consignor] [nvarchar](255) NULL,
	[SendAddress] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
	[Mobilephone] [nvarchar](255) NULL,
	[Telephone] [nvarchar](255) NULL,
	[Explain1] [ntext] NULL,
	[Explain2] [ntext] NULL,
	[Explain3] [ntext] NULL,
	[Explain4] [ntext] NULL,
	[Explain5] [ntext] NULL,
	[AddDate] [datetime] NULL,
	[DefaultNum] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_CollectionItem]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_CollectionItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](255) NULL,
	[ModelID] [int] NULL,
	[ClassID] [int] NULL,
	[SiteName] [nvarchar](255) NULL,
	[CollectUrl] [nvarchar](255) NULL,
	[Encoding] [nvarchar](100) NULL,
	[Attribute] [nvarchar](50) NULL,
	[CollectOption] [nvarchar](50) NULL,
	[CollectListNum] [int] NULL,
	[CollectInfoNum] [int] NULL,
	[Remark] [nvarchar](255) NULL,
	[PauseTime] [int] NULL,
	[PausePerNum] [int] NULL,
	[ListBeginTag] [ntext] NULL,
	[ListEndTag] [ntext] NULL,
	[LinkBeginTag] [ntext] NULL,
	[LinkEndTag] [ntext] NULL,
	[PageType] [int] NULL,
	[PageUrl] [nvarchar](255) NULL,
	[PageStartID] [int] NULL,
	[PageEndID] [int] NULL,
	[PageListUrl] [ntext] NULL,
	[FieldsRuleXml] [ntext] NULL,
	[AddDate] [smalldatetime] NULL,
	[IsCanCollect] [tinyint] NULL,
	[LastCollectTime] [smalldatetime] NULL,
	[IsCreateHtml] [tinyint] NULL,
	[SpecialID] [nvarchar](255) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
 CONSTRAINT [PK_KS_CollectionItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集项目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集项目名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'ModelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集的网站名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'SiteName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'CollectUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'对方网站编码方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'Encoding'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'设置默认属性' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'Attribute'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集选项标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'CollectOption'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'列表深度' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'CollectListNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集信息数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'CollectInfoNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集项目介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'暂停时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'PauseTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集多少篇文章暂停' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'PausePerNum'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'列表开始标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'ListBeginTag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'列表结束标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'ListEndTag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'链接开始标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'LinkBeginTag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'链接结束标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'LinkEndTag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分页方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'PageType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分页URL' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'PageUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'批量生成的开始ID号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'PageStartID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分页批量生成的结束ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'PageEndID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'采集的字段规则集合' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'FieldsRuleXml'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可用的采集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'IsCanCollect'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后采集时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'LastCollectTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否生成静态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionItem', @level2type=N'COLUMN',@level2name=N'IsCreateHtml'
GO
/****** Object:  Table [dbo].[KS_WeixinKF]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_WeixinKF](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[kf_account] [nvarchar](255) NULL,
	[kf_headimgurl] [nvarchar](255) NULL,
	[kf_id] [nvarchar](255) NULL,
	[kf_nick] [nvarchar](255) NULL,
	[kf_wx] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_DownServer]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_DownServer](
	[DownID] [int] NOT NULL,
	[ChannelID] [int] NULL,
	[DownloadName] [nvarchar](50) NULL,
	[DownloadPath] [nvarchar](255) NULL,
	[rootid] [int] NULL,
	[orders] [int] NULL,
	[parentid] [int] NULL,
	[child] [int] NULL,
	[IsLock] [tinyint] NOT NULL,
	[IsOuter] [int] NULL,
	[UnionID] [nvarchar](50) NULL,
	[selfont] [nvarchar](255) NULL,
	[AllDownHits] [int] NOT NULL,
	[DayDownHits] [int] NOT NULL,
	[HitsTime] [datetime] NULL,
 CONSTRAINT [PK_KS_DownServer] PRIMARY KEY CLUSTERED 
(
	[DownID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ChannelID] ON [KS_DownServer] 
(
	[ChannelID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [parentid] ON [KS_DownServer] 
(
	[parentid] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [rootid] ON [KS_DownServer] 
(
	[rootid] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [serverid] ON [KS_DownServer] 
(
	[DownID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [UnionID] ON [KS_DownServer] 
(
	[UnionID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'DownID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下载服务器名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'DownloadName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下载路径' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'DownloadPath'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'级别标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'rootid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'orders'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'父ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'parentid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'子服务器数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'child'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'IsLock'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否外部连接' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'IsOuter'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联盟ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'UnionID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'字体' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'selfont'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'总下载数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'AllDownHits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'日下载数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'DayDownHits'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后下载时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_DownServer', @level2type=N'COLUMN',@level2name=N'HitsTime'
GO
/****** Object:  Table [dbo].[KS_SignIn]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_SignIn](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NULL,
	[UserID] [int] NULL,
	[UserIP] [nvarchar](255) NULL,
	[Status] [int] NULL,
	[Num] [float] NULL,
	[NumType] [int] NULL,
	[Islianxu] [int] NULL,
	[AddDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProBundleSelect]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProBundleSelect](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[InfoID] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Price] [money] NULL,
	[Num] [int] NULL,
	[addDate] [datetime] NULL,
	[AttrID] [int] NULL,
 CONSTRAINT [PK_KS_ProBundleSelect] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [cartInfoId] ON [KS_ProBundleSelect] 
(
	[CartID] ASC,
	[InfoID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSelect', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'物购物ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSelect', @level2type=N'COLUMN',@level2name=N'CartID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSelect', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSelect', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'销售价' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSelect', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购买数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSelect', @level2type=N'COLUMN',@level2name=N'Num'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSelect', @level2type=N'COLUMN',@level2name=N'addDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品属性ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBundleSelect', @level2type=N'COLUMN',@level2name=N'AttrID'
GO
/****** Object:  Table [dbo].[KS_U_Article]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_U_Article](
	[InfoID] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[PageTitle] [ntext] NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[TitleFontColor] [nvarchar](50) NULL,
	[Attribute] [nvarchar](255) NULL,
	[DefaultPic] [nvarchar](255) NULL,
	[TurnUrl] [nvarchar](255) NULL,
	[priority] [int] NULL,
	[Rank] [nvarchar](50) NULL,
	[Hits] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[VoteID] [int] NULL,
	[TemplateFile] [nvarchar](255) NULL,
	[Template3GFile] [nvarchar](255) NULL,
	[ShowON3G] [tinyint] NULL,
	[FileName] [nvarchar](255) NULL,
	[RefreshTF] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[DelTF] [tinyint] NULL,
	[Inputer] [nvarchar](100) NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[SocialIDs] [varchar](255) NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWords] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](255) NULL,
	[CommentNum] [int] NULL,
	[CopyFrom] [nvarchar](255) NULL,
	[Author] [nvarchar](255) NULL,
	[ProvinceID] [int] NULL,
	[ArrGroupID] [nvarchar](255) NULL,
	[ReadPoint] [money] NULL,
	[ChargeType] [tinyint] NULL,
	[PitchTime] [int] NULL,
	[ReadTimes] [int] NULL,
	[DividePercent] [int] NULL,
	[PKID] [int] NULL,
	[InfoPurview] [tinyint] NULL,
	[Channelid] [int] NULL,
	[GoodNum] [int] NULL,
	[BadNum] [int] NULL,
	[FavNum] [int] NULL,
	[ShareNum] [int] NULL,
 CONSTRAINT [PK_KS_U_Article] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_KS_U_Article] ON [KS_U_Article] 
(
	[ClassID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Article', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Article', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'栏目ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Article', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档详细内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_U_Article', @level2type=N'COLUMN',@level2name=N'Content'
GO
/****** Object:  Table [dbo].[KS_ProGroupOneClass]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProGroupOneClass](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[className] [nvarchar](50) NOT NULL,
	[rootid] [int] NULL,
	[orders] [int] NULL,
	[parentid] [int] NULL,
	[child] [int] NULL,
	[IsLock] [tinyint] NULL,
	[InfoNum] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_BlogClass]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[OrderID] [int] NOT NULL,
	[IsDefault] [tinyint] NULL,
 CONSTRAINT [PK_KS_BLOGCLASS] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogClass', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogClass', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogClass', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否默认' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogClass', @level2type=N'COLUMN',@level2name=N'IsDefault'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'日志分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogClass'
GO
/****** Object:  Table [dbo].[KS_LogScore]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_LogScore](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[AddDate] [datetime] NULL,
	[IP] [nvarchar](50) NULL,
	[InOrOutFlag] [tinyint] NULL,
	[Score] [int] NULL,
	[NowScore] [int] NULL,
	[AvailableScore] [int] NULL,
	[inputer] [nvarchar](50) NULL,
	[remark] [nvarchar](255) NULL,
	[ChannelID] [int] NULL,
	[infoid] [int] NULL,
	[Times] [int] NULL,
 CONSTRAINT [PK_KS_LogScore] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'入账或扣费标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'InOrOutFlag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'当前剩余积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'NowScore'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'可用积分' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'AvailableScore'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'录入员' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'inputer'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'infoid'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_LogScore', @level2type=N'COLUMN',@level2name=N'Times'
GO
/****** Object:  Table [dbo].[KS_WorkTable]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WorkTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[ItemName] [varchar](255) NOT NULL,
	[Ico] [varchar](255) NULL,
	[Url] [varchar](255) NULL,
	[Intro] [varchar](255) NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_KS_WorkTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'工作台记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WorkTable', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员账号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WorkTable', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'工作台显示的项目名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WorkTable', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'工作台显示的图标' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WorkTable', @level2type=N'COLUMN',@level2name=N'Ico'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'工作台的链接地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WorkTable', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'简要介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WorkTable', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_WorkTable', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
/****** Object:  Table [dbo].[KS_BlogClassify]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogClassify](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_KS_BLOGCLASSIFY] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogClassify', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogClassify', @level2type=N'COLUMN',@level2name=N'ClassName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogClassify', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'空间分类' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogClassify'
GO
/****** Object:  Table [dbo].[KS_UploadFiles]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UploadFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[FileName] [nvarchar](255) NOT NULL,
	[DTimes] [int] NULL,
	[DSize] [int] NULL,
	[AliasName] [nvarchar](255) NULL,
	[isAffix] [tinyint] NULL,
	[UserName] [nvarchar](100) NULL,
 CONSTRAINT [PK_KS_UploadFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UploadFiles', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UploadFiles', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UploadFiles', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UploadFiles', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'下载次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UploadFiles', @level2type=N'COLUMN',@level2name=N'DTimes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小（字节）' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UploadFiles', @level2type=N'COLUMN',@level2name=N'DSize'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件别名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UploadFiles', @level2type=N'COLUMN',@level2name=N'AliasName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否附件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UploadFiles', @level2type=N'COLUMN',@level2name=N'isAffix'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'上传人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_UploadFiles', @level2type=N'COLUMN',@level2name=N'UserName'
GO
/****** Object:  Table [dbo].[KS_UserRechargeItem]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [KS_UserRechargeItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RechargeWay] [tinyint] NULL,
	[AddWay] [tinyint] NULL,
	[name] [varchar](200) NULL,
	[FaceValue] [money] NULL,
	[PointNumber] [int] NULL,
	[PointType] [int] NULL,
	[UseDate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[IsSell] [tinyint] NULL,
	[IsUse] [tinyint] NULL,
	[Users] [varchar](50) NULL,
	[RechargeDate] [datetime] NULL,
	[GroupId] [varchar](50) NULL,
	[UsedGroupId] [int] NULL,
	[EndGroupId] [int] NULL,
	[adddate] [datetime] NULL,
	[Inputer] [varchar](50) NULL,
 CONSTRAINT [PK_KS_UserRechargeItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDVerifySelect]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_PKGDVerifySelect]
@Ids nvarchar(1000)
 AS
  If @Ids=''
    return null
 Else
   Begin
  DECLARE @SQL Nvarchar(3000)
  SET @SQL='Update KS_PKGD SET Status=1 WHERE ID In('+@ids+')'
  EXEC (@SQL)
  End
GO
/****** Object:  Table [dbo].[KS_Admin]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[PrUserName] [nvarchar](50) NULL,
	[RealName] [nvarchar](20) NULL,
	[Tel] [nvarchar](15) NULL,
	[Descript] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[LastLoginIP] [nvarchar](50) NULL,
	[LastLoginTime] [datetime] NULL,
	[LastLogoutTime] [datetime] NULL,
	[LoginTimes] [int] NULL,
	[Locked] [tinyint] NULL,
	[SysAdmin] [tinyint] NULL,
	[UserType] [tinyint] NULL,
	[PowerList] [ntext] NULL,
	[DocPower] [tinyint] NULL,
	[UserFace] [varchar](255) NULL,
	[Role] [int] NULL,
	[StoreIds] [nvarchar](500) NULL,
 CONSTRAINT [PK_KS_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_Admin] 
(
	[ID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'PassWord'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'前台用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'PrUserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'Descript'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'LastLoginIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登录时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'LastLoginTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最后登出时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'LastLogoutTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'登录次数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'LoginTimes'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'锁定标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'Locked'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'系统管理员标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'SysAdmin'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员类型' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'UserType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'权限值' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'PowerList'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可以管理有权限栏目非自己添加的文章' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Admin', @level2type=N'COLUMN',@level2name=N'DocPower'
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDUnVerifySelect]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_PKGDUnVerifySelect]
@Ids nvarchar(1000)
 AS
  If @Ids=''
    return null
 Else
   Begin
  DECLARE @SQL Nvarchar(3000)
  SET @SQL='Update KS_PKGD SET Status=0  WHERE ID In('+@ids+')'
  EXEC (@SQL)
  End
GO
/****** Object:  Table [dbo].[KS_YunOpenUser]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_YunOpenUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Domain] [nvarchar](255) NULL,
	[AppID] [nvarchar](255) NULL,
	[AppKey] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[EMail] [nvarchar](255) NULL,
	[Mobile] [nvarchar](255) NULL,
	[YazTokenDate] [datetime] NULL,
	[Token] [nvarchar](200) NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDDelete]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_PKGDDelete]
@Ids nvarchar(1000)
 AS
  If @Ids=''
    return null
 Else
   Begin
  DECLARE @SQL Nvarchar(3000)
  SET @SQL='Delete From KS_PKGD WHERE ID In('+@ids+')'
  EXEC (@SQL)
  End
GO
/****** Object:  Table [dbo].[KS_MoodList]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_MoodList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MoodID] [int] NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[M0] [int] NULL,
	[M1] [int] NULL,
	[M2] [int] NULL,
	[M3] [int] NULL,
	[M4] [int] NULL,
	[M5] [int] NULL,
	[M6] [int] NULL,
	[M7] [int] NULL,
	[M8] [int] NULL,
	[M9] [int] NULL,
	[M10] [int] NULL,
	[M11] [int] NULL,
	[M12] [int] NULL,
	[M13] [int] NULL,
	[M14] [int] NULL,
 CONSTRAINT [PK_KS_MoodList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'心情指数ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'MoodID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'模型ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'ChannelID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文档标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项1票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M0'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项2票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M1'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项3票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M2'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项4票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M3'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项5票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M4'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项6票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M5'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项7票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M6'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项8票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M7'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项9票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M8'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项10票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M9'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项11票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M10'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项12票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M11'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项13票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M12'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项14票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M13'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项15票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_MoodList', @level2type=N'COLUMN',@level2name=N'M14'
GO
/****** Object:  Table [dbo].[KS_ProImages]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProImages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[PhotoUrl] [nvarchar](255) NULL,
	[BigPhoto] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_KS_ProImages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProImages', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProImages', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'小图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProImages', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'大图' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProImages', @level2type=N'COLUMN',@level2name=N'BigPhoto'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'简要介绍' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProImages', @level2type=N'COLUMN',@level2name=N'Intro'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProImages', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGetGDInfo]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_PKGetGDInfo]
@id int=0
 AS
SELECT TOP 1 * FROM KS_PKGD WHERE id=@id
GO
/****** Object:  Table [dbo].[KS_Form]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Form](
	[FormID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) NULL,
	[FormTemplate] [nvarchar](255) NULL,
	[FieldsXML] [ntext] NULL,
	[TimeLimit] [tinyint] NULL,
	[BeginDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[LimitIP] [smallint] NULL,
	[UserTF] [tinyint] NULL,
	[UploadUserTF] [tinyint] NULL,
	[AllowGroupID] [nvarchar](100) NULL,
	[UserOnce] [tinyint] NULL,
	[Descript] [ntext] NULL,
	[VerifyTF] [tinyint] NULL,
	[CodeType] [int] NULL,
	[FileName] [nvarchar](100) NULL,
	[Status] [tinyint] NULL,
	[MaxItemID] [int] NULL,
	[IsSendMail] [tinyint] NULL,
	[SuccessTips] [varchar](255) NULL,
	[SuccessUrl] [varchar](255) NULL,
	[MailTemplate] [text] NULL,
	[isReply] [tinyint] NULL,
	[isPay] [tinyint] NULL,
	[PayMoney] [money] NULL,
	[PaySuccessSms] [nvarchar](500) NULL,
	[ShowOnUser] [tinyint] NULL,
	[Score] [int] NULL,
	[setting] [ntext] NULL,
 CONSTRAINT [PK_KS_Form] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [AllowGroupID] ON [KS_Form] 
(
	[AllowGroupID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CodeType] ON [KS_Form] 
(
	[CodeType] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_Form] 
(
	[FormID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [MaxItemID] ON [KS_Form] 
(
	[MaxItemID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ShowNum] ON [KS_Form] 
(
	[VerifyTF] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'表单ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'FormID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'表单项目名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'表单模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'FormTemplate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'表单字段集' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'FieldsXML'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'时间限制' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'TimeLimit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过期时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'ExpireDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'IP限制' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'LimitIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'UserTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'允许提交的用户组ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'AllowGroupID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'每个用户只允许提交一次' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'UserOnce'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'Descript'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'审核标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'VerifyTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'调用方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'CodeType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'FileName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最大表单项ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'MaxItemID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否发邮件通知' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'IsSendMail'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提交成功提示信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'SuccessTips'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'提交成功跳转URL' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'SuccessUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件模板' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Form', @level2type=N'COLUMN',@level2name=N'MailTemplate'
GO
/****** Object:  Table [dbo].[KS_Log]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[ResultTF] [tinyint] NULL,
	[ActionIP] [nvarchar](50) NULL,
	[ActionTime] [datetime] NULL,
	[ScriptName] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_KS_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Log', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Log', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'成功标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Log', @level2type=N'COLUMN',@level2name=N'ResultTF'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'操作IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Log', @level2type=N'COLUMN',@level2name=N'ActionIP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Log', @level2type=N'COLUMN',@level2name=N'ActionTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'运行的文件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Log', @level2type=N'COLUMN',@level2name=N'ScriptName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_Log', @level2type=N'COLUMN',@level2name=N'Description'
GO
/****** Object:  Table [dbo].[KS_AdminRole]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_AdminRole](
	[RoleID] [int] NULL,
	[RoleName] [nvarchar](255) NULL,
	[Remark] [ntext] NULL,
	[OrderID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProAmount]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProAmount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProID] [int] NULL,
	[AttrID] [int] NULL,
	[StoreID] [int] NULL,
	[Amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[KS_GetUserByGroupIDS]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_GetUserByGroupIDS]
@GroupIDS varchar(200)
 AS
 Declare @SQL Varchar(1000)
 Set @SQL='SELECT UserID,UserFace,UserName,RealName,Email,Sex,IDCard FROM [KS_USER] WHERE GroupID in'+'('+@GroupIDs+')'+' Order BY UserID Desc'
 Exec (@SQL)
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGetGDList]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_PKGetGDList] 
@num int=0,
@pkid int=0,
@role int=1
as
 declare @SQL Nvarchar(3000)
 SET @SQL='select top ' +convert(nvarchar(50),@num) +'  * from [KS_PKGD] Where pkid='+convert(nvarchar(50),@pkid)+' and role='+convert(nvarchar(50),@role)+' Order by id desc'
 Exec (@SQL)
GO
/****** Object:  Table [dbo].[KS_UserRechargeCard]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserRechargeCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RechargeWay] [tinyint] NULL,
	[AddWay] [tinyint] NULL,
	[name] [varchar](200) NULL,
	[Cardnumber] [varchar](200) NULL,
	[password] [varchar](200) NULL,
	[FaceValue] [money] NULL,
	[PointNumber] [int] NULL,
	[PointType] [int] NULL,
	[UseDate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[IsSell] [tinyint] NULL,
	[IsUse] [tinyint] NULL,
	[Users] [varchar](50) NULL,
	[RechargeDate] [datetime] NULL,
	[GroupId] [varchar](50) NULL,
	[UsedGroupId] [int] NULL,
	[EndGroupId] [int] NULL,
	[adddate] [datetime] NULL,
	[Inputer] [varchar](50) NULL,
	[ItemID] [int] NULL,
 CONSTRAINT [PK_KS_UserRechargeCard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_VoteLog]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_VoteLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[VoteID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[IP] [nvarchar](50) NULL,
	[VoteDate] [datetime] NULL,
 CONSTRAINT [PK_KS_VoteLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ID] ON [KS_VoteLog] 
(
	[LogID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [VoteID] ON [KS_VoteLog] 
(
	[VoteID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_VoteLog', @level2type=N'COLUMN',@level2name=N'LogID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'调查ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_VoteLog', @level2type=N'COLUMN',@level2name=N'VoteID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_VoteLog', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_VoteLog', @level2type=N'COLUMN',@level2name=N'IP'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'投票时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_VoteLog', @level2type=N'COLUMN',@level2name=N'VoteDate'
GO
/****** Object:  Table [dbo].[KS_CollectionFilter]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_CollectionFilter](
	[FilterID] [int] IDENTITY(1,1) NOT NULL,
	[FilterName] [nvarchar](255) NULL,
	[FilterType] [tinyint] NULL,
	[BeginTag] [ntext] NULL,
	[EndTag] [ntext] NULL,
	[ReplaceBody] [ntext] NULL,
	[Status] [tinyint] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_CollectionFilter] PRIMARY KEY CLUSTERED 
(
	[FilterID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过滤记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionFilter', @level2type=N'COLUMN',@level2name=N'FilterID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'过滤名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionFilter', @level2type=N'COLUMN',@level2name=N'FilterName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'替换方式' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionFilter', @level2type=N'COLUMN',@level2name=N'FilterType'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'开始标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionFilter', @level2type=N'COLUMN',@level2name=N'BeginTag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'结束标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionFilter', @level2type=N'COLUMN',@level2name=N'EndTag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'替换内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionFilter', @level2type=N'COLUMN',@level2name=N'ReplaceBody'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionFilter', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_CollectionFilter', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
/****** Object:  Table [dbo].[KS_BlogComment]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogComment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogID] [int] NULL,
	[Title] [varchar](255) NULL,
	[Content] [text] NULL,
	[UserID] [int] NULL,
	[UserName] [varchar](255) NULL,
	[AnounID] [int] NULL,
	[AnounName] [varchar](255) NULL,
	[AddTime] [datetime] NULL,
	[HomePage] [varchar](255) NULL,
	[Replay] [text] NULL,
	[ReplayDate] [datetime] NULL,
	[Flag] [tinyint] NULL,
	[Ext] [varchar](255) NULL,
 CONSTRAINT [PK_KS_BLOGCOMMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'博文ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'LogID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论人用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'AnounID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论人用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'AnounName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'评论时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'AddTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'主页' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'HomePage'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'Replay'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'回复时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'ReplayDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'审核标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'Flag'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogComment', @level2type=N'COLUMN',@level2name=N'Ext'
GO
/****** Object:  Table [dbo].[KS_AdminPlan]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_AdminPlan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[AddDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[TipsDays] [int] NULL,
 CONSTRAINT [PK_KS_AdminPlan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AdminPlan', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'工作计划内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AdminPlan', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AdminPlan', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 0未完成 1已完成' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AdminPlan', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'登录提醒天数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_AdminPlan', @level2type=N'COLUMN',@level2name=N'TipsDays'
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDVerify]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_PKGDVerify] 
 @Ids nvarchar(4000)
AS
  if @Ids=''
  return null
 else
  begin

    declare @sql nvarchar(4000),@gdid int,@status int
    set @sql='declare rs cursor for select id,status From KS_PKGD Where id in('+@Ids+')'
    exec (@sql)
     open rs
     fetch next from rs
     into @gdid,@status
     while @@fetch_status=0
     begin
         if @status=1
           update KS_PKGD Set Status=0 Where id=@gdid
        else
          update KS_PKGD Set Status=1 Where id=@gdid
         fetch next from rs
         into @gdid,@status
     end
     close rs
     deallocate rs
 end
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDDel]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_PKGDDel]
@Ids nvarchar(1000)
 AS
  DECLARE @SQL Nvarchar(3000)
  SET @SQL='DELETE FROM KS_PKGD WHERE id in('+@Ids+')'
  EXEC (@SQL)
GO
/****** Object:  Table [dbo].[KS_ProDeliveryItem]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProDeliveryItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryID] [int] NOT NULL,
	[provinces] [ntext] NULL,
	[IsCod] [tinyint] NULL,
	[FirstFreight] [money] NULL,
	[ContinueFreight] [money] NULL,
	[LimitFreight] [money] NULL,
	[storeId] [int] NULL,
	[storeType] [tinyint] NULL,
 CONSTRAINT [PK_KS_ProDeliveryItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryItem', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'配送方式ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryItem', @level2type=N'COLUMN',@level2name=N'DeliveryID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryItem', @level2type=N'COLUMN',@level2name=N'provinces'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否支持货到付款' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryItem', @level2type=N'COLUMN',@level2name=N'IsCod'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'首重运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryItem', @level2type=N'COLUMN',@level2name=N'FirstFreight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'续重运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryItem', @level2type=N'COLUMN',@level2name=N'ContinueFreight'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'最大运费' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProDeliveryItem', @level2type=N'COLUMN',@level2name=N'LimitFreight'
GO
/****** Object:  Table [dbo].[KS_BlogInfo]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogInfo](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserName] [varchar](255) NULL,
	[TypeID] [int] NULL,
	[ClassID] [int] NULL,
	[Title] [varchar](255) NULL,
	[Tags] [varchar](255) NULL,
	[Contents] [text] NULL,
	[PassWord] [varchar](255) NULL,
	[Hit] [int] NULL,
	[AddDate] [datetime] NULL,
	[Face] [int] NULL,
	[Weather] [varchar](255) NULL,
	[Status] [tinyint] NULL,
	[Best] [tinyint] NULL,
	[Hot] [tinyint] NULL,
	[TopList] [tinyint] NULL,
	[TotalPut] [int] NULL,
	[PhotoUrl] [varchar](255) NULL,
	[SinaWeiboID] [varchar](255) NULL,
	[AffixFile] [varchar](255) NULL,
 CONSTRAINT [PK_KS_BLOGINFO] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'博文ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'BlogID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户Name' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'系统分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'ClassID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'关键字' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'Tags'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'博文内容' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'Contents'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'查看博文密码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'PassWord'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'点击数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'Hit'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'增加时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户头像' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'Face'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'写博文天气心情' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'Weather'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否审核' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'Best'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'热门标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'Hot'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'头条标志' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'TopList'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'博文图片' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'PhotoUrl'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'发布到新浪微博的ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'SinaWeiboID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'附件' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo', @level2type=N'COLUMN',@level2name=N'AffixFile'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'用户博客信息' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_BlogInfo'
GO
/****** Object:  Table [dbo].[KS_ProGroupOneLottery]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProGroupOneLottery](
	[LotteryID] [int] IDENTITY(1,1) NOT NULL,
	[SerialNumber] [nvarchar](800) NULL,
	[AddDate] [datetime] NULL,
	[orderId] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[BuyAmount] [int] NULL,
	[PayOrderId] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProBookCode]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProBookCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodeID] [varchar](150) NULL,
	[CodePass] [varchar](100) NULL,
	[AddDate] [datetime] NULL,
	[UserName] [nvarchar](100) NULL,
	[UseTime] [datetime] NULL,
	[IsUsed] [tinyint] NULL,
	[TypeID] [int] NULL,
	[CityID] [int] NULL,
	[ProvinceId] [int] NULL,
	[CountyId] [int] NULL,
	[Address] [nvarchar](255) NULL,
	[RealName] [nvarchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[IsPub] [tinyint] NULL,
	[ZipCode] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'预约码编号' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'CodeID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'预约码密码' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'CodePass'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'AddDate'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'使用时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'UseTime'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否使用' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'IsUsed'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'分类ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'申请使用的城市' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'CityID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'省份' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'ProvinceId'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收货地址' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'收货人' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已被申请' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'IsPub'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProBookCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
/****** Object:  Table [dbo].[KS_VoteItem]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_VoteItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[VoteID] [int] NOT NULL,
	[ItemName] [nvarchar](255) NULL,
	[VoteNum] [int] NULL,
 CONSTRAINT [PK_KS_VoteItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ItemID] ON [KS_VoteItem] 
(
	[ItemID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [VoteID] ON [KS_VoteItem] 
(
	[VoteID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [VoteNum] ON [KS_VoteItem] 
(
	[VoteNum] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'调查记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_VoteItem', @level2type=N'COLUMN',@level2name=N'ItemID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'调查ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_VoteItem', @level2type=N'COLUMN',@level2name=N'VoteID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_VoteItem', @level2type=N'COLUMN',@level2name=N'ItemName'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'选项得票数' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_VoteItem', @level2type=N'COLUMN',@level2name=N'VoteNum'
GO
/****** Object:  Table [dbo].[KS_ProOrderBundleSale]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProOrderBundleSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[InfoID] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Price] [money] NULL,
	[Num] [int] NULL,
	[addDate] [datetime] NULL,
 CONSTRAINT [PK_KS_ProOrderBundleSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CartInfoID] ON [KS_ProOrderBundleSale] 
(
	[CartID] ASC,
	[InfoID] ASC
) ON [PRIMARY]
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'记录ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderBundleSale', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购物车ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderBundleSale', @level2type=N'COLUMN',@level2name=N'CartID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品ID' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderBundleSale', @level2type=N'COLUMN',@level2name=N'InfoID'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'商品名称' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderBundleSale', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'价格' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderBundleSale', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'购买数量' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderBundleSale', @level2type=N'COLUMN',@level2name=N'Num'
GO
EXEC dbo.sp_addextendedproperty @name=N'MS_Description', @value=N'时间' , @level0type=N'USER',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KS_ProOrderBundleSale', @level2type=N'COLUMN',@level2name=N'addDate'
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodProjectStatus]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_MoodProjectStatus] 
 @Projectids nvarchar(4000)
AS
  if @projectids=''
  return null
 else
  begin

    declare @sql nvarchar(4000),@projectid int,@status int
    set @sql='declare rs cursor for select projectid,status From KS_MoodProject Where projectid in('+@ProjectIDs+')'
    exec (@sql)
     open rs
     fetch next from rs
     into @projectid,@status
     while @@fetch_status=0
     begin
         if @status=1
           update KS_MoodProject Set Status=0 Where projectid=@projectid
        else
          update KS_MoodProject Set Status=1 Where projectid=@projectid
         fetch next from rs
         into @projectid,@status
     end
     close rs
     deallocate rs
 end
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodProjectUpdate]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_MoodProjectUpdate]
@ProjectName nvarchar(255),
@Status int=0,
@ProjectContent nvarchar(4000),
@TimeLimit tinyint=0,
@StartDate SmallDateTime=getdate,
@ExpiredDate SmallDateTime=getdate,
@OnlyUser tinyint=0,
@UserOnce tinyint=0,
@AllowGroupID nvarchar(500),
@ProjectID int=0,
 @isrepeat int=1 output

 AS
  If  exists(select top 1 *  From KS_MoodProject Where ProjectName=@ProjectName And ProjectID<>@ProjectID)
  begin
   select @isrepeat=-2 /*重名*/
   return null
  end 
 Else
  Update KS_MoodProject Set
   ProjectName=@ProjectName,
   Status=@Status,
   ProjectContent=@ProjectContent,
   TimeLimit=@TimeLimit,
   StartDate=@StartDate,
   ExpiredDate=@ExpiredDate,
   OnlyUser=@OnlyUser,
   UserOnce=@UserOnce,
   AllowGroupID=@AllowGroupID
  Where projectid=@ProjectID
 select @isrepeat=0
GO
/****** Object:  StoredProcedure [dbo].[KS_GetMoodProjectInfo]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_GetMoodProjectInfo]
 @projectid int=0
 AS
 Select top 1 * From KS_MoodProject Where projectid=@projectid
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodProjectAdd]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_MoodProjectAdd]
@ProjectName nvarchar(255),
@Status int=0,
@ProjectContent nvarchar(4000),
@TimeLimit tinyint=0,
@StartDate SmallDateTime=getdate,
@ExpiredDate SmallDateTime=getdate,
@OnlyUser tinyint=0,
@UserOnce tinyint=0,
@AllowGroupID nvarchar(500),
 @isrepeat int=1 output
AS

 if exists(select top 1 * from KS_MoodProject Where ProjectName=@ProjectName)
   begin       
    select @isrepeat=-2 /*重名*/
    return null
   end 
else
	INSERT INTO KS_MoodProject(ProjectName,Status,ProjectContent,TimeLimit,StartDate,[ExpiredDate],OnlyUser,UserOnce,AllowGroupID) VALUES(@ProjectName,@Status,@ProjectContent,@TimeLimit,@StartDate,@ExpiredDate,@OnlyUser,@UserOnce,@AllowGroupID)
          select @isrepeat=0
GO
/****** Object:  StoredProcedure [dbo].[KS_ProOrderDelete]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProOrderDelete]
@OrderID varchar(100)
 AS
 DELETE FROM [KS_ProOrderBundleSale] Where CartID in(Select ItemID From [KS_ProOrderItem] Where OrderID=@OrderID)
 DELETE FROM [KS_ProOrderItem] Where OrderID=@OrderID
 DELETE FROM [KS_ProOrder] Where OrderID=@OrderID
 DELETE FROM [KS_ProOrderLog] Where OrderID=@OrderID
 DELETE FROM [KS_ProGroupBuyConsumer]  Where OrderID=@OrderID
 DELETE FROM [KS_ProOrderService]  Where OrderID=@OrderID
GO
/****** Object:  StoredProcedure [dbo].[KS_ProLimitBuyUpdate]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProLimitBuyUpdate]
@taskname nvarchar(255),
@tasktype int=0,
@limitbuybegintime datetime,
@limitbuyendtime datetime,
@limitbuypaytime int=0,
@intro ntext,
@status   tinyint=0,
@templatefile varchar(255),
@recommend tinyint=0,
@photourl varchar(255),
@jgrange varchar(255),
@taskid  int=0,
@provinceid int=0,
@cityid int=0,
@countyid int=0,
@isrepeat int output
 AS
  If  exists(select top 1 *  From KS_ProLimitBuy Where TaskName=@taskname And taskID<>@taskid)
  begin
   select @isrepeat=-2 /*重名*/
   return null
  end 
 Else
  Update [KS_ProLimitBuy] Set
   TaskName=@taskname,
   TaskType=@tasktype,
   LimitBuyBeginTime=@limitbuybegintime,
   LimitBuyEndTime=@limitbuyendtime,
   LimitBuyPayTime=@limitbuypaytime,
   Intro=@intro,
  TemplateFile=@templatefile,
   recommend=@recommend,
   photourl=@photourl,
  jgrange=@jgrange,
   Status=@status,
   ProvinceID=@provinceid,
   CityID=@cityid,
   CountyID=@countyid
  Where taskid=@taskid
 select @isrepeat=0
GO
/****** Object:  StoredProcedure [dbo].[KS_ProLimitBuyAdd]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProLimitBuyAdd]
@taskname nvarchar(255),
@tasktype int=0,
@limitbuybegintime datetime,
@limitbuyendtime datetime,
@limitbuypaytime int=0,
@intro ntext,
@adddate datetime,
@status   tinyint=0,
@templatefile varchar(255),
@recommend tinyint=0,
@photourl varchar(200),
@jgrange varchar(255),
@provinceid int=0,
@cityid int=0,
@countyid int=0,
@isrepeat int output
 AS
  if exists(select top 1 taskid from [KS_ProLimitBuy] where taskname=@taskname)
   begin
    select @isrepeat=-2
   return null
   end
 else
   begin
  Insert Into [KS_ProLimitBuy](TaskName,TaskType,LimitBuyBeginTime,LimitBuyEndTime,LimitBuyPayTime,Intro,Status,AddDate,TemplateFile,Recommend,PhotoUrl,JGRange,ProvinceID,CityID,CountyID)
  values(@taskname,@tasktype,@limitbuybegintime,@limitbuyendtime,@limitbuypaytime,@intro,@status,@adddate,@templatefile,@recommend,@photoUrl,@jgrange,@provinceid,@cityid,@countyid)
   select @isrepeat=0
  end
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromOrderItem]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetProFromOrderItem]
@OrderID varchar(100)
AS
Select top 100  TurnUrl,I.FileName,I.ProID,I.InfoID,I.ClassID,I.InfoID,I.ChannelID,I.Score,I.Price_Member,I.Title as ITitle,I.DefaultPic,I.Price as Price_Market,I.Weight,I.Unit,I.AttributeCart,I.IsPromotions,I.ProductType,O.* From KS_ProOrderItem o left join KS_ProductList i on o.infoid=i.infoid Where O.OrderID=@OrderID order by O.ItemID
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionHistoryInsert]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionHistoryInsert]
  @ItemID int,
  @ModelID int,
  @ClassID int,
  @InfoID int ,
  @Title varchar(255),
  @ItemUrl varchar(255),
  @Remark varchar(255),
  @IsSucceed tinyint,
  @RecordTime datetime
 AS
   INSERT INTO [KS_CollectionHistory] 
      ([ItemID],[ModelID],[ClassID],[InfoID],[Title],[ItemUrl],[Remark],[IsSucceed],[RecordTime])
      Values(@ItemID,@ModelID,@ClassID,@InfoID,@Title,@ItemUrl,@Remark,@IsSucceed,@RecordTime)
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromOrderBundleSale]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_ProGetProFromOrderBundleSale] 
@infoId int=0,
@cartId int=0
AS
Select I.Title,I.Weight,I.Price as Price_Market,I.Amount,I.Score,b.attrid From KS_ProOrderBundleSale S  inner join KS_ProBundleSale B on S.InfoID=b.id left Join KS_ProductList I ON b.kbInfoID=I.InfoID Where S.CartID=@CartID

--Select I.Title,I.Weight,I.Price as Price_Market,I.Amount,I.Score From KS_ProOrderBundleSale S  left Join KS_ProductList I ON S.InfoID=I.InfoID Where S.CartID=@CartID
--Select I.Title,I.Weight,I.Price_Market,I.Amount,I.Score,B.KBPrice,b.attrid From KS_ProOrderBundleSale S Inner Join KS_ProBundleSale B ON S.InfoID=B.KBInfoID Inner Join KS_ProductList I ON S.InfoID=I.InfoID Where B.InfoID=@InfoID And S.CartID=@CartID
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromBundleSale]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetProFromBundleSale] 
@infoId int=0,
@cartId int=0
AS
Select I.Title,I.Weight,I.Price as Price_Market,I.Amount,I.Score,B.kbprice,s.ATTRID From KS_ProBundleSelect S Inner Join KS_ProBundleSale B ON S.InfoID=B.id Inner Join KS_ProductList I ON b.kbinfoid=I.InfoID Where B.InfoID=@InfoID And S.CartID=@CartID
GO
/****** Object:  StoredProcedure [dbo].[KS_ProCartAddBundleSale]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProCartAddBundleSale] 
 @infoid int=0,
 @cartId int=0
AS
 DECLARE @Title nvarchar(200),@KBPrice money,@AttrId int
 
 Delete From KS_ProBundleSelect Where CartID=@CartID And InfoID=@infoid
 
 Select top 1 @Title=I.Title,@KBPrice=K.KBPrice,@AttrId=K.attrid From [KS_ProBundleSale] K inner Join [KS_ProductList] I On I.infoid=K.kbinfoid Where k.ID=@infoid

  INSERT INTO [KS_ProBundleSelect] 
      (cartID,infoId,attrid,Title,Price,Num,AddDate)
      Values(@cartID,@infoid,@AttrId,@Title,@KBPrice,1,getdate())
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDAdd]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKGDAdd]
@PKID int=0,
@UserName nvarchar(50),
@UserID int=0,
@Content ntext,
@UserIP nvarchar(50),
@Status tinyint=0,
@Adddate smalldatetime,
@Role   tinyint=0
 AS
  Insert Into [KS_PKGD](PKID,UserName,UserID,Content,UserIP,Status,AddDate,Role)
  values(@PKID,@UserName,@UserID,@Content,@UserIP,@Status,@AddDate,@Role)
  If @Role=1
   Update KS_PKZT Set ZFVotes=ZFVotes+1 Where PKID=@PKID
  Else If @Role=2
   Update KS_PKZT Set FFVotes=FFVotes+1 Where PKID=@PKID
  Else
   Update KS_PKZT Set SFVotes=SFVotes+1 Where PKID=@PKID
GO
/****** Object:  StoredProcedure [dbo].[KS_ProShoppingCartAdd]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProShoppingCartAdd] 
 @infoId int=0,
  @price money=0,
  @num int=0,
  @username nvarchar(255),
  @adddate datetime,
  @IsAnonymous tinyint=0,
  @IsChangeBuy tinyint=0,
  @isBundleSale tinyint=0,
  @isLimitBuy tinyint=0,
  @limitBuyTaskId int=0,
  @attrid int=0,
  @flag int=0,
  @cityid int=0,
  @bookcode varchar(100),
  @business nvarchar(100),
  @cartid int out,
  @minnum int=0 out,
  @maxnum int=0 out
AS
 DECLARE @MinOrderNum int,@MaxOrderNum int,@Amount int
 Select top 1 @MinOrderNum=MinOrderNum,@MaxOrderNum=MaxOrderNum,@Amount=Amount From [KS_ProductList] Where InfoID=@InfoID
 If (@MinOrderNum<>0 And @num<@MinOrderNum and @IsChangeBuy=0)
  begin
   select @cartid=-3
   select @minnum=@minordernum
   select @maxnum=@maxordernum
  return
  end
 Else If(@MaxOrderNum<>0 And @Num>@MaxOrderNum and @IsChangeBuy=0)
  Begin
    select @cartid=-4
    select @minnum=@minordernum
    select @maxnum=@maxordernum
   return
  End 
 Else
  Begin
     if @isbundlesale=1 
      Begin
        Select @CartID=CartID From [KS_ProShoppingCart] Where UserName=@UserName and isBundleSale=1
        Delete From [KS_ProShoppingCart] Where UserName=@UserName and isBundleSale=1
        Delete From [KS_ProBundleSelect] Where CartID=@CartID
      End
     if not exists(select top 1 cartid from [KS_ProShoppingCart] where isBundleSale=@isbundlesale and infoid=@infoid and attrid=@attrid and username=@username)
      Begin
      INSERT INTO [KS_ProShoppingCart] 
      (InfoID,Price,Num,UserName,IsAnonymous,IsChangeBuy,IsBundleSale,IsLimitBuy,LimitBuyTaskID,AddDate,AttrID,Flag,CityID,BookCode,Business)
      Values(@InfoID,@Price,@Num,@UserName,@IsAnonymous,@IsChangeBuy,@IsBundleSale,@IsLimitBuy,@LimitBuyTaskID,@AddDate,@attrid,@flag,@cityid,@bookcode,@business)
      select @cartid=@@identity
     End 
    Else
	  Begin
	   UPDATE [KS_ProShoppingCart] SET Num=@Num where infoid=@infoid and attrid=@attrid and username=@username
     select @cartid=-2
	  End
 End
 select @minnum=0
 select @maxnum=0
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromCartToBuy]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetProFromCartToBuy] 
@userName nvarchar(50)
AS
select top 100 C.*,i.amount,i.channelid,i.classid,i.turnurl,i.filename,i.title,i.DefaultPic,i.IsGroupRate,i.groupprice,i.attributecart,i.price as price_market,i.price_member,i.price_cost,i.taxtf,i.tax,i.Score,I.IsLimitBuy,I.LimitBuyPrice,I.LimitBuyAmount,i.IsScoreChange,I.ChangeScore,I.PayType,i.payid,I.FrontPrice,i.LimitBeginDate,i.LimitEndDate,i.IsBookCode,i.BookCodeTypeID,i.LimitCityNum,i.producttype,i.IsPromotions,i.limitbuytype,i.limitbuynum FROM [KS_ProShoppingCart] C Inner Join [KS_ProductList] I ON C.InfoID=I.InfoID Where C.num>0 and C.Flag=0 and C.UserName=@userName and c.isToPay=1 order by C.isChangeBuy ,C.IsBundleSale,C.CartID
GO
/****** Object:  StoredProcedure [dbo].[KS_ShopItemAdd]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ShopItemAdd]
  @channelid int,
  @classid int,
  @brandid int=0,
  @title nvarchar(255),
  @titlefontcolor nvarchar(50),
  @producttype int,
  @proid nvarchar(100),
  @barcode nvarchar(150),
  @unit nvarchar(50),
  @weight float,
  @intro nvarchar(255),
  @defaultpic nvarchar(255),
  @bigphoto nvarchar(255),
  @keytags nvarchar(255),
  @hits int,
  @adddate datetime,
  @attribute nvarchar(255),
  @priority nvarchar(100),
  @inputer nvarchar(200),
  @verify int,
  @refreshtf int,
  @filename nvarchar(255),
  @attributecart nvarchar(255),
  @price money=0,
  @price_member money=0,
  @price_cost money=0,
  @score money=0,
  @groupprice int =0,
  @ischangebuy int =0,
  @changebuyneedprice money=0,
  @changebuypresentprice money=0,
  @islimitbuy int=0,
  @limitbuytaskid int=0,
  @limitbuyprice money=0,
  @limitbuyamount int=0,
  @taxtf tinyint=0,
  @tax float=0,
  @amount int =0,
  @alarmnum int =0,
  @hassold int =0,
  @minordernum int=0,
  @maxordernum int =0,
  @attachmentcharge int=0,
  @attachmentchargeonce int=0,
  @turnurl varchar(255),
  @isscorechange int=0,
  @changescore int=0,
  @showon3g int=0,
  @paytype int=0,
  @payid int=0,
  @frontprice money=0,
  @limitbegindate datetime,
  @limitenddate datetime,
  @isbookcode int=0,
  @bookcodetypeid int=0,
  @limitcitynum int=0,
  @limitbuytype int=0,
  @limitbuynum int=0,
  @downurl nvarchar(255),
  @ispromotions int=0,
  @isgrouprate int=0,
  @provinceid int=0,
  @cityid int=0,
  @countyid int=0,
  @freightfree int=0,
  @itemid int output
 AS
  INSERT INTO [KS_ProductList]

(channelid,classid,brandid,title,titlefontcolor,producttype,proid,barcode,unit,weight,intro,defaultpic,bigphoto,keytags,hits,adddate,attribute,priority,inputer,verify,refreshtf,filename,attributecart,price,price_member,price_cost,score,groupprice,ischangebuy,changebuyneedprice,changebuypresentprice,islimitbuy,limitbuytaskid,limitbuyprice,limitbuyamount,taxtf,tax,amount,alarmnum,hassold,minordernum,maxordernum,attachmentcharge,attachmentchargeonce,turnurl,isscorechange,changescore,showon3g,paytype,payid,frontprice,limitbegindate,limitenddate,isbookcode,bookcodetypeid,limitcitynum,limitbuytype,limitbuynum,downurl,ispromotions,isgrouprate,provinceid,cityid,countyid,freightfree) 
  VALUES

(@channelid,@classid,@brandid,@title,@titlefontcolor,@producttype,@proid,@barcode,@unit,@weight,@intro,@defaultpic,@bigphoto,@keytags,@hits,@adddate,@attribute,@priority,@inputer,@verify,@refreshtf,@filename,@attributecart,@price,@price_member,@price_cost,@score,@groupprice,@ischangebuy,@changebuyneedprice,@changebuypresentprice,@islimitbuy,@limitbuytaskid,@limitbuyprice,@limitbuyamount,@taxtf,@tax,@amount,@alarmnum,@hassold,@minordernum,@maxordernum,@attachmentcharge,@attachmentchargeonce,@turnurl,@isscorechange,@changescore,@showon3g,@paytype,@payid,@frontprice,@limitbegindate,@limitenddate,@isbookcode,@bookcodetypeid,@limitcitynum,@limitbuytype,@limitbuynum,@downurl,@ispromotions,@isgrouprate,@provinceid,@cityid,@countyid,@freightfree)
select @itemid=@@identity
GO
/****** Object:  StoredProcedure [dbo].[KS_ShopItemModify]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ShopItemModify]
  @classid int,
  @brandid int,
  @proid nvarchar(200),
  @title nvarchar(255),
  @titlefontcolor varchar(50),
  @producttype int,
  @barcode nvarchar(150),
  @unit nvarchar(50),
  @weight float,
  @intro nvarchar(255),
  @defaultpic nvarchar(255),
  @bigphoto nvarchar(255),
  @keytags nvarchar(255),
  @hits int,
  @adddate datetime,
  @attribute nvarchar(255),
  @priority nvarchar(100),
  @inputer nvarchar(100),
  @verify int,
  @attributecart nvarchar(255),
  @price money=0,
  @price_member money=0,
  @price_cost money=0,
  @score int=0,
  @groupprice int =0,
  @ischangebuy int =0,
  @changebuyneedprice money=0,
  @changebuypresentprice money=0,
  @islimitbuy int=0,
  @limitbuytaskid int=0,
  @limitbuyprice money=0,
  @limitbuyamount int=0,
  @limitbegindate datetime,
  @limitenddate datetime,
  @taxtf tinyint=0,
  @tax float=0,
  @amount int =0,
  @alarmnum int =0,
  @hassold int =0,
  @minordernum int=0,
  @maxordernum int =0,
  @attachmentcharge int=0,
  @attachmentchargeonce int=0,
  @turnurl varchar(255),
  @isscorechange int=0,
  @changescore int=0,
  @showon3g int=0,
  @paytype int=0,
  @payid int=0,
  @frontprice money=0,
  @isbookcode int=0,
  @bookcodetypeid int=0,
  @limitcitynum int=0,
  @limitbuytype int=0,
  @limitbuynum int=0,
  @downurl varchar(255),
  @ispromotions int=0,
  @isgrouprate int=0,
  @provinceid int=0,
  @cityid int=0,
  @countyid int=0,
  @freightfree int=0,
  @infoid int=0
 AS
  UPDATE [KS_ProductList]
  Set classid=@classid,
  brandid=@brandid,
  proid=@proid,
  title=@title,
  titlefontcolor=@titlefontcolor,
  producttype=@producttype,
  barcode=@barcode,
  unit=@unit,
  weight=@weight,
  intro=@intro,
  defaultpic=@defaultpic,
  bigphoto=@bigphoto,
  keytags=@keytags, 
  hits=@hits,
  adddate=@adddate,
  attribute=@attribute,
  priority=@priority,
  inputer=@inputer,
  verify=@verify,
  attributecart=@attributecart,
  price=@price,
  price_member=@price_member,
  price_cost=@price_cost,
  score=@score,
  groupprice=@groupprice,
  ischangebuy=@ischangebuy,
  changebuyneedprice=@changebuyneedprice,
  changebuypresentprice=@changebuypresentprice,
  islimitbuy=@islimitbuy,
  limitbuytaskid=@limitbuytaskid,
  limitbuyprice=@limitbuyprice,
  limitbuyamount=@limitbuyamount,
  taxtf=@taxtf,
  tax=@tax,
  amount=@amount,
  alarmnum=@alarmnum,
  hassold=@hassold,
  minordernum=@minordernum,
  maxordernum=@maxordernum,
  attachmentcharge=@attachmentcharge,
  attachmentchargeOnce=@attachmentchargeonce,
  turnurl=@turnurl,
  isscorechange=@isscorechange,
  changescore=@changescore,
  showon3g=@showon3g,
  paytype=@paytype,
  payid=@payid,
  frontprice=@frontprice,
  limitbegindate=@limitbegindate,
  limitenddate=@limitenddate,
  isbookcode=@isbookcode,
  bookcodetypeid=@bookcodetypeid,
  limitcitynum=@limitcitynum,
 limitbuytype=@limitbuytype,
 limitbuynum=@limitbuynum,
  downurl=@downurl,
  ispromotions=@ispromotions,
  isgrouprate=@isgrouprate,
  provinceid=@provinceid,
  cityid=@cityid,
  countyid=@countyid,
  freightfree=@freightfree
  Where InfoID=@infoid
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromCart]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetProFromCart] 
@userName nvarchar(50)
AS
select top 100 C.*,i.amount,i.channelid,i.classid,i.turnurl,i.filename,i.title,i.DefaultPic,i.IsGroupRate,i.groupprice,i.attributecart,i.price as price_market,i.price_member,i.price_cost,i.taxtf,i.tax,i.Score,I.IsLimitBuy,I.LimitBuyPrice,I.LimitBuyAmount,i.IsScoreChange,I.ChangeScore,I.PayType,i.payid,I.FrontPrice,i.LimitBeginDate,i.LimitEndDate,i.IsBookCode,i.BookCodeTypeID,i.LimitCityNum,i.producttype,i.IsPromotions,i.limitbuytype,i.limitbuynum FROM [KS_ProShoppingCart] C Inner Join [KS_ProductList] I ON C.InfoID=I.InfoID Where C.num>0 and C.Flag=0 and C.UserName=@userName order by C.isChangeBuy ,C.IsBundleSale,C.CartID
GO
/****** Object:  StoredProcedure [dbo].[KS_VoteAdd]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_VoteAdd]
@subject nvarchar(500),
@begindate datetime=getdate,
@expiredate datetime=getdate,
@votetype int=0,
@limitip int=0,
@infoid int=0,
@usertf int=0,
@votescore int=0
 AS
Insert Into KS_vote([subject],[begindate],[expiredate],[votetype],[limitip],[infoid],[usertf],[votescore])                  
values(@subject,@begindate,@expiredate,@votetype,@limitip,@infoid,@usertf,@votescore)

 If @InfoID!=0
      Begin
       UPDATE [KS_InfoList] Set VoteID=@@identity  WHERE InfoID=@InfoID
     End
GO
/****** Object:  StoredProcedure [dbo].[KS_ContentItemAdd]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ContentItemAdd]
  @channelid int,
  @classid int,
  @title nvarchar(255),
  @titlefontcolor nvarchar(50),
  @intro nvarchar(255),
  @defaultpic nvarchar(255),
  @keytags nvarchar(255),
  @hits int,
  @copyfrom nvarchar(255),
  @author nvarchar(255),
  @adddate datetime,
  @attribute nvarchar(255),
  @priority nvarchar(100),
  @inputer nvarchar(100),
  @verify int,
  @refreshtf int,
  @filename nvarchar(255),
  @turnurl nvarchar(255),
  @provinceid int,
  @cityid int,
  @countyid int,
  @infopurview int,
  @arrgroupid nvarchar(255),
  @readpoint int,
  @chargetype int,
  @pitchtime int,
  @readtimes money,
  @dividepercent int,
  @attachmentcharge int,
  @attachmentchargeonce int,
  @showon3g int=0,
  @itemid int output
 AS
  INSERT INTO [KS_InfoList](channelid,classid,title,titlefontcolor,intro,defaultpic,keytags,hits,copyfrom,author,adddate,attribute,priority,inputer,verify,refreshtf,filename,turnurl,provinceid,cityid,countyid,infopurview,arrgroupid,readpoint,chargetype,pitchtime,readtimes,dividepercent,attachmentcharge,attachmentchargeonce,showon3g) VALUES(@channelid,@classid,@title,@titlefontcolor,@intro,@defaultpic,@keytags,@hits,@copyfrom,@author,@adddate,@attribute,@priority,@inputer,@verify,@refreshtf,@filename,@turnurl,@provinceid,@cityid,@countyid,@infopurview,@arrgroupid,@readpoint,@chargetype,@pitchtime,@readtimes,@dividepercent,@attachmentcharge,@attachmentchargeonce,@showon3g)
select @itemid=@@identity
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionItemUpdate3]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_CollectionItemUpdate3]
  @FieldsRuleXml Ntext ,
  @ItemID int
 AS
  Update [KS_CollectionItem] SET  [FieldsRuleXml]=@FieldsRuleXml Where ItemID=@ItemID
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionItemUpdate2]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_CollectionItemUpdate2]
  @ListBeginTag ntext,
  @ListEndTag ntext,
  @LinkBeginTag ntext,
  @LinkEndTag ntext,
  @PageType int=0,
  @PageUrl varchar(255),
  @PageStartID int,
  @PageEndID int,
  @PageListUrl ntext,
  @ItemID int
 AS
  Update [KS_CollectionItem] SET 
    ListBeginTag=@ListBeginTag,
ListEndTag=@ListEndTag, 
LinkBeginTag=@LinkBeginTag,
LinkEndTag=@LinkEndTag,
PageType=@PageType,
PageUrl=@PageUrl,
PageStartID=@PageStartID,
PageEndID=@PageEndID,
PageListUrl=@PageListUrl
   WHERE ItemID=@ItemID
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionItemUpdate1]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionItemUpdate1]
  @ItemName varchar(255),
  @ClassID int,
  @SpecialID nvarchar(255),
  @ProvinceID int=0,
  @CityID int=0,
  @CountyID int=0,
  @SiteName varchar(255),
  @CollectUrl varchar(255),
  @Encoding varchar(50),
  @Attribute varchar(50),
  @CollectOption varchar(50),
  @CollectListNum int=0,
  @CollectInfoNum int=0,
  @PausePerNum int=0,
  @PauseTime int=0,
  @Remark varchar(255),
  @ItemID int
 AS
  Update [KS_CollectionItem] SET 
      [ItemName]=@ItemName,
      [ClassID]=@ClassID,
      [SpecialID]=@SpecialID,
      [ProvinceID]=@ProvinceID,
      [CityID]=@CityID,
      [CountyID]=@CountyID,
      [SiteName]=@SiteName,
      [CollectUrl]=@CollectUrl,
      [Encoding]=@Encoding,
      [Attribute]=@Attribute,
      [CollectOption]=@CollectOption,
      [CollectListNum]=@CollectListNum,
      [CollectInfoNum]=@CollectInfoNum,
      [PausePerNum]=@PausePerNum,
      [PauseTime]=@PauseTime,
      [Remark]=@Remark
   WHERE ItemID=@ItemID
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionItemAdd]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionItemAdd]
@itemname nvarchar(255),
@modelid int=0,
@classid int ,
@specialid nvarchar(255),
@provinceid int=0,
@cityid int=0,
@countyid int=0,
@sitename nvarchar(255),
@collecturl nvarchar(255),
@encoding nvarchar(100),
@attribute nvarchar(100),
@collectoption nvarchar(100),
@collectlistnum int=0,
@collectinfonum int=0,
@pausepernum int=0,
@pausetime int=0,
@remark nvarchar(255),
@adddate datetime,
@id int output
AS
	INSERT INTO KS_CollectionItem(ItemName,ModelID,ClassID,SpecialID,ProvinceID,CityID,CountyID,SiteName,CollectUrl,Encoding,Attribute,CollectOption,CollectListNum,CollectInfoNum,PausePerNum,PauseTime,Remark,AddDate) VALUES(@itemname,@modelid,@classid,@specialid,@provinceid,@cityid,@countyid,@sitename,@collecturl,@encoding,@attribute,@collectoption,@collectlistnum,@collectinfonum,@pausepernum,@pausetime,@remark,@adddate)
select @id=@@identity
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionItemCopy]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionItemCopy]
@ItemName nvarchar(255),
@ModelID int=0,
@ClassID int ,
@SpecialID nvarchar(255),
@ProvinceID int=0,
@CityID int=0,
@CountyID int=0,
@SiteName nvarchar(255),
@CollectUrl nvarchar(255),
@Encoding nvarchar(100),
@Attribute nvarchar(100),
@CollectOption nvarchar(100),
@CollectListNum int=0,
@CollectInfoNum int=0,
@PausePerNum int=0,
@PauseTime int=0,
@Remark nvarchar(255),
@Adddate datetime,
@ListBeginTag ntext,
@ListEndTag ntext,
@LinkBeginTag ntext,
@LinkEndTag ntext,
@PageType int,
@PageUrl ntext,
@PageStartID int,
@PageEndID int,
@PageListUrl nvarchar(255),
@FieldsRuleXml ntext,
@IsCanCollect int,
@LastCollectTime datetime
AS
	INSERT INTO KS_CollectionItem([ItemName],[ModelID],[ClassID],[SpecialID],[ProvinceID],[CityID],[CountyID],[SiteName],[CollectUrl],[Encoding],[Attribute],[CollectOption],[CollectListNum],[CollectInfoNum],[PausePerNum],[PauseTime],[Remark],[AddDate],[ListBeginTag],[ListEndTag],[LinkBeginTag],[LinkEndTag],[PageType],[PageUrl],[PageStartID],[PageEndID],[PageListUrl],[FieldsRuleXml],[IsCanCollect],[LastCollectTime]) VALUES(@ItemName,@ModelID,@ClassID,@SpecialID,@ProvinceID,@CityID,@CountyID,@SiteName,@CollectUrl,@Encoding,@Attribute,@CollectOption,@CollectListNum,@CollectInfoNum,@PausePerNum,@PauseTime,@Remark,@AddDate,@ListBeginTag,@ListEndTag,@LinkBeginTag,@LinkEndTag,@PageType,@PageUrl,@PageStartID,@PageEndID,@PageListUrl,@FieldsRuleXml,@IsCanCollect,@LastCollectTime)
GO
/****** Object:  StoredProcedure [dbo].[KS_ProOrderAddBundleSale]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProOrderAddBundleSale] 
@infoID int=0,
@cartId int=0
AS
 DECLARE @ItemId int
 Select @ItemId=max(itemid) From KS_ProOrderItem
 insert into [KS_ProOrderBundleSale] Select CartId,InfoID,Title,Price,Num,getdate() From KS_ProBundleSelect Where cartId=@cartID
 Update  [KS_ProOrderBundleSale] Set CartId=@ItemId Where CartId=@cartId
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionFilterInsert]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_CollectionFilterInsert]
@FilterName nvarchar(255),
@FilterType int=0,
@BeginTag ntext ,
@EndTag ntext,
@ReplaceBody Ntext,
@AddDate SmallDateTime,
@Status int=0
AS
	INSERT INTO KS_CollectionFilter
                (FilterName,FilterType,BeginTag,EndTag,ReplaceBody,AddDate,Status)
              VALUES(@FilterName,@FilterType,@BeginTag,@EndTag,@ReplaceBody,@AddDate,@Status)
GO
/****** Object:  StoredProcedure [dbo].[KS_DelDigg]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_DelDigg]
@id int,
@num int=0
 AS
 Set NoCount ON
 DECLARE @DiggId int
 select top 1 @DiggId=diggid From KS_Digg Where ID=@id
 Update KS_DiggList Set SupportNum=SupportNum-@num ,AgainstNum=AgainstNum-@num  Where DiggID=@DiggID
 Delete From KS_Digg Where ID=@id
GO
/****** Object:  StoredProcedure [dbo].[KS_ProCouponStatus]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_ProCouponStatus] 
 @couponIds nvarchar(4000)
AS
  if @couponIds=''
  return null
 else
  begin

    declare @sql nvarchar(4000),@couponid int,@status int
    set @sql='declare rs cursor for select couponid,status From KS_ProCoupon Where couponid in('+@couponIds+')'
    exec (@sql)
     open rs
     fetch next from rs
     into @couponid,@status
     while @@fetch_status=0
     begin
         if @status=1
           update KS_ProCoupon Set Status=0 Where couponid=@couponid
        else
          update KS_ProCoupon Set Status=1 Where couponid=@couponid
         fetch next from rs
         into @couponid,@status
     end
     close rs
     deallocate rs
 end
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetCouponByCouponNum]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetCouponByCouponNum]
@CouponNum varchar(50)
 AS
SELECT Top 1 A.FaceValue,A.MinAmount,A.MaxDiscount,b.AvailableMoney,A.BeginDate,a.EndDate,a.Status,B.CouponUserID,B.Note,A.CouponType,B.UserName,A.Couponname,A.LimitType,A.LimitClassIDs,A.LimitProIds FROM KS_ProCoupon A Inner Join KS_ProCouponUser B On A.CouponID=B.CouponID Where B.CouponNum=@CouponNum
GO
/****** Object:  StoredProcedure [dbo].[KS_ProCouponUserAdd]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_ProCouponUserAdd]
@CouponID int=0,
@couponNum varchar(100),
@userName varchar(100),
@AvailableMoney money=0,
@mailTF tinyint=0
 AS

 INSERT Into [KS_ProCouponUser](
   CouponID,CouponNum,UserName,AvailableMoney,MailTF,UseFlag,OrderID,AddDate
) values(
  @CouponID,@CouponNum,@UserName,@AvailableMoney,@MailTF,0,'',GetDate()
)
 return @@identity
GO
/****** Object:  StoredProcedure [dbo].[KS_ProUpdateCouponUser]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_ProUpdateCouponUser]
@CouponUserId int,
@OrderId varchar(100),
@AllowOffsetMoney money=0,
@UserName nvarchar(100),
@Note Ntext
 AS
  UPDATE [KS_ProCouponUser] Set
    UseFlag=1,
    UserName=@UserName,
    UseTime=GetDate(),
    OrderID=@OrderID,
    [Note]=@Note,
    AvailableMoney=AvailableMoney-@AllowOffsetMoney
  WHERE CouponUserId=@CouponUserId
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodProjectHits]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [KS_MoodProjectHits] 
@MoodId int=0,
@ChannelID int,
@InfoID int,
@ItemID int,
@Title nvarchar(255)
as
declare @sql nvarchar(4000)
 if exists(select top 1 * from KS_MoodList Where moodid=@MoodID and ChannelID=@ChannelID and infoid=@infoid)
   begin
     set @sql='UPDATE KS_MoodList Set M'+convert(varchar(100),@itemid)+'=m'+convert(varchar(100),@itemid)+'+1 where moodid='+convert(varchar(100),@MoodID)+' and ChannelID='+Convert(varchar(100),@ChannelID)+' and infoid='+convert(varchar(200),@infoid)
     exec (@sql)
   end 
 else
   begin
       set @sql='insert into KS_MoodList(moodid,channelid,infoid,title,m'+convert(varchar(100),@itemid)+') values('+convert(varchar(100),@MoodID)+','+convert(varchar(100),@ChannelID)+','+convert(varchar(100),@InfoID)+','''+convert(varchar(255),@Title)+''',1)'
       exec (@sql)
   end
GO
/****** Object:  StoredProcedure [dbo].[KS_ShopProImages]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ShopProImages] 
 @ID int=0
AS
 SELECT TOP 500  a.title,b.* FROM KS_ProductList A Left Join KS_ProImages B On A.InfoID=B.InfoID WHERE a.InfoID=@ID order by orderid,id
GO
/****** Object:  StoredProcedure [dbo].[KS_ModelClone]    Script Date: 01/13/2017 10:53:13 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ModelClone] 
@ModelName nvarchar(255),
@ModelTable nvarchar(255),
@ModelID int=0,
 @isrepeat int=1 output
As
  if exists(select top 1 * from ks_model where modelname=@modelname or modeltable=@modeltable)
   begin
    select @isrepeat=-2
   return null
   end
 else
   begin
  declare @MaxModelID  int
  declare @SQL nvarchar(4000)
  Select @MaxModelID=max(channelid)+1 FROM KS_Model
  Set @SQL='Insert Into [KS_Model]([channelid],[modeltype],[modelname],[modeltable],[modelitem],[modelitemunit],[modelstatus],[basictype],[modelfolder],[modelfsofolder],[fsolistnum],[intro],[chargesoption],[attributeoption],[receiptoption],[pkoption],[fieldsxml],[adminupfilestf],[adminupfilesdir],[userupfilestf],[userupfilesdir],[allowupfilessize],[allowupphototype],[allowupflashtype],[allowupmediatype],[allowuprealtype],[allowupothertype],[allowpublication],[publicationverify],[publicationrefreshhtmloption],[publicationmodifyverify],[commenttype],[commentlen],[newestday],[commenttemplate],[searchtemplate],[diggbyvisitor],[diggrepeat],[diggpertimes],[setting],[showoption],[seooption],[modelorderid]) 
    select '+convert(varchar(255),@MaxModelID)+',0,'''+convert(varchar(255),@ModelName)+''','''+convert(varchar(255),@ModelTable)+''',[modelitem],[modelitemunit],[modelstatus],[basictype],[modelfolder],[modelfsofolder],[fsolistnum],[intro],[chargesoption],[attributeoption],[receiptoption],[pkoption],[fieldsxml],[adminupfilestf],[adminupfilesdir],[userupfilestf],[userupfilesdir],[allowupfilessize],[allowupphototype],[allowupflashtype],[allowupmediatype],[allowuprealtype],[allowupothertype],[allowpublication],[publicationverify],[publicationrefreshhtmloption],[publicationmodifyverify],[commenttype],[commentlen],[newestday],[commenttemplate],[searchtemplate],[diggbyvisitor],[diggrepeat],[diggpertimes],[setting],[showoption],[seooption],modelorderid+1 from KS_Model where channelid='+convert(varchar(255),@ModelID)
   Exec (@SQL)
   Declare @Table nvarchar(4000)
   Select @Table=ModelTable From KS_Model Where channelid=@ModelID
   Set @SQL='select * into '+Convert(varchar(255),@modeltable)+' from '+@Table+' where 1=0'
   Exec (@SQL)
   Set @SQL=' alter table '+CONVERT(Nvarchar(255),@ModelTable)+' add constraint pk_'+convert(varchar(255),@MaxModelID)+'_infoid primary key(infoid)'
   Exec (@SQL)
   select @isrepeat=0
 end
GO
/****** Object:  Default [DF_KS_ProBrandR_ClassID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBrandR] ADD  CONSTRAINT [DF_KS_ProBrandR_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_ProClassBrandR_BrandID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBrandR] ADD  CONSTRAINT [DF_KS_ProClassBrandR_BrandID]  DEFAULT (0) FOR [BrandID]
GO
/****** Object:  Default [DF_KS_SpecialR_SpecialID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_SpecialR] ADD  CONSTRAINT [DF_KS_SpecialR_SpecialID]  DEFAULT (0) FOR [SpecialID]
GO
/****** Object:  Default [DF_KS_SpecialR_InfoID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_SpecialR] ADD  CONSTRAINT [DF_KS_SpecialR_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_SpecialR_ChannelID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_SpecialR] ADD  CONSTRAINT [DF_KS_SpecialR_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_FieldGroup_ChannelID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_FieldGroup] ADD  CONSTRAINT [DF_KS_FieldGroup_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_FieldGroup_OrderID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_FieldGroup] ADD  CONSTRAINT [DF_KS_FieldGroup_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_FieldGroup_IsSys]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_FieldGroup] ADD  CONSTRAINT [DF_KS_FieldGroup_IsSys]  DEFAULT (0) FOR [IsSys]
GO
/****** Object:  Default [DF_KS_ViewRecords_basicType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ViewRecords] ADD  CONSTRAINT [DF_KS_ViewRecords_basicType]  DEFAULT (0) FOR [basicType]
GO
/****** Object:  Default [DF_KS_ViewRecords_channelid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ViewRecords] ADD  CONSTRAINT [DF_KS_ViewRecords_channelid]  DEFAULT (0) FOR [channelid]
GO
/****** Object:  Default [DF_KS_ViewRecords_infoid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ViewRecords] ADD  CONSTRAINT [DF_KS_ViewRecords_infoid]  DEFAULT (0) FOR [infoid]
GO
/****** Object:  Default [DF_KS_ViewRecords_adddate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ViewRecords] ADD  CONSTRAINT [DF_KS_ViewRecords_adddate]  DEFAULT (getdate()) FOR [adddate]
GO
/****** Object:  Default [DF__KS_Commen__Chann__5441852A]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Chann__5441852A]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_Comment_ClassID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF_KS_Comment_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_Commen__InfoI__5535A963]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__InfoI__5535A963]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_Commen__Suppo__5629CD9C]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Suppo__5629CD9C]  DEFAULT (0) FOR [Support]
GO
/****** Object:  Default [DF__KS_Commen__Oppos__571DF1D5]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Oppos__571DF1D5]  DEFAULT (0) FOR [Opposition]
GO
/****** Object:  Default [DF__KS_Commen__Verif__5812160E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Verif__5812160E]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_Commen__Anony__59063A47]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Anony__59063A47]  DEFAULT (0) FOR [Anonymous]
GO
/****** Object:  Default [DF__KS_Commen__Viewp__59FA5E80]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Viewp__59FA5E80]  DEFAULT (0) FOR [Viewpoint]
GO
/****** Object:  Default [DF_KS_Comment_Reports]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF_KS_Comment_Reports]  DEFAULT (0) FOR [Reports]
GO
/****** Object:  Default [DF_KS_Comment_UserID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF_KS_Comment_UserID]  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_U_Phot__InfoI__00B50445]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__InfoI__00B50445]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_U_Phot__Class__01A9287E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__Class__01A9287E]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_U_Phot__ShowS__029D4CB7]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__ShowS__029D4CB7]  DEFAULT (0) FOR [ShowStyle]
GO
/****** Object:  Default [DF__KS_U_Phot__PageN__039170F0]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__PageN__039170F0]  DEFAULT (10) FOR [PageNum]
GO
/****** Object:  Default [DF__KS_U_Phot__prior__38060486]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__prior__38060486]  DEFAULT (0) FOR [priority]
GO
/****** Object:  Default [DF__KS_U_Photo__Hits__38FA28BF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Photo__Hits__38FA28BF]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_U_Phot__HitsB__39EE4CF8]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__HitsB__39EE4CF8]  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF__KS_U_Phot__HitsB__3AE27131]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__HitsB__3AE27131]  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF__KS_U_Phot__HitsB__3BD6956A]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__HitsB__3BD6956A]  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF__KS_U_Phot__VoteI__3CCAB9A3]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__VoteI__3CCAB9A3]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF__KS_U_Phot__ShowO__3DBEDDDC]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__ShowO__3DBEDDDC]  DEFAULT (0) FOR [ShowON3G]
GO
/****** Object:  Default [DF__KS_U_Phot__Refre__3EB30215]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__Refre__3EB30215]  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF__KS_U_Phot__Verif__3FA7264E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__Verif__3FA7264E]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_U_Phot__DelTF__409B4A87]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__DelTF__409B4A87]  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF__KS_U_Phot__Attac__418F6EC0]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__Attac__418F6EC0]  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF__KS_U_Phot__Attac__428392F9]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__Attac__428392F9]  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF__KS_U_Phot__CityI__4377B732]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__CityI__4377B732]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_U_Phot__Count__446BDB6B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__Count__446BDB6B]  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_U_Phot__Comme__455FFFA4]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__Comme__455FFFA4]  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF__KS_U_Phot__ProID__465423DD]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__ProID__465423DD]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF__KS_U_Phot__ReadP__47484816]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__ReadP__47484816]  DEFAULT (0) FOR [ReadPoint]
GO
/****** Object:  Default [DF__KS_U_Phot__Charg__483C6C4F]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__Charg__483C6C4F]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF__KS_U_Phot__Pitch__49309088]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__Pitch__49309088]  DEFAULT (0) FOR [PitchTime]
GO
/****** Object:  Default [DF__KS_U_Phot__ReadT__4A24B4C1]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__ReadT__4A24B4C1]  DEFAULT (0) FOR [ReadTimes]
GO
/****** Object:  Default [DF__KS_U_Phot__Divid__4B18D8FA]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__Divid__4B18D8FA]  DEFAULT (0) FOR [DividePercent]
GO
/****** Object:  Default [DF__KS_U_Photo__PKID__4C0CFD33]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Photo__PKID__4C0CFD33]  DEFAULT (0) FOR [PKID]
GO
/****** Object:  Default [DF__KS_U_Phot__InfoP__7D6F4E9D]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  CONSTRAINT [DF__KS_U_Phot__InfoP__7D6F4E9D]  DEFAULT (0) FOR [InfoPurview]
GO
/****** Object:  Default [DF__KS_U_Phot__GoodN__0155B971]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [GoodNum]
GO
/****** Object:  Default [DF__KS_U_Phot__BadNu__0249DDAA]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [BadNum]
GO
/****** Object:  Default [DF__KS_U_Phot__FavNu__033E01E3]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [FavNum]
GO
/****** Object:  Default [DF__KS_U_Phot__Share__0432261C]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [ShareNum]
GO
/****** Object:  Default [DF_KS_MoodProject_UserOnce]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_MoodProject] ADD  CONSTRAINT [DF_KS_MoodProject_UserOnce]  DEFAULT (0) FOR [UserOnce]
GO
/****** Object:  Default [DF_KS_MoodProject_Status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_MoodProject] ADD  CONSTRAINT [DF_KS_MoodProject_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_MoodProject_TimeLimit]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_MoodProject] ADD  CONSTRAINT [DF_KS_MoodProject_TimeLimit]  DEFAULT (0) FOR [TimeLimit]
GO
/****** Object:  Default [DF_KS_AskRank_IsSys]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskRank] ADD  CONSTRAINT [DF_KS_AskRank_IsSys]  DEFAULT (0) FOR [IsSys]
GO
/****** Object:  Default [DF_KS_AskGrade_Score]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskRank] ADD  CONSTRAINT [DF_KS_AskGrade_Score]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF_KS_AskGrade_QNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskRank] ADD  CONSTRAINT [DF_KS_AskGrade_QNum]  DEFAULT (0) FOR [QueNum]
GO
/****** Object:  Default [DF_KS_AskGrade_AnsNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskRank] ADD  CONSTRAINT [DF_KS_AskGrade_AnsNum]  DEFAULT (0) FOR [AnsNum]
GO
/****** Object:  Default [DF_KS_BBSBoard_ParentID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSBoard] ADD  CONSTRAINT [DF_KS_BBSBoard_ParentID]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF_KS_BBSBoard_Root]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSBoard] ADD  CONSTRAINT [DF_KS_BBSBoard_Root]  DEFAULT (0) FOR [Root]
GO
/****** Object:  Default [DF_KS_BBSBoard_OrderID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSBoard] ADD  CONSTRAINT [DF_KS_BBSBoard_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_BBSBoard_Child]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSBoard] ADD  CONSTRAINT [DF_KS_BBSBoard_Child]  DEFAULT (0) FOR [Child]
GO
/****** Object:  Default [DF_KS_BBSBoard_PrevID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSBoard] ADD  CONSTRAINT [DF_KS_BBSBoard_PrevID]  DEFAULT (0) FOR [PrevID]
GO
/****** Object:  Default [DF_KS_BBSBoard_NextID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSBoard] ADD  CONSTRAINT [DF_KS_BBSBoard_NextID]  DEFAULT (0) FOR [NextID]
GO
/****** Object:  Default [DF_KS_BBSBoard_TopicNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSBoard] ADD  CONSTRAINT [DF_KS_BBSBoard_TopicNum]  DEFAULT (0) FOR [TopicNum]
GO
/****** Object:  Default [DF_KS_BBSBoard_PostNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSBoard] ADD  CONSTRAINT [DF_KS_BBSBoard_PostNum]  DEFAULT (0) FOR [PostNum]
GO
/****** Object:  Default [DF_KS_BBSBoard_TodayNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSBoard] ADD  CONSTRAINT [DF_KS_BBSBoard_TodayNum]  DEFAULT (0) FOR [TodayNum]
GO
/****** Object:  Default [DF__KS_UserCa__Money__09746778]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserCard] ADD  DEFAULT (0) FOR [Money]
GO
/****** Object:  Default [DF__KS_UserCa__Valid__0A688BB1]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserCard] ADD  DEFAULT (0) FOR [ValidNum]
GO
/****** Object:  Default [DF__KS_UserCa__Valid__0B5CAFEA]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserCard] ADD  DEFAULT (0) FOR [ValidUnit]
GO
/****** Object:  Default [DF__KS_UserCa__IsUse__0C50D423]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserCard] ADD  DEFAULT (0) FOR [IsUsed]
GO
/****** Object:  Default [DF__KS_UserCa__IsSal__0D44F85C]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserCard] ADD  DEFAULT (0) FOR [IsSale]
GO
/****** Object:  Default [DF__KS_Announ__Chann__0AD2A005]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Announce] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_Announce_CityID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Announce] ADD  CONSTRAINT [DF_KS_Announce_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_Announce_CountyId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Announce] ADD  CONSTRAINT [DF_KS_Announce_CountyId]  DEFAULT (0) FOR [CountyId]
GO
/****** Object:  Default [DF_KS_LogMoney_ChannelID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_LogMoney_InfoID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_LogMoney_MoneyType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_MoneyType]  DEFAULT (0) FOR [MoneyType]
GO
/****** Object:  Default [DF_KS_LogMoney_PaymentID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_PaymentID]  DEFAULT (0) FOR [PaymentID]
GO
/****** Object:  Default [DF_KS_LogMoney_PayTime]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_PayTime]  DEFAULT (getdate()) FOR [PayTime]
GO
/****** Object:  Default [DF_KS_LogMoney_Times]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_Times]  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF_KS_LogMoney_RealMoney]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_RealMoney]  DEFAULT (0) FOR [RealMoney]
GO
/****** Object:  Default [DF_KS_LogMoney_Discount]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_Discount]  DEFAULT (0) FOR [Discount]
GO
/****** Object:  Default [DF_KS_ProDeliveryCorp_OrderID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProDeliveryCorp] ADD  CONSTRAINT [DF_KS_ProDeliveryCorp_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_Area_ParentID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Area] ADD  CONSTRAINT [DF_KS_Area_ParentID]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF_KS_Area_OrderID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Area] ADD  CONSTRAINT [DF_KS_Area_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_Area_Depth]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Area] ADD  CONSTRAINT [DF_KS_Area_Depth]  DEFAULT (0) FOR [Depth]
GO
/****** Object:  Default [DF_KS_Area_IsShow]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Area] ADD  CONSTRAINT [DF_KS_Area_IsShow]  DEFAULT (0) FOR [IsShow]
GO
/****** Object:  Default [DF_KS_ProLogInvoice_MoneyTotal]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLogInvoice] ADD  CONSTRAINT [DF_KS_ProLogInvoice_MoneyTotal]  DEFAULT (0) FOR [MoneyTotal]
GO
/****** Object:  Default [DF_KS_ProSpecial_ItemNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecial] ADD  CONSTRAINT [DF_KS_ProSpecial_ItemNum]  DEFAULT (0) FOR [ItemNum]
GO
/****** Object:  Default [DF_KS_ProGroupPrice_InfoID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupPrice] ADD  CONSTRAINT [DF_KS_ProGroupPrice_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_ProGroupPrice_GroupID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupPrice] ADD  CONSTRAINT [DF_KS_ProGroupPrice_GroupID]  DEFAULT (0) FOR [GroupID]
GO
/****** Object:  Default [DF_KS_ProGroupPrice_Price]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupPrice] ADD  CONSTRAINT [DF_KS_ProGroupPrice_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF__KS_InnerL__Statu__160F4887]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_InnerLink] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_InnerLink_Num]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_InnerLink] ADD  CONSTRAINT [DF_KS_InnerLink_Num]  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF__KS_ProFig__rooti__161BCC2D]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProFightGroupClass] ADD  DEFAULT (0) FOR [rootid]
GO
/****** Object:  Default [DF__KS_ProFig__order__170FF066]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProFightGroupClass] ADD  DEFAULT (0) FOR [orders]
GO
/****** Object:  Default [DF__KS_ProFig__paren__1804149F]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProFightGroupClass] ADD  DEFAULT (0) FOR [parentid]
GO
/****** Object:  Default [DF__KS_ProFig__child__18F838D8]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProFightGroupClass] ADD  DEFAULT (0) FOR [child]
GO
/****** Object:  Default [DF__KS_ProFig__IsLoc__19EC5D11]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProFightGroupClass] ADD  DEFAULT (0) FOR [IsLock]
GO
/****** Object:  Default [DF__KS_ProFig__InfoN__1AE0814A]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProFightGroupClass] ADD  DEFAULT (0) FOR [InfoNum]
GO
/****** Object:  Default [DF_KS_ProAddress_ProvinceID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProAddress] ADD  CONSTRAINT [DF_KS_ProAddress_ProvinceID]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF_KS_ProAddress_CityID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProAddress] ADD  CONSTRAINT [DF_KS_ProAddress_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_ProAddress_CountyID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProAddress] ADD  CONSTRAINT [DF_KS_ProAddress_CountyID]  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF_KS_ProAddress_IsDefault]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProAddress] ADD  CONSTRAINT [DF_KS_ProAddress_IsDefault]  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF_KS_PaymentPlat_showflag]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PaymentPlat] ADD  CONSTRAINT [DF_KS_PaymentPlat_showflag]  DEFAULT (0) FOR [showflag]
GO
/****** Object:  Default [DF_KS_Adiplist_adid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Adiplist] ADD  CONSTRAINT [DF_KS_Adiplist_adid]  DEFAULT (0) FOR [adid]
GO
/****** Object:  Default [DF_KS_Adiplist_boardid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Adiplist] ADD  CONSTRAINT [DF_KS_Adiplist_boardid]  DEFAULT (0) FOR [boardid]
GO
/****** Object:  Default [DF_KS_Adiplist_adddate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Adiplist] ADD  CONSTRAINT [DF_KS_Adiplist_adddate]  DEFAULT (getdate()) FOR [adddate]
GO
/****** Object:  Default [DF_KS_ShopSpecificationPrice_proid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  CONSTRAINT [DF_KS_ShopSpecificationPrice_proid]  DEFAULT (0) FOR [proid]
GO
/****** Object:  Default [DF_KS_ProSpecificationPrice_price_market]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  CONSTRAINT [DF_KS_ProSpecificationPrice_price_market]  DEFAULT (0) FOR [price_market]
GO
/****** Object:  Default [DF_KS_ProSpecificationPrice_price_cost]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  CONSTRAINT [DF_KS_ProSpecificationPrice_price_cost]  DEFAULT (0) FOR [price_cost]
GO
/****** Object:  Default [DF_KS_ShopSpecificationPrice_price]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  CONSTRAINT [DF_KS_ShopSpecificationPrice_price]  DEFAULT (0) FOR [price]
GO
/****** Object:  Default [DF_KS_ShopSpecificationPrice_amount]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  CONSTRAINT [DF_KS_ShopSpecificationPrice_amount]  DEFAULT (0) FOR [amount]
GO
/****** Object:  Default [DF_KS_ShopSpecificationPrice_weight]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  CONSTRAINT [DF_KS_ShopSpecificationPrice_weight]  DEFAULT (0) FOR [weight]
GO
/****** Object:  Default [DF__KS_B2B_Me__Subje__182C9B23]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Message] ADD  DEFAULT (0) FOR [SubjectID]
GO
/****** Object:  Default [DF__KS_B2B_Me__Verif__1920BF5C]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Message] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_B2B_Me__ReadT__1A14E395]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Message] ADD  DEFAULT (0) FOR [ReadTF]
GO
/****** Object:  Default [DF__KS_B2B_Me__DelTf__1B0907CE]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Message] ADD  DEFAULT (0) FOR [DelTf]
GO
/****** Object:  Default [DF__KS_B2B_Me__PMsgI__1BFD2C07]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Message] ADD  DEFAULT (0) FOR [PMsgID]
GO
/****** Object:  Default [DF__KS_User__GroupID__7D0E9093]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__GroupID__7D0E9093]  DEFAULT (0) FOR [GroupID]
GO
/****** Object:  Default [DF_KS_User_AskRankId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_AskRankId]  DEFAULT (0) FOR [AskRankId]
GO
/****** Object:  Default [DF_KS_User_DepartId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_DepartId]  DEFAULT (0) FOR [DepartId]
GO
/****** Object:  Default [DF_KS_User_IsMobileRZ]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_IsMobileRZ]  DEFAULT (0) FOR [IsMobileRZ]
GO
/****** Object:  Default [DF_KS_User_ProId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_ProId]  DEFAULT (0) FOR [ProId]
GO
/****** Object:  Default [DF_KS_User_CityId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_CityId]  DEFAULT (0) FOR [CityId]
GO
/****** Object:  Default [DF_KS_User_CountyId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_CountyId]  DEFAULT (0) FOR [CountyId]
GO
/****** Object:  Default [DF__KS_User__Privacy__7FEAFD3E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__Privacy__7FEAFD3E]  DEFAULT (0) FOR [Privacy]
GO
/****** Object:  Default [DF_KS_User_RegDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_RegDate]  DEFAULT (getdate()) FOR [RegDate]
GO
/****** Object:  Default [DF_KS_User_JoinDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_JoinDate]  DEFAULT (getdate()) FOR [JoinDate]
GO
/****** Object:  Default [DF_KS_User_LastLoginTime]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_LastLoginTime]  DEFAULT (getdate()) FOR [LastLoginTime]
GO
/****** Object:  Default [DF__KS_User__LoginTi__00DF2177]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__LoginTi__00DF2177]  DEFAULT (0) FOR [LoginTimes]
GO
/****** Object:  Default [DF__KS_User__ChargeT__01D345B0]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__ChargeT__01D345B0]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF_KS_User_BeginDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_BeginDate]  DEFAULT (getdate()) FOR [BeginDate]
GO
/****** Object:  Default [DF__KS_User__EDays__03BB8E22]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__EDays__03BB8E22]  DEFAULT (0) FOR [EDays]
GO
/****** Object:  Default [DF_KS_User_Money]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_Money]  DEFAULT (0) FOR [Money]
GO
/****** Object:  Default [DF__KS_User__Score__04AFB25B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__Score__04AFB25B]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF_KS_User_ScoreHasUse]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_ScoreHasUse]  DEFAULT (0) FOR [ScoreHasUse]
GO
/****** Object:  Default [DF__KS_User__Point__05A3D694]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__Point__05A3D694]  DEFAULT (0) FOR [Point]
GO
/****** Object:  Default [DF__KS_User__Locked__0697FACD]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__Locked__0697FACD]  DEFAULT (0) FOR [Locked]
GO
/****** Object:  Default [DF_KS_User_IsApi]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_IsApi]  DEFAULT (0) FOR [IsApi]
GO
/****** Object:  Default [DF__KS_User__IsWeixi__249EF5AE]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  DEFAULT (0) FOR [IsWeixinUnBind]
GO
/****** Object:  Default [DF__KS_User__LoadTyp__259319E7]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  DEFAULT (0) FOR [LoadType]
GO
/****** Object:  Default [DF__KS_User__PUserId__666CB90B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  DEFAULT (0) FOR [PUserId]
GO
/****** Object:  Default [DF__KS_User__PPUserI__6760DD44]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_User] ADD  DEFAULT (0) FOR [PPUserId]
GO
/****** Object:  Default [DF__KS_JSFile__Class__18EBB532]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_JSFile] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_JSFile__Templ__1A21673B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_JSFile] ADD  DEFAULT (0) FOR [TemplateID]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_TaskType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_TaskType]  DEFAULT (0) FOR [TaskType]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_LimitBuyBeginTime]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_LimitBuyBeginTime]  DEFAULT (getdate()) FOR [LimitBuyBeginTime]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_LimitBuyEndTime]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_LimitBuyEndTime]  DEFAULT (getdate()) FOR [LimitBuyEndTime]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_LimitBuyPayTime]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_LimitBuyPayTime]  DEFAULT (0) FOR [LimitBuyPayTime]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_Status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_Recommend]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_ProvinceID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_ProvinceID]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_CityID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_CountyId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_CountyId]  DEFAULT (0) FOR [CountyId]
GO
/****** Object:  Default [DF_KS_ProStore_OrderID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProStore] ADD  CONSTRAINT [DF_KS_ProStore_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_ProSto__store__629C2827]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProStore] ADD  DEFAULT (0) FOR [storeType]
GO
/****** Object:  Default [DF__KS_Templa__Templ__1C09AFAD]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Template] ADD  DEFAULT (0) FOR [TemplateType]
GO
/****** Object:  Default [DF__KS_Templa__OriTe__1CFDD3E6]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Template] ADD  DEFAULT (0) FOR [OriTemplateID]
GO
/****** Object:  Default [DF__KS_ProGro__BigCl__1CC8C9BC]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [BigClassID]
GO
/****** Object:  Default [DF__KS_ProGro__Class__1DBCEDF5]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_ProGro__Locke__1EB1122E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [Locked]
GO
/****** Object:  Default [DF__KS_ProGro__EndTF__1FA53667]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [EndTF]
GO
/****** Object:  Default [DF__KS_ProGro__Allow__20995AA0]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [AllowBMFlag]
GO
/****** Object:  Default [DF__KS_ProGro__IsSuc__218D7ED9]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [IsSuccess]
GO
/****** Object:  Default [DF__KS_ProGro__Price__2281A312]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [Price_Original]
GO
/****** Object:  Default [DF__KS_ProGro__Price__2375C74B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF__KS_ProGro__Weigh__2469EB84]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [Weight]
GO
/****** Object:  Default [DF__KS_ProGro__Limit__255E0FBD]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [LimitBuyNum]
GO
/****** Object:  Default [DF__KS_ProGro__Recom__265233F6]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF__KS_ProGro__Provi__2746582F]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF__KS_ProGro__CityI__283A7C68]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_ProGro__HasSe__292EA0A1]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [HasSellNum]
GO
/****** Object:  Default [DF__KS_ProGro__RealS__2A22C4DA]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [RealSellNum]
GO
/****** Object:  Default [DF__KS_ProGro__ShowD__2B16E913]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [ShowDelivery]
GO
/****** Object:  Default [DF__KS_ProGro__Comme__2C0B0D4C]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [Comment]
GO
/****** Object:  Default [DF__KS_ProGro__IsBus__2CFF3185]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [IsBusiness]
GO
/****** Object:  Default [DF__KS_ProGro__Freig__2DF355BE]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [FreightType]
GO
/****** Object:  Default [DF__KS_ProGro__Freig__2EE779F7]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [Freight]
GO
/****** Object:  Default [DF__KS_ProGro__Amoun__2FDB9E30]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF__KS_ProGro__Amoun__30CFC269]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [AmountNum]
GO
/****** Object:  Default [DF__KS_ProGro__PayID__31C3E6A2]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [PayID]
GO
/****** Object:  Default [DF__KS_ProGro__Group__32B80ADB]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [GroupNum]
GO
/****** Object:  Default [DF__KS_ProGro__Issue__33AC2F14]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [Issue]
GO
/****** Object:  Default [DF__KS_ProGro__Count__34A0534D]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [CountDown]
GO
/****** Object:  Default [DF__KS_ProGro__Progr__35947786]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [Progress]
GO
/****** Object:  Default [DF__KS_ProGro__CmtNu__36889BBF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupOne] ADD  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF_KS_ProComment_ProID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_ProID]  DEFAULT (0) FOR [ProID]
GO
/****** Object:  Default [DF_KS_ProComment_StarNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_StarNum]  DEFAULT (0) FOR [StarNum]
GO
/****** Object:  Default [DF_KS_ProComment_CmtType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_CmtType]  DEFAULT (0) FOR [CmtType]
GO
/****** Object:  Default [DF_KS_ProComment_Support]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_Support]  DEFAULT (0) FOR [Support]
GO
/****** Object:  Default [DF_KS_ProComment_CmtNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_CmtNum]  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF_KS_ProComment_Status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProComment_isGroupBuy]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_isGroupBuy]  DEFAULT (0) FOR [OrderType]
GO
/****** Object:  Default [DF__KS_ProCom__IsRep__75AEFC9B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProComment] ADD  DEFAULT (0) FOR [IsReply]
GO
/****** Object:  Default [DF_KS_ShopSpecification_ShowType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecification] ADD  CONSTRAINT [DF_KS_ShopSpecification_ShowType]  DEFAULT (0) FOR [ShowType]
GO
/****** Object:  Default [DF_KS_ShopSpecification_orderid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecification] ADD  CONSTRAINT [DF_KS_ShopSpecification_orderid]  DEFAULT (0) FOR [orderid]
GO
/****** Object:  Default [DF_KS_ProOrderItem_Price_Market]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_Price_Market]  DEFAULT (0) FOR [Price_Market]
GO
/****** Object:  Default [DF_KS_ProOrderItem_Price_Cost]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_Price_Cost]  DEFAULT (0) FOR [Price_Cost]
GO
/****** Object:  Default [DF_KS_ProOrderItem_Price]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_KS_ProOrderItem_num]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_num]  DEFAULT (0) FOR [num]
GO
/****** Object:  Default [DF_KS_ProOrderItem_TotalPrice]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_TotalPrice]  DEFAULT (0) FOR [TotalPrice]
GO
/****** Object:  Default [DF_KS_ProOrderItem_IsChangedBuy]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_IsChangedBuy]  DEFAULT (0) FOR [IsChangeBuy]
GO
/****** Object:  Default [DF_KS_ProOrderItem_LimitBuyTaskID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_LimitBuyTaskID]  DEFAULT (0) FOR [LimitBuyTaskID]
GO
/****** Object:  Default [DF_KS_ProOrderItem_IsLimitBuy]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_IsLimitBuy]  DEFAULT (0) FOR [IsLimitBuy]
GO
/****** Object:  Default [DF_KS_ProOrderItem_IsBundleSale]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_IsBundleSale]  DEFAULT (0) FOR [IsBundleSale]
GO
/****** Object:  Default [DF_KS_ProOrderItem_ChangeScore]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_ChangeScore]  DEFAULT (0) FOR [ChangeScore]
GO
/****** Object:  Default [DF_KS_ProOrderItem_FreightType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_FreightType]  DEFAULT (0) FOR [FreightType]
GO
/****** Object:  Default [DF_KS_ProOrderItem_Freight]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_Freight]  DEFAULT (0) FOR [Freight]
GO
/****** Object:  Default [DF_KS_ProOrderItem_CityID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_ProOrderItem_IsCmt]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_IsCmt]  DEFAULT (0) FOR [IsCmt]
GO
/****** Object:  Default [DF__KS_ProOrd__chann__657894D2]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProOrderItem] ADD  DEFAULT (0) FOR [channelid]
GO
/****** Object:  Default [DF__KS_U_down__InfoI__066DDD9B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__InfoI__066DDD9B]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_U_down__Class__076201D4]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__Class__076201D4]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_U_down__prior__4D01216C]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__prior__4D01216C]  DEFAULT (0) FOR [priority]
GO
/****** Object:  Default [DF__KS_U_downl__Hits__4DF545A5]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_downl__Hits__4DF545A5]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_U_down__HitsB__4EE969DE]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__HitsB__4EE969DE]  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF__KS_U_down__HitsB__4FDD8E17]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__HitsB__4FDD8E17]  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF__KS_U_down__HitsB__50D1B250]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__HitsB__50D1B250]  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF__KS_U_down__VoteI__51C5D689]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__VoteI__51C5D689]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF__KS_U_down__ShowO__52B9FAC2]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__ShowO__52B9FAC2]  DEFAULT (0) FOR [ShowON3G]
GO
/****** Object:  Default [DF__KS_U_down__Refre__53AE1EFB]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__Refre__53AE1EFB]  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF__KS_U_down__Verif__54A24334]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__Verif__54A24334]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_U_down__DelTF__5596676D]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__DelTF__5596676D]  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF__KS_U_down__Attac__568A8BA6]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__Attac__568A8BA6]  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF__KS_U_down__Attac__577EAFDF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__Attac__577EAFDF]  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF__KS_U_down__CityI__5872D418]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__CityI__5872D418]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_U_down__Count__5966F851]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__Count__5966F851]  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_U_down__Comme__5A5B1C8A]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__Comme__5A5B1C8A]  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF__KS_U_down__ProID__5B4F40C3]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__ProID__5B4F40C3]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF__KS_U_down__ReadP__5C4364FC]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__ReadP__5C4364FC]  DEFAULT (0) FOR [ReadPoint]
GO
/****** Object:  Default [DF__KS_U_down__Charg__5D378935]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__Charg__5D378935]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF__KS_U_down__Pitch__5E2BAD6E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__Pitch__5E2BAD6E]  DEFAULT (0) FOR [PitchTime]
GO
/****** Object:  Default [DF__KS_U_down__ReadT__5F1FD1A7]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__ReadT__5F1FD1A7]  DEFAULT (0) FOR [ReadTimes]
GO
/****** Object:  Default [DF__KS_U_down__Divid__6013F5E0]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__Divid__6013F5E0]  DEFAULT (0) FOR [DividePercent]
GO
/****** Object:  Default [DF__KS_U_downl__PKID__61081A19]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_downl__PKID__61081A19]  DEFAULT (0) FOR [PKID]
GO
/****** Object:  Default [DF__KS_U_down__InfoP__7E6372D6]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  CONSTRAINT [DF__KS_U_down__InfoP__7E6372D6]  DEFAULT (0) FOR [InfoPurview]
GO
/****** Object:  Default [DF__KS_U_down__GoodN__05264A55]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [GoodNum]
GO
/****** Object:  Default [DF__KS_U_down__BadNu__061A6E8E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [BadNum]
GO
/****** Object:  Default [DF__KS_U_down__FavNu__070E92C7]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [FavNum]
GO
/****** Object:  Default [DF__KS_U_down__Share__0802B700]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [ShareNum]
GO
/****** Object:  Default [DF_KS_ProCommentReply_cmtid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCommentReply] ADD  CONSTRAINT [DF_KS_ProCommentReply_cmtid]  DEFAULT (0) FOR [cmtid]
GO
/****** Object:  Default [DF_KS_ProCommentReply_userid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCommentReply] ADD  CONSTRAINT [DF_KS_ProCommentReply_userid]  DEFAULT (0) FOR [userid]
GO
/****** Object:  Default [DF__KS_Advert__board__7F60ED59]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF__KS_Advert__board__7F60ED59]  DEFAULT (0) FOR [boardid]
GO
/****** Object:  Default [DF__KS_Advert__AdTyp__00551192]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF__KS_Advert__AdTyp__00551192]  DEFAULT (0) FOR [AdType]
GO
/****** Object:  Default [DF__KS_Advert__ShowT__014935CB]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF__KS_Advert__ShowT__014935CB]  DEFAULT (0) FOR [ShowType]
GO
/****** Object:  Default [DF__KS_Advert__LinkT__023D5A04]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF__KS_Advert__LinkT__023D5A04]  DEFAULT (0) FOR [LinkTarget]
GO
/****** Object:  Default [DF__KS_Advert__Width__03317E3D]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF__KS_Advert__Width__03317E3D]  DEFAULT (0) FOR [Width]
GO
/****** Object:  Default [DF__KS_Advert__Heigh__0425A276]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF__KS_Advert__Heigh__0425A276]  DEFAULT (0) FOR [Height]
GO
/****** Object:  Default [DF__KS_Advert__Click__0519C6AF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF__KS_Advert__Click__0519C6AF]  DEFAULT (0) FOR [Clicks]
GO
/****** Object:  Default [DF__KS_Advert__Views__060DEAE8]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF__KS_Advert__Views__060DEAE8]  DEFAULT (0) FOR [Views]
GO
/****** Object:  Default [DF__KS_Advert__TimeL__07020F21]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF__KS_Advert__TimeL__07020F21]  DEFAULT (0) FOR [TimeLimit]
GO
/****** Object:  Default [DF__KS_Advert__Statu__07F6335A]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF__KS_Advert__Statu__07F6335A]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_Advertise_RecordClicks]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF_KS_Advertise_RecordClicks]  DEFAULT (0) FOR [RecordClickIP]
GO
/****** Object:  Default [DF_KS_Advertise_ClickAddScorePerTime]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF_KS_Advertise_ClickAddScorePerTime]  DEFAULT (0) FOR [ClickAddScorePerTime]
GO
/****** Object:  Default [DF_KS_Advertise_ClickScore]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF_KS_Advertise_ClickScore]  DEFAULT (0) FOR [ClickScore]
GO
/****** Object:  Default [DF__KS_Class__Parent__3E52440B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Parent__3E52440B]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF__KS_Class__Root__3F466844]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Root__3F466844]  DEFAULT (0) FOR [Root]
GO
/****** Object:  Default [DF__KS_Class__OrderI__403A8C7D]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__OrderI__403A8C7D]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_Class__Child__412EB0B6]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Child__412EB0B6]  DEFAULT (0) FOR [Child]
GO
/****** Object:  Default [DF__KS_Class__PrevID__4222D4EF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__PrevID__4222D4EF]  DEFAULT (0) FOR [PrevID]
GO
/****** Object:  Default [DF__KS_Class__NextID__4316F928]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__NextID__4316F928]  DEFAULT (0) FOR [NextID]
GO
/****** Object:  Default [DF__KS_Class__ClassT__440B1D61]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__ClassT__440B1D61]  DEFAULT (1) FOR [ClassType]
GO
/****** Object:  Default [DF__KS_Class__ShowIn__44FF419A]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__ShowIn__44FF419A]  DEFAULT (0) FOR [ShowInTop]
GO
/****** Object:  Default [DF_KS_Class_ShowOn3G]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_ShowOn3G]  DEFAULT (0) FOR [ShowOn3G]
GO
/****** Object:  Default [DF__KS_Class__ShowIn__45F365D3]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__ShowIn__45F365D3]  DEFAULT (0) FOR [ShowInCir]
GO
/****** Object:  Default [DF__KS_Class__AllowP__46E78A0C]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__AllowP__46E78A0C]  DEFAULT (0) FOR [AllowPubInfo]
GO
/****** Object:  Default [DF_KS_Class_PubFlag]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_PubFlag]  DEFAULT (1) FOR [PubFlag]
GO
/****** Object:  Default [DF__KS_Class__AllowP__47DBAE45]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__AllowP__47DBAE45]  DEFAULT ('0') FOR [AllowPubGroupID]
GO
/****** Object:  Default [DF__KS_Class__PubAdd__48CFD27E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__PubAdd__48CFD27E]  DEFAULT (0) FOR [PubAddMoney]
GO
/****** Object:  Default [DF__KS_Class__PubAdd__49C3F6B7]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__PubAdd__49C3F6B7]  DEFAULT (0) FOR [PubAddPoint]
GO
/****** Object:  Default [DF__KS_Class__PubAdd__4AB81AF0]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__PubAdd__4AB81AF0]  DEFAULT (0) FOR [PubAddScore]
GO
/****** Object:  Default [DF_KS_Class_CmtAddScore]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_CmtAddScore]  DEFAULT (0) FOR [CmtAddScore]
GO
/****** Object:  Default [DF_KS_Class_ShareAddScore]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_ShareAddScore]  DEFAULT (0) FOR [ShareAddScore]
GO
/****** Object:  Default [DF__KS_Class__Create__4BAC3F29]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Create__4BAC3F29]  DEFAULT (0) FOR [CreateHtmlFlag]
GO
/****** Object:  Default [DF__KS_Class__AutoCr__4CA06362]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__AutoCr__4CA06362]  DEFAULT (0) FOR [AutoCreateType]
GO
/****** Object:  Default [DF_KS_Class_ClassFsoDirRule]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_ClassFsoDirRule]  DEFAULT (0) FOR [ClassFsoDirRule]
GO
/****** Object:  Default [DF_KS_Class_DomainBindType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_DomainBindType]  DEFAULT (0) FOR [DomainBindType]
GO
/****** Object:  Default [DF__KS_Class__ClassP__4D94879B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__ClassP__4D94879B]  DEFAULT (0) FOR [ClassPurview]
GO
/****** Object:  Default [DF__KS_Class__Defaul__4E88ABD4]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Defaul__4E88ABD4]  DEFAULT (0) FOR [DefaultReadPoint]
GO
/****** Object:  Default [DF__KS_Class__Defaul__4F7CD00D]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Defaul__4F7CD00D]  DEFAULT (0) FOR [DefaultChargeType]
GO
/****** Object:  Default [DF__KS_Class__Defaul__5070F446]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Defaul__5070F446]  DEFAULT (24) FOR [DefaultPitchTime]
GO
/****** Object:  Default [DF__KS_Class__Defaul__5165187F]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Defaul__5165187F]  DEFAULT (10) FOR [DefaultReadTimes]
GO
/****** Object:  Default [DF__KS_Class__Defaul__52593CB8]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Defaul__52593CB8]  DEFAULT (0) FOR [DefaultDividePercent]
GO
/****** Object:  Default [DF_KS_Class_InfoNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_InfoNum]  DEFAULT (0) FOR [InfoNum]
GO
/****** Object:  Default [DF_KS_Class_ProSpecialID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_ProSpecialID]  DEFAULT (0) FOR [ProSpecialID]
GO
/****** Object:  Default [DF_KS_ProSpecificationR_ClassID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecificationR] ADD  CONSTRAINT [DF_KS_ProSpecificationR_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_ProSpecificationR_SID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProSpecificationR] ADD  CONSTRAINT [DF_KS_ProSpecificationR_SID]  DEFAULT (0) FOR [SID]
GO
/****** Object:  Default [DF_KS_ProInvoice_InvoiceType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProInvoice] ADD  CONSTRAINT [DF_KS_ProInvoice_InvoiceType]  DEFAULT (0) FOR [InvoiceType]
GO
/****** Object:  Default [DF__KS_Link__ClassID__25518C17]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_Link__LinkTyp__2645B050]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [LinkType]
GO
/****** Object:  Default [DF__KS_Link__Hits__2739D489]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_Link__Recomme__282DF8C2]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF__KS_Link__Locked__29221CFB]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [Locked]
GO
/****** Object:  Default [DF__KS_Link__Verify__2A164134]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_Link_OrderID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Link] ADD  CONSTRAINT [DF_KS_Link_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_ProGroupBuyConsumer_Times]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuyConsumer] ADD  CONSTRAINT [DF_KS_ProGroupBuyConsumer_Times]  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF_KS_ProBundleSale_proid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBundleSale] ADD  CONSTRAINT [DF_KS_ProBundleSale_proid]  DEFAULT (0) FOR [infoid]
GO
/****** Object:  Default [DF_KS_ProBundleSale_kbproid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBundleSale] ADD  CONSTRAINT [DF_KS_ProBundleSale_kbproid]  DEFAULT (0) FOR [kbinfoid]
GO
/****** Object:  Default [DF_KS_ProBundleSale_kbprice]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBundleSale] ADD  CONSTRAINT [DF_KS_ProBundleSale_kbprice]  DEFAULT (0) FOR [kbprice]
GO
/****** Object:  Default [DF_KS_ProBundleSale_attrid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBundleSale] ADD  CONSTRAINT [DF_KS_ProBundleSale_attrid]  DEFAULT (0) FOR [attrid]
GO
/****** Object:  Default [DF_KS_AskTable_IsSys]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskTable] ADD  CONSTRAINT [DF_KS_AskTable_IsSys]  DEFAULT (0) FOR [IsSys]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_BigClassID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_BigClassID]  DEFAULT (0) FOR [BigClassID]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_ClassID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Locked]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Locked]  DEFAULT (0) FOR [Locked]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_EndTF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_EndTF]  DEFAULT (0) FOR [EndTF]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_AllowBMFlag]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_AllowBMFlag]  DEFAULT (0) FOR [AllowBMFlag]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_minnum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_minnum]  DEFAULT (0) FOR [minnum]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_minnumtime]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_minnumtime]  DEFAULT (getdate()) FOR [minnumtime]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_IsSuccess]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_IsSuccess]  DEFAULT (0) FOR [IsSuccess]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Discount]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Discount]  DEFAULT (0) FOR [Discount]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Weight]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Weight]  DEFAULT (0) FOR [Weight]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_LimitBuyNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_LimitBuyNum]  DEFAULT (0) FOR [LimitBuyNum]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Recommend]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_ProvinceID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_ProvinceID]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_CityID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_HasSellNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_HasSellNum]  DEFAULT (0) FOR [HasSellNum]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_RealSellNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_RealSellNum]  DEFAULT (0) FOR [RealSellNum]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_CleanCart]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_CleanCart]  DEFAULT (0) FOR [CleanCart]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_ShowDelivery]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_ShowDelivery]  DEFAULT (0) FOR [ShowDelivery]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Comment]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Comment]  DEFAULT (0) FOR [Comment]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_IsBusiness]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_IsBusiness]  DEFAULT (0) FOR [IsBusiness]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Freight]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Freight]  DEFAULT (0) FOR [Freight]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_AmountNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_AmountNum]  DEFAULT (0) FOR [AmountNum]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_PayID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_PayID]  DEFAULT (0) FOR [PayID]
GO
/****** Object:  Default [DF__KS_ProGro__CmtNu__76A320D4]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF_KS_ProBookCodeType_ApplyNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBookCodeType] ADD  CONSTRAINT [DF_KS_ProBookCodeType_ApplyNum]  DEFAULT (0) FOR [ApplyNum]
GO
/****** Object:  Default [DF__KS_ProBoo__UseAp__277B6259]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBookCodeType] ADD  DEFAULT (0) FOR [UseApplyCity]
GO
/****** Object:  Default [DF_KS_PKZT_UserTF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_UserTF]  DEFAULT (0) FOR [UserTF]
GO
/****** Object:  Default [DF_KS_PKZT_OnceTF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_OnceTF]  DEFAULT (0) FOR [OnceTF]
GO
/****** Object:  Default [DF_KS_PKZT_VerifyTF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_VerifyTF]  DEFAULT (0) FOR [VerifyTF]
GO
/****** Object:  Default [DF_KS_PKZT_Status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_PKZT_TimeLimit]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_TimeLimit]  DEFAULT (0) FOR [TimeLimit]
GO
/****** Object:  Default [DF_KS_PKZT_BeginDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_BeginDate]  DEFAULT (getdate()) FOR [BeginDate]
GO
/****** Object:  Default [DF_KS_PKZT_EndDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_EndDate]  DEFAULT (getdate()) FOR [EndDate]
GO
/****** Object:  Default [DF_KS_PKZT_ZFVotes]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_ZFVotes]  DEFAULT (0) FOR [ZFVotes]
GO
/****** Object:  Default [DF_KS_PKZT_FFVotes]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_FFVotes]  DEFAULT (0) FOR [FFVotes]
GO
/****** Object:  Default [DF_KS_ProductList_ChannelID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_ProductList_Weight]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Weight]  DEFAULT (0) FOR [Weight]
GO
/****** Object:  Default [DF_KS_ProductList_priority]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_priority]  DEFAULT (0) FOR [priority]
GO
/****** Object:  Default [DF_KS_ProductList_Hits]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Hits]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF_KS_ProductList_BrandID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_BrandID]  DEFAULT (0) FOR [BrandID]
GO
/****** Object:  Default [DF_KS_ProductList_HitsByDay]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_HitsByDay]  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF_KS_ProductList_HitsByWeek]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_HitsByWeek]  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF_KS_ProductList_HitsByMonth]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_HitsByMonth]  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF_KS_ProductList_LastHitsTime]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_LastHitsTime]  DEFAULT (getdate()) FOR [LastHitsTime]
GO
/****** Object:  Default [DF_KS_ProductList_Amount]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Amount]  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF_KS_ProductList_AlarmNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_AlarmNum]  DEFAULT (0) FOR [AlarmNum]
GO
/****** Object:  Default [DF_KS_ProductList_Price]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_KS_ProductList_Price_Member]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Price_Member]  DEFAULT (0) FOR [Price_Member]
GO
/****** Object:  Default [DF_KS_ProductList_Price_Cost]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Price_Cost]  DEFAULT (0) FOR [Price_Cost]
GO
/****** Object:  Default [DF_KS_ProductList_GroupPrice]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_GroupPrice]  DEFAULT (0) FOR [GroupPrice]
GO
/****** Object:  Default [DF_KS_ProductList_TaxTF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_TaxTF]  DEFAULT (0) FOR [TaxTF]
GO
/****** Object:  Default [DF_KS_ProductList_Tax]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Tax]  DEFAULT (0) FOR [Tax]
GO
/****** Object:  Default [DF_KS_ProductList_MinOrderNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_MinOrderNum]  DEFAULT (0) FOR [MinOrderNum]
GO
/****** Object:  Default [DF_KS_ProductList_MaxOrderNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_MaxOrderNum]  DEFAULT (0) FOR [MaxOrderNum]
GO
/****** Object:  Default [DF_KS_ProductList_VoteID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_VoteID]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF_KS_ProductList_ShowOn3G]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_ShowOn3G]  DEFAULT (0) FOR [ShowOn3G]
GO
/****** Object:  Default [DF_KS_ProductList_RefreshTF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_RefreshTF]  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF_KS_ProductList_Verify]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Verify]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_ProductList_Point]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Point]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF_KS_ProductList_DelTF]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_DelTF]  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF_KS_ProductList_HasSold]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_HasSold]  DEFAULT (0) FOR [HasSold]
GO
/****** Object:  Default [DF_KS_ProductList_CommentNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_CommentNum]  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF_KS_ProductList_CmtNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_CmtNum]  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF_KS_ProductList_AskNum]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_AskNum]  DEFAULT (0) FOR [AskNum]
GO
/****** Object:  Default [DF_KS_ProductList_AttachmentCharge]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_AttachmentCharge]  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF_KS_ProductList_AttachmentChargeOnce]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_AttachmentChargeOnce]  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF_KS_ProductList_IsScoreChange]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_IsScoreChange]  DEFAULT (0) FOR [IsScoreChange]
GO
/****** Object:  Default [DF_KS_ProductList_ChangeScore]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_ChangeScore]  DEFAULT (0) FOR [ChangeScore]
GO
/****** Object:  Default [DF_KS_ProductList_SocialIDs]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_SocialIDs]  DEFAULT (0) FOR [SocialIDs]
GO
/****** Object:  Default [DF_KS_ProductList_PayID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_PayID]  DEFAULT (0) FOR [PayID]
GO
/****** Object:  Default [DF_KS_ProductList_Price_Front]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Price_Front]  DEFAULT (0) FOR [FrontPrice]
GO
/****** Object:  Default [DF_KS_ProductList_IsGroupRate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_IsGroupRate]  DEFAULT (0) FOR [IsGroupRate]
GO
/****** Object:  Default [DF_KS_ProductList_ProvinceId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_ProvinceId]  DEFAULT (0) FOR [ProvinceId]
GO
/****** Object:  Default [DF_KS_ProductList_CityId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_CityId]  DEFAULT (0) FOR [CityId]
GO
/****** Object:  Default [DF_KS_ProductList_CountyId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_CountyId]  DEFAULT (0) FOR [CountyId]
GO
/****** Object:  Default [DF__KS_Produc__Limit__0ED9D1C1]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF__KS_Produc__Limit__0ED9D1C1]  DEFAULT (0) FOR [LimitBuyType]
GO
/****** Object:  Default [DF__KS_Produc__Limit__0FCDF5FA]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF__KS_Produc__Limit__0FCDF5FA]  DEFAULT (0) FOR [LimitBuyNum]
GO
/****** Object:  Default [DF__KS_Produc__GoodN__79B497A9]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [GoodNum]
GO
/****** Object:  Default [DF__KS_Produc__BadNu__7AA8BBE2]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [BadNum]
GO
/****** Object:  Default [DF__KS_Produc__FavNu__7B9CE01B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [FavNum]
GO
/****** Object:  Default [DF__KS_Produc__Share__7C910454]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [ShareNum]
GO
/****** Object:  Default [DF__KS_Produc__Freig__60B3DFB5]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [FreightFree]
GO
/****** Object:  Default [DF_KS_AskPost_TopicID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_TopicID]  DEFAULT (0) FOR [TopicID]
GO
/****** Object:  Default [DF_KS_AskPost_addDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_addDate]  DEFAULT (getdate()) FOR [addDate]
GO
/****** Object:  Default [DF_KS_AskPost_IsBest]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_IsBest]  DEFAULT (0) FOR [IsBest]
GO
/****** Object:  Default [DF_KS_AskPost_Status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_Status]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_AskPost_UserId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_UserId]  DEFAULT (0) FOR [UserId]
GO
/****** Object:  Default [DF_KS_AskPost_IsZj]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_IsZj]  DEFAULT (0) FOR [IsZj]
GO
/****** Object:  Default [DF_KS_ProPaymentType_Discount]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProPaymentType] ADD  CONSTRAINT [DF_KS_ProPaymentType_Discount]  DEFAULT (0) FOR [Discount]
GO
/****** Object:  Default [DF_KS_ProPaymentType_orderid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProPaymentType] ADD  CONSTRAINT [DF_KS_ProPaymentType_orderid]  DEFAULT (0) FOR [orderid]
GO
/****** Object:  Default [DF_KS_ProPaymentType_Status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProPaymentType] ADD  CONSTRAINT [DF_KS_ProPaymentType_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProPaymentType_isDefault]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProPaymentType] ADD  CONSTRAINT [DF_KS_ProPaymentType_isDefault]  DEFAULT (0) FOR [isDefault]
GO
/****** Object:  Default [DF_KS_ProPaymentType_TypeFlag]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProPaymentType] ADD  CONSTRAINT [DF_KS_ProPaymentType_TypeFlag]  DEFAULT (0) FOR [TypeFlag]
GO
/****** Object:  Default [DF_KS_PaymentPlatItem_PayId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PaymentPlatItem] ADD  CONSTRAINT [DF_KS_PaymentPlatItem_PayId]  DEFAULT (0) FOR [PayId]
GO
/****** Object:  Default [DF_KS_PaymentPlatItem_IsDefault]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_PaymentPlatItem] ADD  CONSTRAINT [DF_KS_PaymentPlatItem_IsDefault]  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF_KS_BBSPost_Verify]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSPost] ADD  CONSTRAINT [DF_KS_BBSPost_Verify]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_BBSPost_UserId]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSPost] ADD  CONSTRAINT [DF_KS_BBSPost_UserId]  DEFAULT (0) FOR [UserId]
GO
/****** Object:  Default [DF_KS_BBSPost_UserName]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BBSPost] ADD  CONSTRAINT [DF_KS_BBSPost_UserName]  DEFAULT (0) FOR [UserName]
GO
/****** Object:  Default [DF__KS_UserPh__UserI__4F9D96F5]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_UserPh__TypeI__5091BB2E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [TypeID]
GO
/****** Object:  Default [DF__KS_UserPh__Class__5185DF67]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_UserPhot__Hit__527A03A0]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [Hit]
GO
/****** Object:  Default [DF__KS_UserPh__Statu__536E27D9]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_UserPho__Fund__54624C12]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [Fund]
GO
/****** Object:  Default [DF__KS_UserPh__PageS__5556704B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [PageSize]
GO
/****** Object:  Default [DF__KS_UserPh__Model__564A9484]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [Model]
GO
/****** Object:  Default [DF_KS_WeixinPigmsg_IsPic]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_WeixinPigmsg] ADD  CONSTRAINT [DF_KS_WeixinPigmsg_IsPic]  DEFAULT (0) FOR [IsPic]
GO
/****** Object:  Default [DF_KS_WeixinPigmsg_ParentID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_WeixinPigmsg] ADD  CONSTRAINT [DF_KS_WeixinPigmsg_ParentID]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF_KS_WeixinPigmsg_AddTime]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_WeixinPigmsg] ADD  CONSTRAINT [DF_KS_WeixinPigmsg_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_KS_WeixinPigmsg_TypeFlag]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_WeixinPigmsg] ADD  CONSTRAINT [DF_KS_WeixinPigmsg_TypeFlag]  DEFAULT (0) FOR [TypeFlag]
GO
/****** Object:  Default [DF_KS_WeixinPigmsg_Show_cover_pic]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_WeixinPigmsg] ADD  CONSTRAINT [DF_KS_WeixinPigmsg_Show_cover_pic]  DEFAULT (0) FOR [Show_cover_pic]
GO
/****** Object:  Default [DF_KS_WeiXinGroup_SendType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_WeiXinQunFA] ADD  CONSTRAINT [DF_KS_WeiXinGroup_SendType]  DEFAULT (0) FOR [SendType]
GO
/****** Object:  Default [DF_KS_WeiXinGroup_TypeFlag]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_WeiXinQunFA] ADD  CONSTRAINT [DF_KS_WeiXinGroup_TypeFlag]  DEFAULT (0) FOR [TypeFlag]
GO
/****** Object:  Default [DF_KS_UserRecord_flag]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserRecord] ADD  CONSTRAINT [DF_KS_UserRecord_flag]  DEFAULT (0) FOR [flag]
GO
/****** Object:  Default [DF_KS_UserRecord_adddate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserRecord] ADD  CONSTRAINT [DF_KS_UserRecord_adddate]  DEFAULT (getdate()) FOR [adddate]
GO
/****** Object:  Default [DF_KS_UserRecord_userid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserRecord] ADD  CONSTRAINT [DF_KS_UserRecord_userid]  DEFAULT (0) FOR [userid]
GO
/****** Object:  Default [DF_KS_UserDepartment_ParentID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_ParentID]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF_KS_UserDepartment_Root]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_Root]  DEFAULT (0) FOR [Root]
GO
/****** Object:  Default [DF_KS_UserDepartment_Depth]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_Depth]  DEFAULT (0) FOR [Depth]
GO
/****** Object:  Default [DF_KS_UserDepartment_OrderID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_UserDepartment_Child]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_Child]  DEFAULT (0) FOR [Child]
GO
/****** Object:  Default [DF_KS_UserDepartment_PrevID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_PrevID]  DEFAULT (0) FOR [PrevID]
GO
/****** Object:  Default [DF_KS_UserDepartment_NextID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_NextID]  DEFAULT (0) FOR [NextID]
GO
/****** Object:  Default [DF_KS_WeixinOpenuser_Subscribe_Time]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_WeixinOpenuser] ADD  CONSTRAINT [DF_KS_WeixinOpenuser_Subscribe_Time]  DEFAULT (getdate()) FOR [Subscribe_Time]
GO
/****** Object:  Default [DF_KS_WeixinOpenuser_Verify]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_WeixinOpenuser] ADD  CONSTRAINT [DF_KS_WeixinOpenuser_Verify]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_WeixinOpenuser_Flag]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_WeixinOpenuser] ADD  CONSTRAINT [DF_KS_WeixinOpenuser_Flag]  DEFAULT (0) FOR [Flag]
GO
/****** Object:  Default [DF__KS_Blog__ClassID__34E9A0B9]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Blog] ADD  CONSTRAINT [DF__KS_Blog__ClassID__34E9A0B9]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_Blog__Templat__35DDC4F2]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Blog] ADD  CONSTRAINT [DF__KS_Blog__Templat__35DDC4F2]  DEFAULT (0) FOR [TemplateID]
GO
/****** Object:  Default [DF__KS_Blog__Hits__36D1E92B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Blog] ADD  CONSTRAINT [DF__KS_Blog__Hits__36D1E92B]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_U_Prod__InfoI__0D1ADB2A]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__InfoI__0D1ADB2A]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_U_Prod__Class__0E0EFF63]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Class__0E0EFF63]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_U_Prod__prior__744FF8B7]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__prior__744FF8B7]  DEFAULT (0) FOR [priority]
GO
/****** Object:  Default [DF__KS_U_Produ__Hits__75441CF0]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Produ__Hits__75441CF0]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_U_Prod__HitsB__76384129]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__HitsB__76384129]  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF__KS_U_Prod__HitsB__772C6562]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__HitsB__772C6562]  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF__KS_U_Prod__HitsB__7820899B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__HitsB__7820899B]  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF__KS_U_Prod__VoteI__7914ADD4]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__VoteI__7914ADD4]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF__KS_U_Prod__ShowO__7A08D20D]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__ShowO__7A08D20D]  DEFAULT (0) FOR [ShowON3G]
GO
/****** Object:  Default [DF__KS_U_Prod__Refre__7AFCF646]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Refre__7AFCF646]  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF__KS_U_Prod__Verif__7BF11A7F]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Verif__7BF11A7F]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_U_Prod__DelTF__7CE53EB8]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__DelTF__7CE53EB8]  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF__KS_U_Prod__Attac__7DD962F1]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Attac__7DD962F1]  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF__KS_U_Prod__Attac__7ECD872A]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Attac__7ECD872A]  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF__KS_U_Prod__Produ__7FC1AB63]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Produ__7FC1AB63]  DEFAULT (0) FOR [ProductType]
GO
/****** Object:  Default [DF__KS_U_Prod__Chann__00B5CF9C]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Chann__00B5CF9C]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_U_Prod__Weigh__01A9F3D5]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Weigh__01A9F3D5]  DEFAULT (0) FOR [Weight]
GO
/****** Object:  Default [DF__KS_U_Prod__Servi__029E180E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Servi__029E180E]  DEFAULT (0) FOR [ServiceTerm]
GO
/****** Object:  Default [DF__KS_U_Prod__Brand__03923C47]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Brand__03923C47]  DEFAULT (0) FOR [BrandID]
GO
/****** Object:  Default [DF__KS_U_Prod__Amoun__04866080]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Amoun__04866080]  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF__KS_U_Prod__Alarm__057A84B9]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Alarm__057A84B9]  DEFAULT (0) FOR [AlarmNum]
GO
/****** Object:  Default [DF__KS_U_Prod__Price__066EA8F2]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Price__066EA8F2]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF__KS_U_Prod__Price__0762CD2B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Price__0762CD2B]  DEFAULT (0) FOR [Price_Member]
GO
/****** Object:  Default [DF_KS_U_Product_Price_Cost]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF_KS_U_Product_Price_Cost]  DEFAULT (0) FOR [Price_Cost]
GO
/****** Object:  Default [DF__KS_U_Prod__Group__0856F164]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Group__0856F164]  DEFAULT (0) FOR [GroupPrice]
GO
/****** Object:  Default [DF__KS_U_Prod__TaxTF__094B159D]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__TaxTF__094B159D]  DEFAULT (0) FOR [TaxTF]
GO
/****** Object:  Default [DF__KS_U_Produc__Tax__0A3F39D6]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Produc__Tax__0A3F39D6]  DEFAULT (0) FOR [Tax]
GO
/****** Object:  Default [DF__KS_U_Prod__MinOr__0B335E0F]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__MinOr__0B335E0F]  DEFAULT (0) FOR [MinOrderNum]
GO
/****** Object:  Default [DF__KS_U_Prod__MaxOr__0C278248]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__MaxOr__0C278248]  DEFAULT (0) FOR [MaxOrderNum]
GO
/****** Object:  Default [DF__KS_U_Prod__Score__0D1BA681]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Score__0D1BA681]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF__KS_U_Prod__IsCha__0E0FCABA]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__IsCha__0E0FCABA]  DEFAULT (0) FOR [IsChangeBuy]
GO
/****** Object:  Default [DF__KS_U_Prod__Chang__0F03EEF3]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Chang__0F03EEF3]  DEFAULT (0) FOR [ChangeBuyNeedPrice]
GO
/****** Object:  Default [DF__KS_U_Prod__Chang__0FF8132C]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Chang__0FF8132C]  DEFAULT (0) FOR [ChangeBuyPresentPrice]
GO
/****** Object:  Default [DF__KS_U_Prod__IsLim__10EC3765]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__IsLim__10EC3765]  DEFAULT (0) FOR [IsLimitbuy]
GO
/****** Object:  Default [DF__KS_U_Prod__Limit__11E05B9E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Limit__11E05B9E]  DEFAULT (0) FOR [LimitBuyPrice]
GO
/****** Object:  Default [DF__KS_U_Prod__Limit__12D47FD7]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Limit__12D47FD7]  DEFAULT (0) FOR [LimitBuyTaskID]
GO
/****** Object:  Default [DF__KS_U_Prod__Limit__13C8A410]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Limit__13C8A410]  DEFAULT (0) FOR [LimitBuyAmount]
GO
/****** Object:  Default [DF__KS_U_Prod__HasSo__14BCC849]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__HasSo__14BCC849]  DEFAULT (0) FOR [HasSold]
GO
/****** Object:  Default [DF__KS_U_Prod__Comme__15B0EC82]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Comme__15B0EC82]  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF__KS_U_Prod__CmtNu__16A510BB]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__CmtNu__16A510BB]  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF__KS_U_Prod__AskNu__179934F4]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__AskNu__179934F4]  DEFAULT (0) FOR [AskNum]
GO
/****** Object:  Default [DF__KS_U_Prod__IsSco__188D592D]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__IsSco__188D592D]  DEFAULT (0) FOR [IsScoreChange]
GO
/****** Object:  Default [DF__KS_U_Prod__Chang__19817D66]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Chang__19817D66]  DEFAULT (0) FOR [ChangeScore]
GO
/****** Object:  Default [DF__KS_U_Prod__PayTy__1A75A19F]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__PayTy__1A75A19F]  DEFAULT (0) FOR [PayType]
GO
/****** Object:  Default [DF_KS_U_Product_PayID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF_KS_U_Product_PayID]  DEFAULT (0) FOR [PayID]
GO
/****** Object:  Default [DF__KS_U_Prod__Front__1B69C5D8]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Front__1B69C5D8]  DEFAULT (0) FOR [FrontPrice]
GO
/****** Object:  Default [DF__KS_U_Prod__IsBoo__1D520E4A]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__IsBoo__1D520E4A]  DEFAULT (0) FOR [IsBookCode]
GO
/****** Object:  Default [DF__KS_U_Prod__BookC__1E463283]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__BookC__1E463283]  DEFAULT (0) FOR [BookCodeTypeID]
GO
/****** Object:  Default [DF__KS_U_Prod__Limit__1F3A56BC]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Limit__1F3A56BC]  DEFAULT (0) FOR [LimitCityNum]
GO
/****** Object:  Default [DF__KS_U_Prod__CityI__61FC3E52]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__CityI__61FC3E52]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_U_Prod__Count__62F0628B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Count__62F0628B]  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_U_Prod__Provi__63E486C4]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Provi__63E486C4]  DEFAULT (0) FOR [ProvinceId]
GO
/****** Object:  Default [DF__KS_U_Prod__Limit__10C21A33]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Limit__10C21A33]  DEFAULT (0) FOR [LimitBuyType]
GO
/****** Object:  Default [DF__KS_U_Prod__Limit__11B63E6C]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Prod__Limit__11B63E6C]  DEFAULT (0) FOR [LimitBuyNum]
GO
/****** Object:  Default [DF__KS_U_Produc__a11__5A860513]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  CONSTRAINT [DF__KS_U_Produc__a11__5A860513]  DEFAULT (0) FOR [a11]
GO
/****** Object:  Default [DF__KS_U_Prod__GoodN__08F6DB39]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [GoodNum]
GO
/****** Object:  Default [DF__KS_U_Prod__BadNu__09EAFF72]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [BadNum]
GO
/****** Object:  Default [DF__KS_U_Prod__FavNu__0ADF23AB]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [FavNum]
GO
/****** Object:  Default [DF__KS_U_Prod__Share__0BD347E4]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [ShareNum]
GO
/****** Object:  Default [DF__KS_U_Prod__Freig__61A803EE]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [FreightFree]
GO
/****** Object:  Default [DF_KS_UserFeeSell_AddDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserFeeSell] ADD  CONSTRAINT [DF_KS_UserFeeSell_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF__KS_DiggLi__Chann__66603565]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_DiggList] ADD  CONSTRAINT [DF__KS_DiggLi__Chann__66603565]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_DiggLi__InfoI__6754599E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_DiggList] ADD  CONSTRAINT [DF__KS_DiggLi__InfoI__6754599E]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_DiggLi__Suppo__68487DD7]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_DiggList] ADD  CONSTRAINT [DF__KS_DiggLi__Suppo__68487DD7]  DEFAULT (0) FOR [SupportNum]
GO
/****** Object:  Default [DF__KS_DiggLi__Again__693CA210]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_DiggList] ADD  CONSTRAINT [DF__KS_DiggLi__Again__693CA210]  DEFAULT (0) FOR [AgainstNum]
GO
/****** Object:  Default [DF_KS_RechargeRecords_status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_RechargeRecords] ADD  CONSTRAINT [DF_KS_RechargeRecords_status]  DEFAULT (0) FOR [status]
GO
/****** Object:  Default [DF_KS_RechargeRecords_paymoney]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_RechargeRecords] ADD  CONSTRAINT [DF_KS_RechargeRecords_paymoney]  DEFAULT (0) FOR [paymoney]
GO
/****** Object:  Default [DF_KS_RechargeRecords_realmoney]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_RechargeRecords] ADD  CONSTRAINT [DF_KS_RechargeRecords_realmoney]  DEFAULT (0) FOR [realmoney]
GO
/****** Object:  Default [DF_KS_RechargeRecords_platID]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_RechargeRecords] ADD  CONSTRAINT [DF_KS_RechargeRecords_platID]  DEFAULT (0) FOR [platID]
GO
/****** Object:  Default [DF__KS_YunMan__YunTy__57E98F8A]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [YunType]
GO
/****** Object:  Default [DF__KS_YunMan__Price__58DDB3C3]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF__KS_YunMan__OriYu__59D1D7FC]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [OriYunID]
GO
/****** Object:  Default [DF__KS_YunMan__InfoI__5AC5FC35]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_YunMan__Class__5BBA206E]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_YunMan__Statu__5CAE44A7]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_YunMan__Video__5DA268E0]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [VideoType]
GO
/****** Object:  Default [DF__KS_YunMan__Effec__5E968D19]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [EffectiveMonth]
GO
/****** Object:  Default [DF__KS_YunMan__Alrea__5F8AB152]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [AlreadyMsg]
GO
/****** Object:  Default [DF__KS_YunMan__ProOr__607ED58B]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [ProOrderID]
GO
/****** Object:  Default [DF__KS_YunMan__Curre__6172F9C4]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [CurrentLevel]
GO
/****** Object:  Default [DF__KS_YunMan__useri__62671DFD]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [userid]
GO
/****** Object:  Default [DF__KS_YunMan__LineP__635B4236]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_YunManage] ADD  DEFAULT (0) FOR [LinePeople]
GO
/****** Object:  Default [DF_KS_ProLogDeliver_DeliverType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLogDeliver] ADD  CONSTRAINT [DF_KS_ProLogDeliver_DeliverType]  DEFAULT (0) FOR [DeliverType]
GO
/****** Object:  Default [DF_KS_ProLogDeliver_Status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLogDeliver] ADD  CONSTRAINT [DF_KS_ProLogDeliver_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProLogDeliver_MoneyReturnType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLogDeliver] ADD  CONSTRAINT [DF_KS_ProLogDeliver_MoneyReturnType]  DEFAULT (0) FOR [MoneyReturnType]
GO
/****** Object:  Default [DF_KS_ProLogDeliver_HandlerStatus]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProLogDeliver] ADD  CONSTRAINT [DF_KS_ProLogDeliver_HandlerStatus]  DEFAULT (0) FOR [HandlerStatus]
GO
/****** Object:  Default [DF_KS_UserFeePackages_flag]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserFeePackages] ADD  CONSTRAINT [DF_KS_UserFeePackages_flag]  DEFAULT (0) FOR [flag]
GO
/****** Object:  Default [DF_KS_UserFeePackages_days]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserFeePackages] ADD  CONSTRAINT [DF_KS_UserFeePackages_days]  DEFAULT (0) FOR [days]
GO
/****** Object:  Default [DF_KS_UserFeePackages_price]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserFeePackages] ADD  CONSTRAINT [DF_KS_UserFeePackages_price]  DEFAULT (0) FOR [price]
GO
/****** Object:  Default [DF_KS_UserFeePackages_status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserFeePackages] ADD  CONSTRAINT [DF_KS_UserFeePackages_status]  DEFAULT (0) FOR [status]
GO
/****** Object:  Default [DF_KS_UserFeePackages_modelid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserFeePackages] ADD  CONSTRAINT [DF_KS_UserFeePackages_modelid]  DEFAULT (0) FOR [limit]
GO
/****** Object:  Default [DF__KS_BlogNa__OwnSy__5EDFDA85]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_BlogNav] ADD  CONSTRAINT [DF__KS_BlogNa__OwnSy__5EDFDA85]  DEFAULT (0) FOR [OwnSys]
GO
/****** Object:  Default [DF_KS_ProCoupon_FaceValue]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_FaceValue]  DEFAULT (0) FOR [FaceValue]
GO
/****** Object:  Default [DF_KS_ProCoupon_MinAmount]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_MinAmount]  DEFAULT (0) FOR [MinAmount]
GO
/****** Object:  Default [DF_KS_ProCoupon_CouponType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_CouponType]  DEFAULT (0) FOR [CouponType]
GO
/****** Object:  Default [DF_KS_ProCoupon_BeginDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_BeginDate]  DEFAULT (getdate()) FOR [BeginDate]
GO
/****** Object:  Default [DF_KS_ProCoupon_EndDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_EndDate]  DEFAULT (getdate()) FOR [EndDate]
GO
/****** Object:  Default [DF_KS_ProCoupon_AddDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_ProCoupon_Status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProCoupon_MaxDiscount]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_MaxDiscount]  DEFAULT (0) FOR [MaxDiscount]
GO
/****** Object:  Default [DF_KS_ProCoupon_LimitType]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_LimitType]  DEFAULT (0) FOR [LimitType]
GO
/****** Object:  Default [DF_KS_ProCoupon_LimitIds]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_LimitIds]  DEFAULT (1000) FOR [LimitProIds]
GO
/****** Object:  Default [DF_KS_ProBiddingAsk_Money]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  CONSTRAINT [DF_KS_ProBiddingAsk_Money]  DEFAULT (0) FOR [Money]
GO
/****** Object:  Default [DF_KS_ProBiddingAsk_AddDate]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  CONSTRAINT [DF_KS_ProBiddingAsk_AddDate]  DEFAULT (0) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_ProBiddingAsk_status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  CONSTRAINT [DF_KS_ProBiddingAsk_status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProBiddingAsk_IsZB]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  CONSTRAINT [DF_KS_ProBiddingAsk_IsZB]  DEFAULT (0) FOR [IsZB]
GO
/****** Object:  Default [DF_KS_ProBiddingAsk_AgentPrice]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  CONSTRAINT [DF_KS_ProBiddingAsk_AgentPrice]  DEFAULT (0) FOR [AgentPrice]
GO
/****** Object:  Default [DF_KS_UserFeeDiscount_discount]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserFeeDiscount] ADD  CONSTRAINT [DF_KS_UserFeeDiscount_discount]  DEFAULT (0) FOR [discount]
GO
/****** Object:  Default [DF_KS_UserFeeDiscount_status]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserFeeDiscount] ADD  CONSTRAINT [DF_KS_UserFeeDiscount_status]  DEFAULT (0) FOR [status]
GO
/****** Object:  Default [DF_KS_UserFeeDiscount_packid]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_UserFeeDiscount] ADD  CONSTRAINT [DF_KS_UserFeeDiscount_packid]  DEFAULT (0) FOR [packid]
GO
/****** Object:  Default [DF__KS_Digg__Channel__60A75C0F]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Digg] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_Digg__InfoID__619B8048]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Digg] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_Digg__DiggID__628FA481]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Digg] ADD  DEFAULT (0) FOR [DiggID]
GO
/****** Object:  Default [DF__KS_Digg__DiggTyp__6383C8BA]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_Digg] ADD  DEFAULT (0) FOR [DiggType]
GO
/****** Object:  Default [DF_KS_ProBidding_Money]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBidding] ADD  CONSTRAINT [DF_KS_ProBidding_Money]  DEFAULT (0) FOR [Money]
GO
/****** Object:  Default [DF_KS_ProBidding_Num]    Script Date: 01/13/2017 10:53:12 ******/
ALTER TABLE [KS_ProBidding] ADD  CONSTRAINT [DF_KS_ProBidding_Num]  DEFAULT (0) FOR [Num]
GO
/****** Object:  Default [DF_KS_ProBidding_Times]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBidding] ADD  CONSTRAINT [DF_KS_ProBidding_Times]  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF_KS_ProBidding_IsEnd]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBidding] ADD  CONSTRAINT [DF_KS_ProBidding_IsEnd]  DEFAULT (0) FOR [IsEnd]
GO
/****** Object:  Default [DF__KS_KeyTag__TagsH__1AD3FDA4]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__TagsH__1AD3FDA4]  DEFAULT (0) FOR [TagsHits]
GO
/****** Object:  Default [DF__KS_KeyTag__Today__1BC821DD]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__Today__1BC821DD]  DEFAULT (0) FOR [TodayHits]
GO
/****** Object:  Default [DF__KS_KeyTag__Yeste__1CBC4616]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__Yeste__1CBC4616]  DEFAULT (0) FOR [YesterDayHits]
GO
/****** Object:  Default [DF__KS_KeyTag__WeekH__1DB06A4F]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__WeekH__1DB06A4F]  DEFAULT (0) FOR [WeekHits]
GO
/****** Object:  Default [DF__KS_KeyTag__LastU__1EA48E88]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__LastU__1EA48E88]  DEFAULT (getdate()) FOR [LastUseTime]
GO
/****** Object:  Default [DF__KS_KeyTag__Statu__1F98B2C1]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__Statu__1F98B2C1]  DEFAULT (1) FOR [Status]
GO
/****** Object:  Default [DF__KS_YunMan__YunTy__65438AA8]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [YunType]
GO
/****** Object:  Default [DF__KS_YunMan__Price__6637AEE1]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF__KS_YunMan__InfoI__672BD31A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_YunMan__Class__681FF753]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_YunMan__Statu__69141B8C]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_YunMan__Video__6A083FC5]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [VideoType]
GO
/****** Object:  Default [DF__KS_YunMan__Effec__6AFC63FE]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [EffectiveMonth]
GO
/****** Object:  Default [DF__KS_YunMan__Alrea__6BF08837]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [AlreadyMsg]
GO
/****** Object:  Default [DF__KS_YunMan__ProOr__6CE4AC70]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [ProOrderID]
GO
/****** Object:  Default [DF__KS_YunMan__Curre__6DD8D0A9]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [CurrentLevel]
GO
/****** Object:  Default [DF__KS_YunMan__LineP__6ECCF4E2]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunManageItem] ADD  DEFAULT (0) FOR [LinePeople]
GO
/****** Object:  Default [DF__KS_UserMo__UserI__2D343BAF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserMobileLog] ADD  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_UserMo__Devic__2E285FE8]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserMobileLog] ADD  DEFAULT (0) FOR [DeviceType]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_Price_1]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_Price_1]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_Num]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_Num]  DEFAULT (0) FOR [Num]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_IsAnonymous]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_IsAnonymous]  DEFAULT (0) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_IsChangeBuy]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_IsChangeBuy]  DEFAULT (0) FOR [IsChangeBuy]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_IsBundleSale]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_IsBundleSale]  DEFAULT (0) FOR [IsBundleSale]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_IsLimitBuy]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_IsLimitBuy]  DEFAULT (0) FOR [IsLimitBuy]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_LimitBuyTaskID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_LimitBuyTaskID]  DEFAULT (0) FOR [LimitBuyTaskID]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_AttrID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_AttrID]  DEFAULT (0) FOR [AttrID]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_flag]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_flag]  DEFAULT (0) FOR [flag]
GO
/****** Object:  Default [DF__KS_ProSho__IsToP__22B6AD3C]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  DEFAULT (0) FOR [IsToPay]
GO
/****** Object:  Default [DF__KS_ProGro__InfoI__41062A32]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_ProGro__UserI__41FA4E6B]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_ProGro__Price__42EE72A4]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF__KS_ProGro__Payme__43E296DD]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [PaymentPlatId]
GO
/****** Object:  Default [DF__KS_ProGro__goods__44D6BB16]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [goodsmoney]
GO
/****** Object:  Default [DF__KS_ProGro__Order__45CADF4F]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [OrderNowPrice]
GO
/****** Object:  Default [DF__KS_ProGro__Order__46BF0388]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [OrderTotalPrice]
GO
/****** Object:  Default [DF__KS_ProGro__PayDi__47B327C1]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [PayDiscountMoney]
GO
/****** Object:  Default [DF__KS_ProGro__SaveM__48A74BFA]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [SaveMoney]
GO
/****** Object:  Default [DF__KS_ProGro__Islea__499B7033]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [Isleader]
GO
/****** Object:  Default [DF__KS_ProGro__JoinT__4A8F946C]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [JoinTimes]
GO
/****** Object:  Default [DF__KS_ProGro__JoinN__4B83B8A5]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [JoinNumber]
GO
/****** Object:  Default [DF__KS_ProGro__NowNu__4C77DCDE]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [NowNum]
GO
/****** Object:  Default [DF__KS_ProGro__Statu__4D6C0117]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_ProGro__NowSt__4E602550]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [NowStatus]
GO
/****** Object:  Default [DF__KS_ProGro__IsWin__4F544989]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [IsWin]
GO
/****** Object:  Default [DF__KS_ProGro__Deliv__50486DC2]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [DeliverID]
GO
/****** Object:  Default [DF__KS_ProGro__Deliv__513C91FB]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [DeliverStatus]
GO
/****** Object:  Default [DF__KS_ProGro__Consu__5230B634]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [ConsumptionMode]
GO
/****** Object:  Default [DF__KS_ProGro__IsCmt__5324DA6D]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [IsCmt]
GO
/****** Object:  Default [DF__KS_ProGro__Istip__5418FEA6]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [Istips]
GO
/****** Object:  Default [DF__KS_ProGro__chang__550D22DF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [changeints]
GO
/****** Object:  Default [DF__KS_ProGro__IsEnd__56014718]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneOrder] ADD  DEFAULT (0) FOR [IsEnd]
GO
/****** Object:  Default [DF_KS_BBSTable_IsDefault]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BBSTable] ADD  CONSTRAINT [DF_KS_BBSTable_IsDefault]  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF_KS_BBSTable_IsSys]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BBSTable] ADD  CONSTRAINT [DF_KS_BBSTable_IsSys]  DEFAULT (0) FOR [IsSys]
GO
/****** Object:  Default [DF_KS_WeixinMenu_ParentID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinMenu] ADD  CONSTRAINT [DF_KS_WeixinMenu_ParentID]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF_KS_WeixinMenu_OrderID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinMenu] ADD  CONSTRAINT [DF_KS_WeixinMenu_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_WeixinMenu_TypeFlag]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinMenu] ADD  CONSTRAINT [DF_KS_WeixinMenu_TypeFlag]  DEFAULT (0) FOR [TypeFlag]
GO
/****** Object:  Default [DF__KS_Vote__BeginDa__19AACF41]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF__KS_Vote__BeginDa__19AACF41]  DEFAULT (getdate()) FOR [BeginDate]
GO
/****** Object:  Default [DF__KS_Vote__ExpireD__1A9EF37A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF__KS_Vote__ExpireD__1A9EF37A]  DEFAULT (getdate()) FOR [ExpireDate]
GO
/****** Object:  Default [DF__KS_Vote__VoteTyp__1B9317B3]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF__KS_Vote__VoteTyp__1B9317B3]  DEFAULT (0) FOR [VoteType]
GO
/****** Object:  Default [DF__KS_Vote__LimitIP__1C873BEC]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF__KS_Vote__LimitIP__1C873BEC]  DEFAULT (0) FOR [LimitIP]
GO
/****** Object:  Default [DF__KS_Vote__UserTF__1D7B6025]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF__KS_Vote__UserTF__1D7B6025]  DEFAULT (0) FOR [UserTF]
GO
/****** Object:  Default [DF_KS_Vote_ItemID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF_KS_Vote_ItemID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_Vote_VoteScore]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF_KS_Vote_VoteScore]  DEFAULT (0) FOR [VoteScore]
GO
/****** Object:  Default [DF_KS_WeixinMsg_CreateTime]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinMsg] ADD  CONSTRAINT [DF_KS_WeixinMsg_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  Default [DF_KS_WeixinMsg_AddTime]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinMsg] ADD  CONSTRAINT [DF_KS_WeixinMsg_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_KS_WeixinMsg_ReplyTime]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinMsg] ADD  CONSTRAINT [DF_KS_WeixinMsg_ReplyTime]  DEFAULT (getdate()) FOR [ReplyTime]
GO
/****** Object:  Default [DF_KS_WeixinMsg_IsRead]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinMsg] ADD  CONSTRAINT [DF_KS_WeixinMsg_IsRead]  DEFAULT (0) FOR [IsRead]
GO
/****** Object:  Default [DF_KS_ProDelivery_CorpId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_CorpId]  DEFAULT (0) FOR [CorpId]
GO
/****** Object:  Default [DF_KS_ProDelivery_FreightType]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_FreightType]  DEFAULT (0) FOR [FreightType]
GO
/****** Object:  Default [DF_KS_ProDelivery_Freight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_Freight]  DEFAULT (0) FOR [Freight]
GO
/****** Object:  Default [DF_KS_ProDelivery_FirstHeavy]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_FirstHeavy]  DEFAULT (0) FOR [FirstHeavy]
GO
/****** Object:  Default [DF_KS_ProDelivery_ContinueHeavy]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ContinueHeavy]  DEFAULT (0) FOR [ContinueHeavy]
GO
/****** Object:  Default [DF_KS_ProDelivery_FirstFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_FirstFreight]  DEFAULT (0) FOR [FirstFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_ContinueFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ContinueFreight]  DEFAULT (0) FOR [ContinueFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_LimitFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_LimitFreight]  DEFAULT (0) FOR [LimitFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_ChargeType]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ChargeType]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF_KS_ProDelivery_PromotionType]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_PromotionType]  DEFAULT (0) FOR [PromotionType]
GO
/****** Object:  Default [DF_KS_ProDelivery_Freight2]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_Freight2]  DEFAULT (0) FOR [Freight2]
GO
/****** Object:  Default [DF_KS_ProDelivery_Status]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProDelivery_OrderID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_ProDelivery_IsDefault]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_IsDefault]  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF_KS_ProDelivery_CityFirstFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_CityFirstFreight]  DEFAULT (0) FOR [CityFirstFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_CityContinueFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_CityContinueFreight]  DEFAULT (0) FOR [CityContinueFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_CityLimitFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_CityLimitFreight]  DEFAULT (0) FOR [CityLimitFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_CityIsCod]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_CityIsCod]  DEFAULT (0) FOR [CityIsCod]
GO
/****** Object:  Default [DF_KS_ProDelivery_IsCityTF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_IsCityTF]  DEFAULT (0) FOR [IsCityTF]
GO
/****** Object:  Default [DF_KS_ProDelivery_ProvinceFirstFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ProvinceFirstFreight]  DEFAULT (0) FOR [ProvinceFirstFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_ProvinceContinueFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ProvinceContinueFreight]  DEFAULT (0) FOR [ProvinceContinueFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_ProvinceIsCod]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ProvinceIsCod]  DEFAULT (0) FOR [ProvinceIsCod]
GO
/****** Object:  Default [DF_KS_ProDelivery_IsProvinceTF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_IsProvinceTF]  DEFAULT (0) FOR [IsProvinceTF]
GO
/****** Object:  Default [DF_KS_ProDelivery_IsZT]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_IsZT]  DEFAULT (0) FOR [IsZT]
GO
/****** Object:  Default [DF__KS_ProDel__OneWe__23AAD175]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  DEFAULT (0) FOR [OneWeight]
GO
/****** Object:  Default [DF__KS_ProDel__IsFre__6855017D]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDelivery] ADD  DEFAULT (0) FOR [IsFreightFree]
GO
/****** Object:  Default [DF_KS_BBSRank_IsSys]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BBSRank] ADD  CONSTRAINT [DF_KS_BBSRank_IsSys]  DEFAULT (0) FOR [IsSys]
GO
/****** Object:  Default [DF_KS_BBSRank_Score]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BBSRank] ADD  CONSTRAINT [DF_KS_BBSRank_Score]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF_KS_BBSRank_QueNum]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BBSRank] ADD  CONSTRAINT [DF_KS_BBSRank_QueNum]  DEFAULT (0) FOR [TopicNum]
GO
/****** Object:  Default [DF_KS_BBSRank_AnsNum]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BBSRank] ADD  CONSTRAINT [DF_KS_BBSRank_AnsNum]  DEFAULT (0) FOR [PostNum]
GO
/****** Object:  Default [DF__KS_Weixin__UserI__61DD0E18]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinOnlineMessage] ADD  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_Weixin__IsRep__62D13251]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinOnlineMessage] ADD  DEFAULT (0) FOR [IsReply]
GO
/****** Object:  Default [DF__KS_Weixin__Verif__63C5568A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinOnlineMessage] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_WeixinUser_WeiXinType]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinUser] ADD  CONSTRAINT [DF_KS_WeixinUser_WeiXinType]  DEFAULT (0) FOR [WeiXinType]
GO
/****** Object:  Default [DF_KS_WeixinUser_Verify]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinUser] ADD  CONSTRAINT [DF_KS_WeixinUser_Verify]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_WeixinUser_Access_YouXRQ]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinUser] ADD  CONSTRAINT [DF_KS_WeixinUser_Access_YouXRQ]  DEFAULT (getdate()) FOR [Access_YouXRQ]
GO
/****** Object:  Default [DF_KS_WeixinUser_WeiXinStatus]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinUser] ADD  CONSTRAINT [DF_KS_WeixinUser_WeiXinStatus]  DEFAULT (0) FOR [WeiXinStatus]
GO
/****** Object:  Default [DF_KS_WeixinUser_TypeFlag]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinUser] ADD  CONSTRAINT [DF_KS_WeixinUser_TypeFlag]  DEFAULT (0) FOR [TypeFlag]
GO
/****** Object:  Default [DF__KS_UserLo__UserI__2963AACB]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserLoginLog] ADD  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_UserLo__login__2A57CF04]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserLoginLog] ADD  DEFAULT (0) FOR [loginFrom]
GO
/****** Object:  Default [DF__KS_UserLo__Devic__2B4BF33D]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserLoginLog] ADD  DEFAULT (0) FOR [DeviceType]
GO
/****** Object:  Default [DF_KS_WeixinKeyWord_IsKeyWord]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinKeyWord] ADD  CONSTRAINT [DF_KS_WeixinKeyWord_IsKeyWord]  DEFAULT (0) FOR [IsKeyWord]
GO
/****** Object:  Default [DF_KS_WeixinKeyWord_Type]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinKeyWord] ADD  CONSTRAINT [DF_KS_WeixinKeyWord_Type]  DEFAULT (0) FOR [Type]
GO
/****** Object:  Default [DF_KS_WeixinKeyWord_Picmsg]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinKeyWord] ADD  CONSTRAINT [DF_KS_WeixinKeyWord_Picmsg]  DEFAULT (0) FOR [Picmsg]
GO
/****** Object:  Default [DF_KS_WeixinKeyWord_AddTime]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinKeyWord] ADD  CONSTRAINT [DF_KS_WeixinKeyWord_AddTime]  DEFAULT (getdate()) FOR [AddTime]
GO
/****** Object:  Default [DF_KS_WeixinKeyWord_Hits]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinKeyWord] ADD  CONSTRAINT [DF_KS_WeixinKeyWord_Hits]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF_KS_WeixinKeyWord_TypeFlag]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinKeyWord] ADD  CONSTRAINT [DF_KS_WeixinKeyWord_TypeFlag]  DEFAULT (0) FOR [TypeFlag]
GO
/****** Object:  Default [DF__KS_Weixin__Templ__6C5A9C8B]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinTemplate] ADD  DEFAULT (0) FOR [TemplateType]
GO
/****** Object:  Default [DF__KS_Weixin__IsDef__6D4EC0C4]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinTemplate] ADD  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF_KS_ADClass_OrderId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ADClass] ADD  CONSTRAINT [DF_KS_ADClass_OrderId]  DEFAULT (0) FOR [OrderId]
GO
/****** Object:  Default [DF__KS_UserGr__Group__1209AD79]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__Group__1209AD79]  DEFAULT (0) FOR [GroupID]
GO
/****** Object:  Default [DF__KS_UserGro__Type__12FDD1B2]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGro__Type__12FDD1B2]  DEFAULT (0) FOR [Type]
GO
/****** Object:  Default [DF__KS_UserGr__Charg__13F1F5EB]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__Charg__13F1F5EB]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF__KS_UserGr__Group__14E61A24]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__Group__14E61A24]  DEFAULT (0) FOR [GroupPoint]
GO
/****** Object:  Default [DF__KS_UserGr__Valid__15DA3E5D]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__Valid__15DA3E5D]  DEFAULT (0) FOR [ValidDays]
GO
/****** Object:  Default [DF__KS_UserGr__FormI__16CE6296]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__FormI__16CE6296]  DEFAULT (0) FOR [FormID]
GO
/****** Object:  Default [DF__KS_UserGr__IsReg__17C286CF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__IsReg__17C286CF]  DEFAULT (0) FOR [IsReg]
GO
/****** Object:  Default [DF_KS_UserGroup_SpaceSize]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF_KS_UserGroup_SpaceSize]  DEFAULT (0) FOR [SpaceSize]
GO
/****** Object:  Default [DF_KS_UserGroup_OrderID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF_KS_UserGroup_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_UserGroup_IsGroupPrice]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF_KS_UserGroup_IsGroupPrice]  DEFAULT (0) FOR [IsGroupPrice]
GO
/****** Object:  Default [DF_KS_AskClass_ParentID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_ParentID]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF_KS_AskClass_Root]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_Root]  DEFAULT (0) FOR [Root]
GO
/****** Object:  Default [DF_KS_AskClass_Depth]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_Depth]  DEFAULT (0) FOR [Depth]
GO
/****** Object:  Default [DF_KS_AskClass_OrderID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_AskClass_Child]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_Child]  DEFAULT (0) FOR [Child]
GO
/****** Object:  Default [DF_KS_AskClass_PrevID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_PrevID]  DEFAULT (0) FOR [PrevID]
GO
/****** Object:  Default [DF_KS_AskClass_NextID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_NextID]  DEFAULT (0) FOR [NextID]
GO
/****** Object:  Default [DF_KS_AskClass_AddDate]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_AskClass_ShowInTop]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_ShowInTop]  DEFAULT (0) FOR [ShowInTop]
GO
/****** Object:  Default [DF__KS_Weixin__Class__6E42E4FD]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WeixinTemplateClass] ADD  DEFAULT (0) FOR [ClassType]
GO
/****** Object:  Default [DF_KS_Special_ClassID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_Special_Recommend]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_Special_SpecialPurView]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_SpecialPurView]  DEFAULT (0) FOR [SpecialPurView]
GO
/****** Object:  Default [DF_KS_Special_ReadPoint]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_ReadPoint]  DEFAULT (0) FOR [ReadPoint]
GO
/****** Object:  Default [DF_KS_Special_ChargeType]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_ChargeType]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF_KS_Special_PitchTime]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_PitchTime]  DEFAULT (0) FOR [PitchTime]
GO
/****** Object:  Default [DF_KS_Special_ReadTimes]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_ReadTimes]  DEFAULT (0) FOR [ReadTimes]
GO
/****** Object:  Default [DF_KS_Special_Hits]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_Hits]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF_KS_ProCouponUser_CouponId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProCouponUser] ADD  CONSTRAINT [DF_KS_ProCouponUser_CouponId]  DEFAULT (0) FOR [CouponId]
GO
/****** Object:  Default [DF_KS_ProCouponUser_UseFlag]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProCouponUser] ADD  CONSTRAINT [DF_KS_ProCouponUser_UseFlag]  DEFAULT (0) FOR [UseFlag]
GO
/****** Object:  Default [DF_KS_ProCouponUser_AvailableMoney]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProCouponUser] ADD  CONSTRAINT [DF_KS_ProCouponUser_AvailableMoney]  DEFAULT (0) FOR [AvailableMoney]
GO
/****** Object:  Default [DF__KS_ProCou__IsExt__1DF1F81F]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProCouponUser] ADD  DEFAULT (0) FOR [IsExtend]
GO
/****** Object:  Default [DF_KS_BlogTemplate_Sharetag]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BlogTemplate] ADD  CONSTRAINT [DF_KS_BlogTemplate_Sharetag]  DEFAULT (0) FOR [Sharetag]
GO
/****** Object:  Default [DF_KS_BlogTemplate_UserTag]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BlogTemplate] ADD  CONSTRAINT [DF_KS_BlogTemplate_UserTag]  DEFAULT (0) FOR [UserTag]
GO
/****** Object:  Default [DF__KS_Adboar__AdRat__76CBA758]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Adboard] ADD  DEFAULT (0) FOR [AdRate]
GO
/****** Object:  Default [DF__KS_Adboar__Maxad__77BFCB91]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Adboard] ADD  DEFAULT (0) FOR [Maxads]
GO
/****** Object:  Default [DF__KS_Adboar__Statu__78B3EFCA]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Adboard] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_Adboard_ClassID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Adboard] ADD  CONSTRAINT [DF_KS_Adboard_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_AskZJ_userid]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_userid]  DEFAULT (0) FOR [userid]
GO
/****** Object:  Default [DF_KS_AskZJ_ProvinceId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_ProvinceId]  DEFAULT (0) FOR [ProvinceId]
GO
/****** Object:  Default [DF_KS_AskZJ_CityId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_CityId]  DEFAULT (0) FOR [CityId]
GO
/****** Object:  Default [DF_KS_AskZJ_CountyId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_CountyId]  DEFAULT (0) FOR [CountyId]
GO
/****** Object:  Default [DF_KS_AskZJ_TypeID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_TypeID]  DEFAULT (0) FOR [TypeID]
GO
/****** Object:  Default [DF_KS_AskZJ_AddDate]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_AskZJ_Status]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_Status]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_AskZJ_Recommend]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_AskZJ_AskDoneNum]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_AskDoneNum]  DEFAULT (0) FOR [AskNum]
GO
/****** Object:  Default [DF_KS_AskZJ_BestNum]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_BestNum]  DEFAULT (0) FOR [BestNum]
GO
/****** Object:  Default [DF_KS_AskZJ_BigClassID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_BigClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_AskZJ_istop]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_istop]  DEFAULT (0) FOR [istop]
GO
/****** Object:  Default [DF_KS_ProAsk_ProID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProAsk] ADD  CONSTRAINT [DF_KS_ProAsk_ProID]  DEFAULT (0) FOR [ProID]
GO
/****** Object:  Default [DF__KS_ProAsk__Produ__6FF62345]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProAsk] ADD  DEFAULT (0) FOR [ProductType]
GO
/****** Object:  Default [DF__KS_Favori__Chann__787EE5A0]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Favorite] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_Favori__InfoI__797309D9]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Favorite] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_ProFig__BigCl__788B6946]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [BigClassID]
GO
/****** Object:  Default [DF__KS_ProFig__Class__797F8D7F]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_ProFig__Locke__7A73B1B8]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [Locked]
GO
/****** Object:  Default [DF__KS_ProFig__EndTF__7B67D5F1]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [EndTF]
GO
/****** Object:  Default [DF__KS_ProFig__Allow__7C5BFA2A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [AllowBMFlag]
GO
/****** Object:  Default [DF__KS_ProFig__minnu__7D501E63]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [minnum]
GO
/****** Object:  Default [DF__KS_ProFig__IsSuc__7E44429C]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [IsSuccess]
GO
/****** Object:  Default [DF__KS_ProFig__Fight__7F3866D5]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [FightGroupNum]
GO
/****** Object:  Default [DF__KS_ProFig__Price__002C8B0E]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [Price_Original]
GO
/****** Object:  Default [DF__KS_ProFig__Fight__0120AF47]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [FightGroupPrice]
GO
/****** Object:  Default [DF__KS_ProFig__Singl__0214D380]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [SinglePrice]
GO
/****** Object:  Default [DF__KS_ProFig__Weigh__0308F7B9]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [Weight]
GO
/****** Object:  Default [DF__KS_ProFig__Limit__03FD1BF2]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [LimitBuyNum]
GO
/****** Object:  Default [DF__KS_ProFig__Recom__04F1402B]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF__KS_ProFig__Provi__05E56464]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF__KS_ProFig__CityI__06D9889D]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_ProFig__HasSe__07CDACD6]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [HasSellNum]
GO
/****** Object:  Default [DF__KS_ProFig__RealS__08C1D10F]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [RealSellNum]
GO
/****** Object:  Default [DF__KS_ProFig__Clean__09B5F548]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [CleanCart]
GO
/****** Object:  Default [DF__KS_ProFig__ShowD__0AAA1981]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [ShowDelivery]
GO
/****** Object:  Default [DF__KS_ProFig__ShowP__0B9E3DBA]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [ShowPayMent]
GO
/****** Object:  Default [DF__KS_ProFig__Comme__0C9261F3]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [Comment]
GO
/****** Object:  Default [DF__KS_ProFig__IsBus__0D86862C]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [IsBusiness]
GO
/****** Object:  Default [DF__KS_ProFig__Freig__0E7AAA65]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [FreightType]
GO
/****** Object:  Default [DF__KS_ProFig__Freig__0F6ECE9E]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [Freight]
GO
/****** Object:  Default [DF__KS_ProFig__Amoun__1062F2D7]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF__KS_ProFig__Amoun__11571710]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [AmountNum]
GO
/****** Object:  Default [DF__KS_ProFig__PayID__124B3B49]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [PayID]
GO
/****** Object:  Default [DF__KS_ProFig__FavNu__133F5F82]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [FavNum]
GO
/****** Object:  Default [DF__KS_ProFig__CmtNu__143383BB]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProFightGroup] ADD  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF_KS_ClassBrand_OrderID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBrand] ADD  CONSTRAINT [DF_KS_ClassBrand_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_ClassBrand_ShowInTop]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBrand] ADD  CONSTRAINT [DF_KS_ClassBrand_ShowInTop]  DEFAULT (0) FOR [ShowInTop]
GO
/****** Object:  Default [DF_KS_ClassBrand_Recommend]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBrand] ADD  CONSTRAINT [DF_KS_ClassBrand_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_ProBrand_num]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBrand] ADD  CONSTRAINT [DF_KS_ProBrand_num]  DEFAULT (0) FOR [num]
GO
/****** Object:  Default [DF_KS_AskTopic_classid]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_classid]  DEFAULT (0) FOR [classid]
GO
/****** Object:  Default [DF_KS_AskTopic_UserId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_UserId]  DEFAULT (0) FOR [UserId]
GO
/****** Object:  Default [DF_KS_AskTopic_AddDate]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_AskTopic_Status]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_Status]  DEFAULT (0) FOR [verify]
GO
/****** Object:  Default [DF_KS_AskTopic_IsSolve]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_IsSolve]  DEFAULT (0) FOR [IsSolve]
GO
/****** Object:  Default [DF_KS_AskTopic_IsTop]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_IsTop]  DEFAULT (0) FOR [IsTop]
GO
/****** Object:  Default [DF_KS_AskTopic_Reward]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_Reward]  DEFAULT (0) FOR [Reward]
GO
/****** Object:  Default [DF_KS_AskTopic_Hits]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_Hits]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF_KS_AskTopic_PostNum]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_PostNum]  DEFAULT (0) FOR [PostNum]
GO
/****** Object:  Default [DF_KS_AskTopic_Recommend]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_AskTopic_AskUserID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_AskUserID]  DEFAULT (0) FOR [AskUserID]
GO
/****** Object:  Default [DF_KS_BBSTopic_boardId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BBSTopic] ADD  CONSTRAINT [DF_KS_BBSTopic_boardId]  DEFAULT (0) FOR [boardId]
GO
/****** Object:  Default [DF_KS_BBSTopic_UserId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BBSTopic] ADD  CONSTRAINT [DF_KS_BBSTopic_UserId]  DEFAULT (0) FOR [UserId]
GO
/****** Object:  Default [DF__KS_Model__ModelS__43D61337]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__ModelS__43D61337]  DEFAULT (0) FOR [ModelStatus]
GO
/****** Object:  Default [DF__KS_Model__FsoLis__44CA3770]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__FsoLis__44CA3770]  DEFAULT (2) FOR [FsoListNum]
GO
/****** Object:  Default [DF_KS_Model_SeoOption]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF_KS_Model_SeoOption]  DEFAULT (0) FOR [SeoOption]
GO
/****** Object:  Default [DF__KS_Model__Charge__45BE5BA9]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Charge__45BE5BA9]  DEFAULT (0) FOR [ChargesOption]
GO
/****** Object:  Default [DF__KS_Model__Attrib__46B27FE2]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Attrib__46B27FE2]  DEFAULT (0) FOR [AttributeOption]
GO
/****** Object:  Default [DF__KS_Model__Receip__47A6A41B]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Receip__47A6A41B]  DEFAULT (0) FOR [ReceiptOption]
GO
/****** Object:  Default [DF_KS_Model_PKOption]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF_KS_Model_PKOption]  DEFAULT (0) FOR [PKOption]
GO
/****** Object:  Default [DF__KS_Model__BasicT__489AC854]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__BasicT__489AC854]  DEFAULT (0) FOR [BasicType]
GO
/****** Object:  Default [DF__KS_Model__AdminU__498EEC8D]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__AdminU__498EEC8D]  DEFAULT (1) FOR [AdminUpFilesTF]
GO
/****** Object:  Default [DF__KS_Model__UserUp__4A8310C6]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__UserUp__4A8310C6]  DEFAULT (0) FOR [UserUpFilesTF]
GO
/****** Object:  Default [DF__KS_Model__AllowU__4B7734FF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__AllowU__4B7734FF]  DEFAULT (0) FOR [AllowUpFilesSize]
GO
/****** Object:  Default [DF__KS_Model__AllowP__4C6B5938]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__AllowP__4C6B5938]  DEFAULT (0) FOR [AllowPublication]
GO
/****** Object:  Default [DF_KS_Model_RecycleBin]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF_KS_Model_RecycleBin]  DEFAULT (0) FOR [RecycleBin]
GO
/****** Object:  Default [DF__KS_Model__Public__4D5F7D71]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Public__4D5F7D71]  DEFAULT (0) FOR [PublicationVerify]
GO
/****** Object:  Default [DF_KS_Model_PublicationModifyVerify]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF_KS_Model_PublicationModifyVerify]  DEFAULT (0) FOR [PublicationModifyVerify]
GO
/****** Object:  Default [DF__KS_Model__Commen__4E53A1AA]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Commen__4E53A1AA]  DEFAULT (0) FOR [CommentType]
GO
/****** Object:  Default [DF__KS_Model__Commen__4F47C5E3]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Commen__4F47C5E3]  DEFAULT (0) FOR [CommentLen]
GO
/****** Object:  Default [DF__KS_Model__Newest__503BEA1C]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Newest__503BEA1C]  DEFAULT (0) FOR [NewestDay]
GO
/****** Object:  Default [DF__KS_Model__FsoHtm__51300E55]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__FsoHtm__51300E55]  DEFAULT (1) FOR [FsoHtmlType]
GO
/****** Object:  Default [DF__KS_Model__DiggBy__5224328E]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__DiggBy__5224328E]  DEFAULT (0) FOR [DiggByVisitor]
GO
/****** Object:  Default [DF__KS_Model__DiggRe__531856C7]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__DiggRe__531856C7]  DEFAULT (0) FOR [DiggRepeat]
GO
/****** Object:  Default [DF__KS_Model__DiggPe__540C7B00]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__DiggPe__540C7B00]  DEFAULT (0) FOR [DiggPerTimes]
GO
/****** Object:  Default [DF_KS_Model_OrderId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF_KS_Model_OrderId]  DEFAULT (0) FOR [ModelOrderId]
GO
/****** Object:  Default [DF_KS_SpecialClass_AddDate]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_SpecialClass] ADD  CONSTRAINT [DF_KS_SpecialClass_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_SpecialClass_OrderID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_SpecialClass] ADD  CONSTRAINT [DF_KS_SpecialClass_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_LabelC__Paren__236943A5]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LabelClass] ADD  CONSTRAINT [DF__KS_LabelC__Paren__236943A5]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF_KS_LabelClass_From3G]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LabelClass] ADD  CONSTRAINT [DF_KS_LabelClass_From3G]  DEFAULT (0) FOR [From3G]
GO
/****** Object:  Default [DF__KS_LabelC__Templ__192D4302]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LabelClass] ADD  DEFAULT (0) FOR [TemplateID]
GO
/****** Object:  Default [DF_KS_Label_ClassID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Label] ADD  CONSTRAINT [DF_KS_Label_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_Label__Templa__18391EC9]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Label] ADD  DEFAULT (0) FOR [TemplateID]
GO
/****** Object:  Default [DF__KS_ProCou__Defau__3010A85A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProCouponMessage] ADD  DEFAULT (0) FOR [DefaultNum]
GO
/****** Object:  Default [DF__KS_ProCou__MsgWa__3104CC93]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProCouponMessage] ADD  DEFAULT (0) FOR [MsgWarnType]
GO
/****** Object:  Default [DF__KS_InfoCh__Chann__0B91BA14]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF__KS_InfoCh__Chann__0B91BA14]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_InfoList_HitsByDay]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_HitsByDay]  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF_KS_InfoList_HitsByWeek]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_HitsByWeek]  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF_KS_InfoList_HitsByMonth]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_HitsByMonth]  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF_KS_InfoList_LastHitsTime]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_LastHitsTime]  DEFAULT (getdate()) FOR [LastHitsTime]
GO
/****** Object:  Default [DF_KS_InfoList_RefreshTF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_RefreshTF]  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF_KS_InfoList_ShowOn3G]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_ShowOn3G]  DEFAULT (0) FOR [ShowOn3G]
GO
/****** Object:  Default [DF_KS_InfoList_ProID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_ProID]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF_KS_InfoList_CityID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_InfoList_CountyID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_CountyID]  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF_KS_InfoList_Verify]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_Verify]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_InfoCh__InfoP__0D7A0286]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF__KS_InfoCh__InfoP__0D7A0286]  DEFAULT (0) FOR [InfoPurview]
GO
/****** Object:  Default [DF__KS_InfoCh__ArrGr__0E6E26BF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF__KS_InfoCh__ArrGr__0E6E26BF]  DEFAULT ('0') FOR [ArrGroupID]
GO
/****** Object:  Default [DF__KS_InfoCh__ReadP__0F624AF8]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF__KS_InfoCh__ReadP__0F624AF8]  DEFAULT (0) FOR [ReadPoint]
GO
/****** Object:  Default [DF__KS_InfoCh__Charg__10566F31]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF__KS_InfoCh__Charg__10566F31]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF__KS_InfoCh__Pitch__114A936A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF__KS_InfoCh__Pitch__114A936A]  DEFAULT (24) FOR [PitchTime]
GO
/****** Object:  Default [DF__KS_InfoCh__ReadT__123EB7A3]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF__KS_InfoCh__ReadT__123EB7A3]  DEFAULT (10) FOR [ReadTimes]
GO
/****** Object:  Default [DF__KS_InfoCh__Divid__1332DBDC]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF__KS_InfoCh__Divid__1332DBDC]  DEFAULT (0) FOR [DividePercent]
GO
/****** Object:  Default [DF_KS_InfoList_PKID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_PKID]  DEFAULT (0) FOR [PKID]
GO
/****** Object:  Default [DF_KS_InfoList_VoteID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_VoteID]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF_KS_InfoList_CMTNum]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_CMTNum]  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF_KS_InfoList_DelTF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_DelTF]  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF_KS_InfoList_AttachmentCharge]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_AttachmentCharge]  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF_KS_InfoList_AttachmentChargeOnce]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_AttachmentChargeOnce]  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF_KS_InfoList_SocialIDs]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_SocialIDs]  DEFAULT (0) FOR [SocialIDs]
GO
/****** Object:  Default [DF_KS_InfoList_IsTips]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_IsTips]  DEFAULT (0) FOR [IsTips]
GO
/****** Object:  Default [DF__KS_InfoLi__GoodN__75E406C5]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  DEFAULT (0) FOR [GoodNum]
GO
/****** Object:  Default [DF__KS_InfoLi__BadNu__76D82AFE]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  DEFAULT (0) FOR [BadNum]
GO
/****** Object:  Default [DF__KS_InfoLi__FavNu__77CC4F37]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  DEFAULT (0) FOR [FavNum]
GO
/****** Object:  Default [DF__KS_InfoLi__Share__78C07370]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_InfoList] ADD  DEFAULT (0) FOR [ShareNum]
GO
/****** Object:  Default [DF_KS_ProOrder_PayDiscountMoney]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_PayDiscountMoney]  DEFAULT (0) FOR [PayDiscountMoney]
GO
/****** Object:  Default [DF_KS_ProOrder_Invoiced]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_Invoiced]  DEFAULT (0) FOR [IsInvoice]
GO
/****** Object:  Default [DF_KS_ProOrder_Invoiced_1]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_Invoiced_1]  DEFAULT (0) FOR [Invoiced]
GO
/****** Object:  Default [DF_KS_ProOrder_MoneyReceipt]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_MoneyReceipt]  DEFAULT (0) FOR [MoneyReceipt]
GO
/****** Object:  Default [DF_KS_ProOrder_Score]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_Score]  DEFAULT (0) FOR [OrderScore]
GO
/****** Object:  Default [DF_KS_ProOrder_ScoreTF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_ScoreTF]  DEFAULT (0) FOR [ScoreTF]
GO
/****** Object:  Default [DF_KS_ProOrder_ProvinceID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_ProvinceID]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF_KS_ProOrder_CityID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_ProOrder_CountyID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_CountyID]  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF_KS_ProOrder_DeliverStatus]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_DeliverStatus]  DEFAULT (0) FOR [DeliverStatus]
GO
/****** Object:  Default [DF_KS_ProOrder_IsAnonymous]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_IsAnonymous]  DEFAULT (0) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_KS_ProOrder_PaymentPlatId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_PaymentPlatId]  DEFAULT (0) FOR [PaymentPlatId]
GO
/****** Object:  Default [DF_KS_ProOrder_PayStatus]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_PayStatus]  DEFAULT (0) FOR [PayStatus]
GO
/****** Object:  Default [DF_KS_ProOrder_OrderType]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_OrderType]  DEFAULT (0) FOR [OrderType]
GO
/****** Object:  Default [DF_KS_ProOrder_SmsNum]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_SmsNum]  DEFAULT (0) FOR [SmsNum]
GO
/****** Object:  Default [DF_KS_ProOrder_IsTips]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_IsTips]  DEFAULT (0) FOR [IsTips]
GO
/****** Object:  Default [DF_KS_ProOrder_ChangeScore]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_ChangeScore]  DEFAULT (0) FOR [ChangeScore]
GO
/****** Object:  Default [DF_KS_ProOrder_IsBusinessConfirm]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_IsBusinessConfirm]  DEFAULT (0) FOR [IsBusinessConfirm]
GO
/****** Object:  Default [DF_KS_ProOrder_IsBusiness]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_IsBusiness]  DEFAULT (0) FOR [IsBusiness]
GO
/****** Object:  Default [DF_KS_ProOrder_FrontMoney]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_FrontMoney]  DEFAULT (0) FOR [FrontMoney]
GO
/****** Object:  Default [DF_KS_ProOrder_SaveMoney]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_SaveMoney]  DEFAULT (0) FOR [SaveMoney]
GO
/****** Object:  Default [DF_KS_ProOrder_PayID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_PayID]  DEFAULT (0) FOR [PayID]
GO
/****** Object:  Default [DF_KS_ProOrder_StoreID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_StoreID]  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF_KS_ProOrder_OrderDevice]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_OrderDevice]  DEFAULT (0) FOR [OrderDevice]
GO
/****** Object:  Default [DF__KS_ProOrd__Coupo__1EE61C58]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [CouponUserID1]
GO
/****** Object:  Default [DF__KS_ProOrd__UseRe__1FDA4091]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [UseRedPacketMoney]
GO
/****** Object:  Default [DF__KS_ProOrd__IsRec__20CE64CA]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [IsReceivExtended]
GO
/****** Object:  Default [DF__KS_ProOrd__UserI__21C28903]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_ProOrd__Expre__70EA477E]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [ExpressCorpId]
GO
/****** Object:  Default [DF__KS_ProOrd__IsLea__71DE6BB7]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [IsLeader]
GO
/****** Object:  Default [DF__KS_ProOrd__JoinN__72D28FF0]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [JoinNum]
GO
/****** Object:  Default [DF__KS_ProOrd__GoupN__73C6B429]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [GoupNum]
GO
/****** Object:  Default [DF__KS_ProOrd__IsEnd__74BAD862]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [IsEnd]
GO
/****** Object:  Default [DF_KS_LogPoint_OrderID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF_KS_LogPoint_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_LogPoi__Chann__37703C52]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF__KS_LogPoi__Chann__37703C52]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_LogPoi__InfoI__3864608B]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF__KS_LogPoi__InfoI__3864608B]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_LogPoi__InOrO__395884C4]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF__KS_LogPoi__InOrO__395884C4]  DEFAULT (0) FOR [InOrOutFlag]
GO
/****** Object:  Default [DF__KS_LogPoi__Point__3A4CA8FD]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF__KS_LogPoi__Point__3A4CA8FD]  DEFAULT (0) FOR [Point]
GO
/****** Object:  Default [DF_KS_LogPoint_NowPoint]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF_KS_LogPoint_NowPoint]  DEFAULT (0) FOR [NowPoint]
GO
/****** Object:  Default [DF__KS_LogPoi__Times__3B40CD36]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF__KS_LogPoi__Times__3B40CD36]  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF__KS_ProSen__Defau__32ED1505]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProSendManage] ADD  DEFAULT (0) FOR [DefaultNum]
GO
/****** Object:  Default [DF_KS_CollectionItem_ModelID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_ModelID]  DEFAULT (0) FOR [ModelID]
GO
/****** Object:  Default [DF_KS_CollectionItem_PageType]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_PageType]  DEFAULT (0) FOR [PageType]
GO
/****** Object:  Default [DF_KS_CollectionItem_PageStartID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_PageStartID]  DEFAULT (0) FOR [PageStartID]
GO
/****** Object:  Default [DF_KS_CollectionItem_PageEndID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_PageEndID]  DEFAULT (0) FOR [PageEndID]
GO
/****** Object:  Default [DF_KS_CollectionItem_AddDate]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_CollectionItem_IsCanCollect]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_IsCanCollect]  DEFAULT (0) FOR [IsCanCollect]
GO
/****** Object:  Default [DF_KS_CollectionItem_LastCollectTime]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_LastCollectTime]  DEFAULT (getdate()) FOR [LastCollectTime]
GO
/****** Object:  Default [DF_KS_CollectionItem_IsCreateHtml]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_IsCreateHtml]  DEFAULT (0) FOR [IsCreateHtml]
GO
/****** Object:  Default [DF__KS_Collec__Provi__12804573]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF__KS_Collec__CityI__137469AC]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_Collec__Count__14688DE5]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_CollectionItem] ADD  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_DownSe__DownI__6C190EBB]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__DownI__6C190EBB]  DEFAULT (0) FOR [DownID]
GO
/****** Object:  Default [DF__KS_DownSe__Chann__6D0D32F4]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__Chann__6D0D32F4]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_DownSe__rooti__6E01572D]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__rooti__6E01572D]  DEFAULT (0) FOR [rootid]
GO
/****** Object:  Default [DF__KS_DownSe__order__6EF57B66]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__order__6EF57B66]  DEFAULT (0) FOR [orders]
GO
/****** Object:  Default [DF__KS_DownSe__paren__6FE99F9F]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__paren__6FE99F9F]  DEFAULT (0) FOR [parentid]
GO
/****** Object:  Default [DF__KS_DownSe__child__70DDC3D8]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__child__70DDC3D8]  DEFAULT (0) FOR [child]
GO
/****** Object:  Default [DF__KS_DownSe__IsLoc__71D1E811]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__IsLoc__71D1E811]  DEFAULT (0) FOR [IsLock]
GO
/****** Object:  Default [DF__KS_DownSe__IsOut__72C60C4A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__IsOut__72C60C4A]  DEFAULT (0) FOR [IsOuter]
GO
/****** Object:  Default [DF__KS_DownSe__AllDo__73BA3083]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__AllDo__73BA3083]  DEFAULT (0) FOR [AllDownHits]
GO
/****** Object:  Default [DF__KS_DownSe__DayDo__74AE54BC]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__DayDo__74AE54BC]  DEFAULT (0) FOR [DayDownHits]
GO
/****** Object:  Default [DF__KS_DownSe__HitsT__75A278F5]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__HitsT__75A278F5]  DEFAULT (getdate()) FOR [HitsTime]
GO
/****** Object:  Default [DF__KS_SignIn__UserI__35C981B0]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_SignIn] ADD  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_SignIn__Statu__36BDA5E9]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_SignIn] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_SignIn__Num__37B1CA22]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_SignIn] ADD  DEFAULT (0) FOR [Num]
GO
/****** Object:  Default [DF__KS_SignIn__NumTy__38A5EE5B]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_SignIn] ADD  DEFAULT (0) FOR [NumType]
GO
/****** Object:  Default [DF__KS_SignIn__Islia__399A1294]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_SignIn] ADD  DEFAULT (0) FOR [Islianxu]
GO
/****** Object:  Default [DF_KS_ProBundleSelect_ProID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBundleSelect] ADD  CONSTRAINT [DF_KS_ProBundleSelect_ProID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_ProBundleSelect_Price]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBundleSelect] ADD  CONSTRAINT [DF_KS_ProBundleSelect_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_KS_ProBundleSelect_Num]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBundleSelect] ADD  CONSTRAINT [DF_KS_ProBundleSelect_Num]  DEFAULT (0) FOR [Num]
GO
/****** Object:  Default [DF_KS_ProBundleSelect_addDate]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBundleSelect] ADD  CONSTRAINT [DF_KS_ProBundleSelect_addDate]  DEFAULT (getdate()) FOR [addDate]
GO
/****** Object:  Default [DF_KS_ProBundleSelect_AttrID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProBundleSelect] ADD  CONSTRAINT [DF_KS_ProBundleSelect_AttrID]  DEFAULT (0) FOR [AttrID]
GO
/****** Object:  Default [DF__KS_U_Arti__InfoI__7CE47361]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__InfoI__7CE47361]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_U_Arti__Class__7DD8979A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__Class__7DD8979A]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_U_Arti__prior__230AE7A0]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__prior__230AE7A0]  DEFAULT (0) FOR [priority]
GO
/****** Object:  Default [DF__KS_U_Artic__Hits__23FF0BD9]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Artic__Hits__23FF0BD9]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_U_Arti__HitsB__24F33012]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__HitsB__24F33012]  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF__KS_U_Arti__HitsB__25E7544B]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__HitsB__25E7544B]  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF__KS_U_Arti__HitsB__26DB7884]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__HitsB__26DB7884]  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF__KS_U_Arti__VoteI__27CF9CBD]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__VoteI__27CF9CBD]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF__KS_U_Arti__ShowO__28C3C0F6]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__ShowO__28C3C0F6]  DEFAULT (0) FOR [ShowON3G]
GO
/****** Object:  Default [DF__KS_U_Arti__Refre__29B7E52F]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__Refre__29B7E52F]  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF__KS_U_Arti__Verif__2AAC0968]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__Verif__2AAC0968]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_U_Arti__DelTF__2BA02DA1]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__DelTF__2BA02DA1]  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF__KS_U_Arti__Attac__2C9451DA]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__Attac__2C9451DA]  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF__KS_U_Arti__Attac__2D887613]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__Attac__2D887613]  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF__KS_U_Arti__CityI__2E7C9A4C]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__CityI__2E7C9A4C]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_U_Arti__Count__2F70BE85]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__Count__2F70BE85]  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_U_Arti__Comme__3064E2BE]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__Comme__3064E2BE]  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF__KS_U_Arti__ProID__315906F7]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__ProID__315906F7]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF__KS_U_Arti__ReadP__324D2B30]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__ReadP__324D2B30]  DEFAULT (0) FOR [ReadPoint]
GO
/****** Object:  Default [DF__KS_U_Arti__Charg__33414F69]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__Charg__33414F69]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF__KS_U_Arti__Pitch__343573A2]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__Pitch__343573A2]  DEFAULT (0) FOR [PitchTime]
GO
/****** Object:  Default [DF__KS_U_Arti__ReadT__352997DB]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__ReadT__352997DB]  DEFAULT (0) FOR [ReadTimes]
GO
/****** Object:  Default [DF__KS_U_Arti__Divid__361DBC14]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__Divid__361DBC14]  DEFAULT (0) FOR [DividePercent]
GO
/****** Object:  Default [DF__KS_U_Artic__PKID__3711E04D]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Artic__PKID__3711E04D]  DEFAULT (0) FOR [PKID]
GO
/****** Object:  Default [DF__KS_U_Arti__InfoP__7C7B2A64]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  CONSTRAINT [DF__KS_U_Arti__InfoP__7C7B2A64]  DEFAULT (0) FOR [InfoPurview]
GO
/****** Object:  Default [DF__KS_U_Arti__GoodN__7D85288D]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [GoodNum]
GO
/****** Object:  Default [DF__KS_U_Arti__BadNu__7E794CC6]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [BadNum]
GO
/****** Object:  Default [DF__KS_U_Arti__FavNu__7F6D70FF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [FavNum]
GO
/****** Object:  Default [DF__KS_U_Arti__Share__00619538]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [ShareNum]
GO
/****** Object:  Default [DF__KS_ProGro__rooti__3870E431]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneClass] ADD  DEFAULT (0) FOR [rootid]
GO
/****** Object:  Default [DF__KS_ProGro__order__3965086A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneClass] ADD  DEFAULT (0) FOR [orders]
GO
/****** Object:  Default [DF__KS_ProGro__paren__3A592CA3]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneClass] ADD  DEFAULT (0) FOR [parentid]
GO
/****** Object:  Default [DF__KS_ProGro__child__3B4D50DC]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneClass] ADD  DEFAULT (0) FOR [child]
GO
/****** Object:  Default [DF__KS_ProGro__IsLoc__3C417515]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneClass] ADD  DEFAULT (0) FOR [IsLock]
GO
/****** Object:  Default [DF__KS_ProGro__InfoN__3D35994E]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneClass] ADD  DEFAULT (0) FOR [InfoNum]
GO
/****** Object:  Default [DF_KS_LogScore_AddDate]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_LogScore_Score]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_Score]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF_KS_LogScore_NowScore]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_NowScore]  DEFAULT (0) FOR [NowScore]
GO
/****** Object:  Default [DF_KS_LogScore_AvailableScore]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_AvailableScore]  DEFAULT (0) FOR [AvailableScore]
GO
/****** Object:  Default [DF_KS_LogScore_ChannelID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_LogScore_infoid]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_infoid]  DEFAULT (0) FOR [infoid]
GO
/****** Object:  Default [DF_KS_LogScore_Times]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_Times]  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF_KS_WorkTable_OrderID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_WorkTable] ADD  CONSTRAINT [DF_KS_WorkTable_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_UploadFiles_ChannelID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UploadFiles] ADD  CONSTRAINT [DF_KS_UploadFiles_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_UploadFiles_InfoID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UploadFiles] ADD  CONSTRAINT [DF_KS_UploadFiles_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_UploadFiles_DTimes]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UploadFiles] ADD  CONSTRAINT [DF_KS_UploadFiles_DTimes]  DEFAULT (0) FOR [DTimes]
GO
/****** Object:  Default [DF_KS_UploadFiles_DSize]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UploadFiles] ADD  CONSTRAINT [DF_KS_UploadFiles_DSize]  DEFAULT (0) FOR [DSize]
GO
/****** Object:  Default [DF_KS_UploadFiles_isAffix]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UploadFiles] ADD  CONSTRAINT [DF_KS_UploadFiles_isAffix]  DEFAULT (0) FOR [isAffix]
GO
/****** Object:  Default [DF_KS_UserRechargeItem_RechargeWay]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  CONSTRAINT [DF_KS_UserRechargeItem_RechargeWay]  DEFAULT (0) FOR [RechargeWay]
GO
/****** Object:  Default [DF_KS_UserRechargeItem_AddWay]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  CONSTRAINT [DF_KS_UserRechargeItem_AddWay]  DEFAULT (0) FOR [AddWay]
GO
/****** Object:  Default [DF_KS_UserRechargeItem_FaceValue]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  CONSTRAINT [DF_KS_UserRechargeItem_FaceValue]  DEFAULT (0) FOR [FaceValue]
GO
/****** Object:  Default [DF_KS_UserRechargeItem_PointNumber]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  CONSTRAINT [DF_KS_UserRechargeItem_PointNumber]  DEFAULT (0) FOR [PointNumber]
GO
/****** Object:  Default [DF_KS_UserRechargeItem_PointType]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  CONSTRAINT [DF_KS_UserRechargeItem_PointType]  DEFAULT (0) FOR [PointType]
GO
/****** Object:  Default [DF_KS_UserRechargeItem_IsSell]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  CONSTRAINT [DF_KS_UserRechargeItem_IsSell]  DEFAULT (0) FOR [IsSell]
GO
/****** Object:  Default [DF_KS_UserRechargeItem_IsUse]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  CONSTRAINT [DF_KS_UserRechargeItem_IsUse]  DEFAULT (0) FOR [IsUse]
GO
/****** Object:  Default [DF_KS_UserRechargeItem_UsedGroupId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  CONSTRAINT [DF_KS_UserRechargeItem_UsedGroupId]  DEFAULT (0) FOR [UsedGroupId]
GO
/****** Object:  Default [DF_KS_UserRechargeItem_EndGroupId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  CONSTRAINT [DF_KS_UserRechargeItem_EndGroupId]  DEFAULT (0) FOR [EndGroupId]
GO
/****** Object:  Default [DF_KS_Admin_AddDate]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF_KS_Admin_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_Admin_LastLoginTime]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF_KS_Admin_LastLoginTime]  DEFAULT (getdate()) FOR [LastLoginTime]
GO
/****** Object:  Default [DF_KS_Admin_LastLogoutTime]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF_KS_Admin_LastLogoutTime]  DEFAULT (getdate()) FOR [LastLogoutTime]
GO
/****** Object:  Default [DF__KS_Admin__LoginT__7B905C75]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF__KS_Admin__LoginT__7B905C75]  DEFAULT (0) FOR [LoginTimes]
GO
/****** Object:  Default [DF__KS_Admin__Locked__7C8480AE]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF__KS_Admin__Locked__7C8480AE]  DEFAULT (0) FOR [Locked]
GO
/****** Object:  Default [DF_KS_Admin_SysAdmin]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF_KS_Admin_SysAdmin]  DEFAULT (0) FOR [SysAdmin]
GO
/****** Object:  Default [DF__KS_Admin__UserTy__7D78A4E7]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF__KS_Admin__UserTy__7D78A4E7]  DEFAULT ('0') FOR [UserType]
GO
/****** Object:  Default [DF_KS_Admin_DocPower]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF_KS_Admin_DocPower]  DEFAULT (0) FOR [DocPower]
GO
/****** Object:  Default [DF__KS_Admin__Role__26873E20]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Admin] ADD  DEFAULT (0) FOR [Role]
GO
/****** Object:  Default [DF__KS_YunOpe__Statu__70B53D54]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunOpenUser] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_YunOpe__Verif__71A9618D]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunOpenUser] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_YunOpe__UserI__729D85C6]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_YunOpenUser] ADD  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF_KS_MoodList_MoodID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_MoodID]  DEFAULT (0) FOR [MoodID]
GO
/****** Object:  Default [DF_KS_MoodList_ChannelID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_MoodList_InfoID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_MoodList_M0]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M0]  DEFAULT (0) FOR [M0]
GO
/****** Object:  Default [DF_KS_MoodList_M1]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M1]  DEFAULT (0) FOR [M1]
GO
/****** Object:  Default [DF_KS_MoodList_M2]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M2]  DEFAULT (0) FOR [M2]
GO
/****** Object:  Default [DF_KS_MoodList_M3]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M3]  DEFAULT (0) FOR [M3]
GO
/****** Object:  Default [DF_KS_MoodList_M4]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M4]  DEFAULT (0) FOR [M4]
GO
/****** Object:  Default [DF_KS_MoodList_M5]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M5]  DEFAULT (0) FOR [M5]
GO
/****** Object:  Default [DF_KS_MoodList_M6]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M6]  DEFAULT (0) FOR [M6]
GO
/****** Object:  Default [DF_KS_MoodList_M7]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M7]  DEFAULT (0) FOR [M7]
GO
/****** Object:  Default [DF_KS_MoodList_M8]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M8]  DEFAULT (0) FOR [M8]
GO
/****** Object:  Default [DF_KS_MoodList_M9]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M9]  DEFAULT (0) FOR [M9]
GO
/****** Object:  Default [DF_KS_MoodList_M10]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M10]  DEFAULT (0) FOR [M10]
GO
/****** Object:  Default [DF_KS_MoodList_M11]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M11]  DEFAULT (0) FOR [M11]
GO
/****** Object:  Default [DF_KS_MoodList_M12]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M12]  DEFAULT (0) FOR [M12]
GO
/****** Object:  Default [DF_KS_MoodList_M13]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M13]  DEFAULT (0) FOR [M13]
GO
/****** Object:  Default [DF_KS_MoodList_M14]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M14]  DEFAULT (0) FOR [M14]
GO
/****** Object:  Default [DF_KS_ProImages_OrderId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProImages] ADD  CONSTRAINT [DF_KS_ProImages_OrderId]  DEFAULT (0) FOR [OrderId]
GO
/****** Object:  Default [DF__KS_Form__TimeLim__7C4F7684]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__TimeLim__7C4F7684]  DEFAULT (0) FOR [TimeLimit]
GO
/****** Object:  Default [DF__KS_Form__BeginDa__7D439ABD]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__BeginDa__7D439ABD]  DEFAULT (getdate()) FOR [BeginDate]
GO
/****** Object:  Default [DF__KS_Form__ExpireD__7E37BEF6]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__ExpireD__7E37BEF6]  DEFAULT (getdate()) FOR [ExpireDate]
GO
/****** Object:  Default [DF__KS_Form__LimitIP__7F2BE32F]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__LimitIP__7F2BE32F]  DEFAULT (0) FOR [LimitIP]
GO
/****** Object:  Default [DF__KS_Form__UserTF__00200768]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__UserTF__00200768]  DEFAULT (0) FOR [UserTF]
GO
/****** Object:  Default [DF_KS_Form_UploadUserTF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF_KS_Form_UploadUserTF]  DEFAULT (0) FOR [UploadUserTF]
GO
/****** Object:  Default [DF__KS_Form__UserOnc__01142BA1]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__UserOnc__01142BA1]  DEFAULT (0) FOR [UserOnce]
GO
/****** Object:  Default [DF__KS_Form__VerifyT__02084FDA]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__VerifyT__02084FDA]  DEFAULT (0) FOR [VerifyTF]
GO
/****** Object:  Default [DF__KS_Form__CodeTyp__02FC7413]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__CodeTyp__02FC7413]  DEFAULT (0) FOR [CodeType]
GO
/****** Object:  Default [DF__KS_Form__Status__03F0984C]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__Status__03F0984C]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_Form__MaxItem__04E4BC85]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__MaxItem__04E4BC85]  DEFAULT (0) FOR [MaxItemID]
GO
/****** Object:  Default [DF_KS_Form_IsSendMail]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF_KS_Form_IsSendMail]  DEFAULT (0) FOR [IsSendMail]
GO
/****** Object:  Default [DF__KS_Form__isReply__0EAFB48F]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  DEFAULT (0) FOR [isReply]
GO
/****** Object:  Default [DF__KS_Form__isPay__0FA3D8C8]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  DEFAULT (0) FOR [isPay]
GO
/****** Object:  Default [DF__KS_Form__PayMone__1097FD01]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  DEFAULT (0) FOR [PayMoney]
GO
/****** Object:  Default [DF__KS_Form__ShowOnU__118C213A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  DEFAULT (0) FOR [ShowOnUser]
GO
/****** Object:  Default [DF_KS_Form_Score]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF_KS_Form_Score]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF__KS_Log__ResultTF__2EDAF651]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_Log] ADD  CONSTRAINT [DF__KS_Log__ResultTF__2EDAF651]  DEFAULT (0) FOR [ResultTF]
GO
/****** Object:  Default [DF__KS_AdminR__Order__6A3D49EF]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_AdminRole] ADD  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_ProAmo__ProID__6C259261]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProAmount] ADD  DEFAULT (0) FOR [ProID]
GO
/****** Object:  Default [DF__KS_ProAmo__AttrI__6D19B69A]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProAmount] ADD  DEFAULT (0) FOR [AttrID]
GO
/****** Object:  Default [DF__KS_ProAmo__Store__6E0DDAD3]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProAmount] ADD  DEFAULT (0) FOR [StoreID]
GO
/****** Object:  Default [DF__KS_ProAmo__Amoun__6F01FF0C]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProAmount] ADD  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF_KS_UserRechargeCard_RechargeWay]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  CONSTRAINT [DF_KS_UserRechargeCard_RechargeWay]  DEFAULT (0) FOR [RechargeWay]
GO
/****** Object:  Default [DF_KS_UserRechargeCard_AddWay]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  CONSTRAINT [DF_KS_UserRechargeCard_AddWay]  DEFAULT (0) FOR [AddWay]
GO
/****** Object:  Default [DF_KS_UserRechargeCard_FaceValue]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  CONSTRAINT [DF_KS_UserRechargeCard_FaceValue]  DEFAULT (0) FOR [FaceValue]
GO
/****** Object:  Default [DF_KS_UserRechargeCard_PointNumber]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  CONSTRAINT [DF_KS_UserRechargeCard_PointNumber]  DEFAULT (0) FOR [PointNumber]
GO
/****** Object:  Default [DF_KS_UserRechargeCard_PointType]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  CONSTRAINT [DF_KS_UserRechargeCard_PointType]  DEFAULT (0) FOR [PointType]
GO
/****** Object:  Default [DF_KS_UserRechargeCard_IsSell]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  CONSTRAINT [DF_KS_UserRechargeCard_IsSell]  DEFAULT (0) FOR [IsSell]
GO
/****** Object:  Default [DF_KS_UserRechargeCard_IsUse]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  CONSTRAINT [DF_KS_UserRechargeCard_IsUse]  DEFAULT (0) FOR [IsUse]
GO
/****** Object:  Default [DF_KS_UserRechargeCard_UsedGroupId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  CONSTRAINT [DF_KS_UserRechargeCard_UsedGroupId]  DEFAULT (0) FOR [UsedGroupId]
GO
/****** Object:  Default [DF_KS_UserRechargeCard_EndGroupId]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  CONSTRAINT [DF_KS_UserRechargeCard_EndGroupId]  DEFAULT (0) FOR [EndGroupId]
GO
/****** Object:  Default [DF_KS_UserRechargeCard_ItemID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  CONSTRAINT [DF_KS_UserRechargeCard_ItemID]  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF__KS_VoteLo__VoteI__24285DB4]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_VoteLog] ADD  CONSTRAINT [DF__KS_VoteLo__VoteI__24285DB4]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF_KS_VoteLog_VoteDate]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_VoteLog] ADD  CONSTRAINT [DF_KS_VoteLog_VoteDate]  DEFAULT (getdate()) FOR [VoteDate]
GO
/****** Object:  Default [DF_KS_ProDeliveryItem_DeliveryID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  CONSTRAINT [DF_KS_ProDeliveryItem_DeliveryID]  DEFAULT (0) FOR [DeliveryID]
GO
/****** Object:  Default [DF_KS_ProDeliveryItem_IsCod]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  CONSTRAINT [DF_KS_ProDeliveryItem_IsCod]  DEFAULT (0) FOR [IsCod]
GO
/****** Object:  Default [DF_KS_ProDeliveryItem_FirstFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  CONSTRAINT [DF_KS_ProDeliveryItem_FirstFreight]  DEFAULT (0) FOR [FirstFreight]
GO
/****** Object:  Default [DF_KS_ProDeliveryItem_ContinueFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  CONSTRAINT [DF_KS_ProDeliveryItem_ContinueFreight]  DEFAULT (0) FOR [ContinueFreight]
GO
/****** Object:  Default [DF_KS_ProDeliveryItem_LimitFreight]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  CONSTRAINT [DF_KS_ProDeliveryItem_LimitFreight]  DEFAULT (0) FOR [LimitFreight]
GO
/****** Object:  Default [DF__KS_ProDel__store__63904C60]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  DEFAULT (0) FOR [storeId]
GO
/****** Object:  Default [DF__KS_ProDel__store__64847099]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  DEFAULT (0) FOR [storeType]
GO
/****** Object:  Default [DF__KS_BlogInfo__Hit__3F672F2C]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_BlogInfo] ADD  DEFAULT (0) FOR [Hit]
GO
/****** Object:  Default [DF__KS_ProGro__BuyAm__3F1DE1C0]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProGroupOneLottery] ADD  DEFAULT (0) FOR [BuyAmount]
GO
/****** Object:  Default [DF__KS_VoteIt__VoteI__2057CCD0]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_VoteItem] ADD  CONSTRAINT [DF__KS_VoteIt__VoteI__2057CCD0]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF__KS_VoteIt__VoteN__214BF109]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_VoteItem] ADD  CONSTRAINT [DF__KS_VoteIt__VoteN__214BF109]  DEFAULT (0) FOR [VoteNum]
GO
/****** Object:  Default [DF_KS_ProOrderBundleSale_CartID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrderBundleSale] ADD  CONSTRAINT [DF_KS_ProOrderBundleSale_CartID]  DEFAULT (0) FOR [CartID]
GO
/****** Object:  Default [DF_KS_ProOrderBundleSale_InfoID]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrderBundleSale] ADD  CONSTRAINT [DF_KS_ProOrderBundleSale_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_ProOrderBundleSale_Price]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrderBundleSale] ADD  CONSTRAINT [DF_KS_ProOrderBundleSale_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_KS_ProOrderBundleSale_Num]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrderBundleSale] ADD  CONSTRAINT [DF_KS_ProOrderBundleSale_Num]  DEFAULT (0) FOR [Num]
GO
/****** Object:  Default [DF_KS_ProOrderBundleSale_addDate]    Script Date: 01/13/2017 10:53:13 ******/
ALTER TABLE [KS_ProOrderBundleSale] ADD  CONSTRAINT [DF_KS_ProOrderBundleSale_addDate]  DEFAULT (getdate()) FOR [addDate]
GO
