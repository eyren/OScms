USE [master]
GO
/****** Object:  Database [renwu_db]    Script Date: 11/12/2015 14:42:51 ******/
CREATE DATABASE [renwu_db] ON  PRIMARY 
( NAME = N'os_DB', FILENAME = N'E:\code2015\R_任务发布系统\code\OScms\Data\renwu_db.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'os_DB_log', FILENAME = N'E:\code2015\R_任务发布系统\code\OScms\Data\renwu_db_log.ldf' , SIZE = 20096KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'renwu_db', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [renwu_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [renwu_db] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [renwu_db] SET ANSI_NULLS OFF
GO
ALTER DATABASE [renwu_db] SET ANSI_PADDING OFF
GO
ALTER DATABASE [renwu_db] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [renwu_db] SET ARITHABORT OFF
GO
ALTER DATABASE [renwu_db] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [renwu_db] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [renwu_db] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [renwu_db] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [renwu_db] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [renwu_db] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [renwu_db] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [renwu_db] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [renwu_db] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [renwu_db] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [renwu_db] SET  DISABLE_BROKER
GO
ALTER DATABASE [renwu_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [renwu_db] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [renwu_db] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [renwu_db] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [renwu_db] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [renwu_db] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [renwu_db] SET  READ_WRITE
GO
ALTER DATABASE [renwu_db] SET RECOVERY FULL
GO
ALTER DATABASE [renwu_db] SET  MULTI_USER
GO
ALTER DATABASE [renwu_db] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [renwu_db] SET DB_CHAINING OFF
GO
USE [renwu_db]
GO
/****** Object:  User [annijs]    Script Date: 11/12/2015 14:42:51 ******/
CREATE USER [annijs] FOR LOGIN [annijs] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[os_mail_template]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_mail_template](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[call_index] [nvarchar](50) NULL,
	[maill_title] [nvarchar](100) NULL,
	[content] [ntext] NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_os_MAIL_TEMPLATE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_mail_template', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_mail_template', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_mail_template', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_mail_template', @level2type=N'COLUMN',@level2name=N'maill_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_mail_template', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_mail_template', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮件模板' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_mail_template'
GO
/****** Object:  Table [dbo].[os_link]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_link](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NULL,
	[user_name] [nvarchar](50) NULL,
	[user_tel] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[site_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[is_image] [int] NOT NULL,
	[sort_id] [int] NOT NULL,
	[is_red] [tinyint] NOT NULL,
	[is_lock] [tinyint] NOT NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK__os_link__6319B466] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[os_feedback]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[content] [ntext] NULL,
	[user_name] [nvarchar](50) NULL,
	[user_tel] [nvarchar](30) NULL,
	[user_qq] [nvarchar](30) NULL,
	[user_email] [nvarchar](100) NULL,
	[add_time] [datetime] NOT NULL,
	[reply_content] [ntext] NULL,
	[reply_time] [datetime] NULL,
	[is_lock] [tinyint] NOT NULL,
 CONSTRAINT [PK__os_feedback__5E54FF49] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[os_category_field]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_category_field](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[field_id] [int] NULL,
 CONSTRAINT [PK_os_category_field] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[os_article_comment]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_article_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NULL,
	[article_id] [int] NULL,
	[parent_id] [int] NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[user_ip] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[is_lock] [tinyint] NULL,
	[add_time] [datetime] NULL,
	[is_reply] [tinyint] NULL,
	[reply_content] [ntext] NULL,
	[reply_time] [datetime] NULL,
 CONSTRAINT [PK_os_ARTICLE_COMMENT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父评论ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'user_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'评论内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发表时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否已答复' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'is_reply'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答复内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'reply_content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_comment', @level2type=N'COLUMN',@level2name=N'reply_time'
GO
/****** Object:  Table [dbo].[os_article_category]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_article_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[call_index] [nvarchar](50) NULL,
	[parent_id] [int] NULL,
	[class_list] [nvarchar](500) NULL,
	[class_layer] [int] NULL,
	[sort_id] [int] NULL,
	[model_id] [int] NULL,
	[is_add_category] [int] NULL,
	[is_add_content] [int] NULL,
	[is_show_top] [int] NULL,
	[is_show_foot] [int] NULL,
	[is_albums] [tinyint] NULL,
	[is_attach] [tinyint] NULL,
	[page_size] [int] NULL,
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
	[nav_type] [nchar](50) NULL,
	[sub_title] [nchar](100) NULL,
	[action_type] [nchar](500) NULL,
	[is_sys] [tinyint] NULL,
	[is_lock] [tinyint] NULL,
 CONSTRAINT [PK_os_article_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父类别ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'parent_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID列表(逗号分隔开)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'class_list'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别深度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'class_layer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'URL跳转地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'link_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_category', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
SET IDENTITY_INSERT [dbo].[os_article_category] ON
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (1, 2, N'内容管理', N'narongguanli', 0, N',1,', 1, 99, 0, 1, 0, 0, 0, 0, 0, 10, N'', NULL, N'', NULL, NULL, NULL, N'WebSite                                           ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (10, -1, N'辅助设置', N'fuzhushezhi', 0, N',10,', 1, 100, 0, 0, 0, 0, 0, 0, 0, 0, N'', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (11, -1, N'内容搜索', N'search', 10, N',10,11,', 2, 99, 0, 0, 0, 0, 0, 0, 0, 0, N'article/search.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (12, -1, N'广告管理', N'advert', 10, N',10,12,', 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, N'advert/index.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (13, -1, N'客户预约', N'feedback', 10, N',10,13,', 2, 101, 0, 0, 0, 0, 0, 0, 0, 0, N'feedback/list.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (14, -1, N'连接管理', N'link', 10, N',10,14,', 2, 102, 0, 0, 0, 0, 0, 0, 0, 0, N'link/list.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (15, -1, N'邮件模板管理', N'mail', 10, N',10,15,', 2, 103, 0, 0, 0, 0, 0, 0, 0, 0, N'settings/mail_template_list.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (16, -1, N'用户管理', N'', 0, N',16,', 1, 100, 0, 0, 0, 0, 0, 0, 0, 0, N'', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (17, -1, N'待审核会员', N'user_audit', 16, N',16,17,', 2, 99, 0, 0, 0, 0, 0, 0, 0, 0, N'user/user_audit.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (18, -1, N'全部会员', N'user_list', 16, N',16,18,', 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, N'user/user_list.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (19, -1, N'控制面板', N'', 0, N',19,', 1, 103, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (20, -1, N'系统参数管理', N'sys_config', 19, N',19,20,', 2, 99, 0, 0, 0, 0, 0, 0, 0, 0, N'settings/sys_config.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (21, -1, N'栏目管理', N'category', 19, N',19,21,', 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, N'article/category_list.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (22, -1, N'扩展字段管理', N'attribute_field', 19, N',19,22,', 2, 101, 0, 0, 0, 0, 0, 0, 0, 0, N'channel/attribute_field_list.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (23, -1, N'数据库备份', N'databack', 19, N',19,23,', 2, 102, 0, 0, 0, 0, 0, 0, 0, 0, N'settings/databack.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (24, -1, N'后台导航管理', N'nav_list', 19, N',19,24,', 2, 105, 0, 0, 0, 0, 0, 0, 0, 0, N'settings/nav_list.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (25, -1, N'系统用户', N'sys_manager', 0, N',25,', 1, 102, 0, 0, 0, 0, 0, 0, 0, 0, N'', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (26, -1, N'管理员管理', N'manager', 25, N',25,26,', 2, 99, 0, 0, 0, 0, 0, 0, 0, 0, N'manager/manager_list.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (27, -1, N'角色管理', N'manager_role', 25, N',25,27,', 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, N'manager/role_list.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (28, -1, N'日志管理', N'manager_log', 25, N',25,28,', 2, 101, 0, 0, 0, 0, 0, 0, 0, 0, N'manager/manager_log.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 1, 0)
INSERT [dbo].[os_article_category] ([id], [channel_id], [title], [call_index], [parent_id], [class_list], [class_layer], [sort_id], [model_id], [is_add_category], [is_add_content], [is_show_top], [is_show_foot], [is_albums], [is_attach], [page_size], [link_url], [img_url], [content], [seo_title], [seo_keywords], [seo_description], [nav_type], [sub_title], [action_type], [is_sys], [is_lock]) VALUES (29, -1, N'URL配置', N'sys_url', 19, N',19,29,', 2, 103, 0, 0, 0, 0, 0, 0, 0, 0, N'settings/url_rewrite_list.aspx', NULL, N'', NULL, NULL, NULL, N'System                                            ', NULL, N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', 0, 0)
SET IDENTITY_INSERT [dbo].[os_article_category] OFF
/****** Object:  Table [dbo].[os_article_attribute_field]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_article_attribute_field](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[title] [nvarchar](100) NULL,
	[control_type] [nvarchar](50) NULL,
	[data_type] [nvarchar](50) NULL,
	[data_length] [int] NULL,
	[data_place] [tinyint] NULL,
	[item_option] [ntext] NULL,
	[default_value] [ntext] NULL,
	[is_required] [tinyint] NULL,
	[is_password] [tinyint] NULL,
	[is_html] [tinyint] NULL,
	[editor_type] [tinyint] NULL,
	[valid_tip_msg] [nvarchar](255) NULL,
	[valid_error_msg] [nvarchar](255) NULL,
	[valid_pattern] [nvarchar](500) NULL,
	[sort_id] [int] NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_os_ARTICLE_ATTRIBUTE_FIELD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'列名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'控件类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'control_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'data_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字段长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'data_length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小数点位数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'data_place'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选项列表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'item_option'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'default_value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否必填0非必填1必填' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_required'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否密码框' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许HTML' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_html'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编辑器类型0标准型1简洁型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'editor_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证提示信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'valid_tip_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证失败提示信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'valid_error_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证正则表达式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'valid_pattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序数字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统默认' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展属性表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_field'
GO
/****** Object:  Table [dbo].[os_article_attach]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_article_attach](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[file_name] [nvarchar](100) NULL,
	[file_path] [nvarchar](255) NULL,
	[file_size] [int] NULL,
	[file_ext] [nvarchar](20) NULL,
	[down_num] [int] NULL,
	[point] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_os_ARTICLE_ATTACH] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attach', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attach', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attach', @level2type=N'COLUMN',@level2name=N'file_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attach', @level2type=N'COLUMN',@level2name=N'file_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小(字节)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attach', @level2type=N'COLUMN',@level2name=N'file_size'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件扩展名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attach', @level2type=N'COLUMN',@level2name=N'file_ext'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下载次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attach', @level2type=N'COLUMN',@level2name=N'down_num'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分(正赠送负消费)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attach', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attach', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attach'
GO
/****** Object:  Table [dbo].[os_article_albums]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_article_albums](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[thumb_path] [nvarchar](255) NULL,
	[original_path] [nvarchar](255) NULL,
	[remark] [nvarchar](500) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_os_ARTICLE_ALBUMS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_albums', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_albums', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缩略图地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_albums', @level2type=N'COLUMN',@level2name=N'thumb_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'原图地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_albums', @level2type=N'COLUMN',@level2name=N'original_path'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_albums', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_albums', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片相册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_albums'
GO
/****** Object:  Table [dbo].[os_advert_banner]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_advert_banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Aid] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[Title2] [nvarchar](100) NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[file_path] [nvarchar](250) NULL,
	[link_url] [nvarchar](250) NULL,
	[content] [ntext] NULL,
	[sort_id] [int] NOT NULL,
	[is_lock] [int] NOT NULL,
	[add_time] [datetime] NOT NULL,
 CONSTRAINT [PK_os_advert_banner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[os_advert]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_advert](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[type] [tinyint] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[remark] [nvarchar](255) NULL,
	[view_num] [int] NOT NULL,
	[view_width] [int] NOT NULL,
	[view_height] [int] NOT NULL,
	[target] [nvarchar](30) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK__os_advert__373B3228] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[os_user_groups]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[grade] [int] NULL,
	[upgrade_exp] [int] NULL,
	[amount] [decimal](9, 2) NULL,
	[point] [int] NULL,
	[discount] [int] NULL,
	[is_default] [tinyint] NULL,
	[is_upgrade] [tinyint] NULL,
	[is_lock] [tinyint] NULL,
 CONSTRAINT [PK_os_USER_GROUPS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组别名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'会员等级值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups', @level2type=N'COLUMN',@level2name=N'grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'升级经验值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups', @level2type=N'COLUMN',@level2name=N'upgrade_exp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认预存款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups', @level2type=N'COLUMN',@level2name=N'amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'购物折扣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups', @level2type=N'COLUMN',@level2name=N'discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否注册用户组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups', @level2type=N'COLUMN',@level2name=N'is_default'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否自动升级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups', @level2type=N'COLUMN',@level2name=N'is_upgrade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_groups'
GO
SET IDENTITY_INSERT [dbo].[os_user_groups] ON
INSERT [dbo].[os_user_groups] ([id], [title], [grade], [upgrade_exp], [amount], [point], [discount], [is_default], [is_upgrade], [is_lock]) VALUES (1, N'普通会员', 1, 0, CAST(1.00 AS Decimal(9, 2)), 10, 100, 1, 1, 0)
INSERT [dbo].[os_user_groups] ([id], [title], [grade], [upgrade_exp], [amount], [point], [discount], [is_default], [is_upgrade], [is_lock]) VALUES (2, N'VIP会员', 2, 1000, CAST(0.00 AS Decimal(9, 2)), 0, 99, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[os_user_groups] OFF
/****** Object:  Table [dbo].[os_manager_role]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_manager_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](100) NULL,
	[role_type] [tinyint] NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_os_MANAGER_ROLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_role', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_role', @level2type=N'COLUMN',@level2name=N'role_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_role', @level2type=N'COLUMN',@level2name=N'role_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否系统默认0否1是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_role', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_role'
GO
SET IDENTITY_INSERT [dbo].[os_manager_role] ON
INSERT [dbo].[os_manager_role] ([id], [role_name], [role_type], [is_sys]) VALUES (1, N'超级管理组', 1, 1)
SET IDENTITY_INSERT [dbo].[os_manager_role] OFF
/****** Object:  Table [dbo].[os_manager_log]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_manager_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[action_type] [nvarchar](100) NULL,
	[remark] [nvarchar](255) NULL,
	[user_ip] [nvarchar](30) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_os_MANAGER_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_log', @level2type=N'COLUMN',@level2name=N'action_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_log', @level2type=N'COLUMN',@level2name=N'user_ip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_log', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_log'
GO
SET IDENTITY_INSERT [dbo].[os_manager_log] ON
INSERT [dbo].[os_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (1290, 1, N'admin', N'Delete', N'删除导航信息', N'127.0.0.1', CAST(0x0000A54E00F0C5AB AS DateTime))
INSERT [dbo].[os_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (1291, 1, N'admin', N'Add', N'添加频道栏目分类:首页', N'127.0.0.1', CAST(0x0000A54E00F205CE AS DateTime))
INSERT [dbo].[os_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (1292, 1, N'admin', N'Add', N'添加频道栏目分类:新闻', N'127.0.0.1', CAST(0x0000A54E00F217BF AS DateTime))
INSERT [dbo].[os_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (1293, 1, N'admin', N'Add', N'添加xinwen频道内容:阿斯蒂芬', N'127.0.0.1', CAST(0x0000A54E00F22B46 AS DateTime))
INSERT [dbo].[os_manager_log] ([id], [user_id], [user_name], [action_type], [remark], [user_ip], [add_time]) VALUES (1294, 1, N'admin', N'Edit', N'删除xinwen频道内容成功1条，失败0条', N'127.0.0.1', CAST(0x0000A54E00F23106 AS DateTime))
SET IDENTITY_INSERT [dbo].[os_manager_log] OFF
/****** Object:  Table [dbo].[os_manager_role_value]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_manager_role_value](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[nav_name] [nvarchar](100) NULL,
	[action_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_os_MANAGER_ROLE_VALUE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_role_value', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_role_value', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'导航名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_role_value', @level2type=N'COLUMN',@level2name=N'nav_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_role_value', @level2type=N'COLUMN',@level2name=N'action_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理角色权限表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager_role_value'
GO
/****** Object:  Table [dbo].[os_users]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[user_name] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[salt] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[nick_name] [nvarchar](100) NULL,
	[avatar] [nvarchar](255) NULL,
	[sex] [nvarchar](20) NULL,
	[birthday] [datetime] NULL,
	[telphone] [nvarchar](50) NULL,
	[mobile] [nvarchar](20) NULL,
	[qq] [nvarchar](30) NULL,
	[address] [nvarchar](255) NULL,
	[safe_question] [nvarchar](255) NULL,
	[safe_answer] [nvarchar](255) NULL,
	[amount] [decimal](9, 2) NULL,
	[point] [int] NULL,
	[exp] [int] NULL,
	[status] [tinyint] NULL,
	[reg_time] [datetime] NULL,
	[reg_ip] [nvarchar](30) NULL,
 CONSTRAINT [PK_os_USERS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户组别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'group_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'6位随机字符串,加密用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'salt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'nick_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'avatar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'telphone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'qq'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'安全问题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'safe_question'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题答案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'safe_answer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预存款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经验值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'exp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态,0正常,1待验证,2待审核,3锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'reg_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'注册IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_users', @level2type=N'COLUMN',@level2name=N'reg_ip'
GO
/****** Object:  Table [dbo].[os_manager]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_manager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[role_type] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[salt] [nvarchar](20) NULL,
	[real_name] [nvarchar](50) NULL,
	[telephone] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[is_lock] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_os_MANAGER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'role_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员类型1超管2系管' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'role_type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'6位随机字符串,加密用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'salt'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'real_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'is_lock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'添加时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员信息表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_manager'
GO
SET IDENTITY_INSERT [dbo].[os_manager] ON
INSERT [dbo].[os_manager] ([id], [role_id], [role_type], [user_name], [password], [salt], [real_name], [telephone], [email], [is_lock], [add_time]) VALUES (1, 1, 1, N'admin', N'BB59946C93C0DEE8C362BBE0F332C039', N'28LH48', N'超级管理员', N'13800138000', N'info@dtcms.net', 0, CAST(0x0000A28A001F3380 AS DateTime))
SET IDENTITY_INSERT [dbo].[os_manager] OFF
/****** Object:  Table [dbo].[os_article]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[call_index] [nvarchar](50) NULL,
	[title] [nvarchar](100) NULL,
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
	[zhaiyao] [nvarchar](255) NULL,
	[content] [ntext] NULL,
	[sort_id] [int] NULL,
	[click] [int] NULL,
	[status] [tinyint] NULL,
	[groupids_view] [nvarchar](255) NULL,
	[vote_id] [int] NULL,
	[is_msg] [tinyint] NULL,
	[is_top] [tinyint] NULL,
	[is_red] [tinyint] NULL,
	[is_hot] [tinyint] NULL,
	[is_slide] [tinyint] NULL,
	[is_sys] [tinyint] NULL,
	[user_name] [nvarchar](100) NULL,
	[add_time] [datetime] NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_os_ARTICLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'频道ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'channel_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类别ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'category_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'调用别名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'call_index'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外部链接' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'link_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'img_url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'seo_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO关健字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'seo_keywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEO描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'seo_description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内容摘要' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'zhaiyao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'sort_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'浏览次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'click'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态0正常1未审核2锁定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'阅读权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'groupids_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联投票ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'vote_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否允许评论' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'is_msg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否置顶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'is_top'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'is_red'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否热门' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'is_hot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否幻灯片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'is_slide'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否管理员发布0不是1是' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'is_sys'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'add_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article', @level2type=N'COLUMN',@level2name=N'update_time'
GO
/****** Object:  Table [dbo].[os_article_attribute_value]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_article_attribute_value](
	[article_id] [int] NOT NULL,
	[sub_title] [nvarchar](255) NULL,
	[source] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL,
	[goods_no] [nvarchar](100) NULL,
	[stock_quantity] [int] NULL,
	[market_price] [decimal](9, 2) NULL,
	[sell_price] [decimal](9, 2) NULL,
	[point] [int] NULL,
 CONSTRAINT [PK_os_ARTICLE_ATTRIBUTE_VALUE] PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_value', @level2type=N'COLUMN',@level2name=N'article_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_value', @level2type=N'COLUMN',@level2name=N'sub_title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_value', @level2type=N'COLUMN',@level2name=N'source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'作者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_value', @level2type=N'COLUMN',@level2name=N'author'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'商品货号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_value', @level2type=N'COLUMN',@level2name=N'goods_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'库存数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_value', @level2type=N'COLUMN',@level2name=N'stock_quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'市场价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_value', @level2type=N'COLUMN',@level2name=N'market_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'销售价格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_value', @level2type=N'COLUMN',@level2name=N'sell_price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_value', @level2type=N'COLUMN',@level2name=N'point'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展属性表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_article_attribute_value'
GO
/****** Object:  Table [dbo].[os_user_code]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_user_code](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[user_name] [nvarchar](100) NULL,
	[type] [nvarchar](20) NULL,
	[str_code] [nvarchar](255) NULL,
	[count] [int] NULL,
	[status] [tinyint] NULL,
	[eff_time] [datetime] NOT NULL,
	[add_time] [datetime] NOT NULL,
 CONSTRAINT [PK_os_USER_CODE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_code', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_code', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_code', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成码类别 password取回密码,register邀请注册' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_code', @level2type=N'COLUMN',@level2name=N'type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成的字符串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_code', @level2type=N'COLUMN',@level2name=N'str_code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_code', @level2type=N'COLUMN',@level2name=N'count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态0未使用1已使用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_code', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_code', @level2type=N'COLUMN',@level2name=N'eff_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_code', @level2type=N'COLUMN',@level2name=N'add_time'
GO
/****** Object:  Table [dbo].[os_user_login_log]    Script Date: 11/12/2015 14:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[os_user_login_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[user_name] [nvarchar](100) NULL,
	[remark] [nvarchar](255) NULL,
	[login_time] [datetime] NULL,
	[login_ip] [nvarchar](50) NULL,
 CONSTRAINT [PK_os_USER_LOGIN_LOG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_login_log', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_login_log', @level2type=N'COLUMN',@level2name=N'user_id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_login_log', @level2type=N'COLUMN',@level2name=N'user_name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_login_log', @level2type=N'COLUMN',@level2name=N'remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_login_log', @level2type=N'COLUMN',@level2name=N'login_time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'os_user_login_log', @level2type=N'COLUMN',@level2name=N'login_ip'
GO
/****** Object:  View [dbo].[view_channel_yinzhongxunhua]    Script Date: 11/12/2015 14:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_yinzhongxunhua] as SELECT os_article.* FROM os_article_attribute_value INNER JOIN os_article ON os_article_attribute_value.article_id = os_article.id WHERE os_article.channel_id=7
GO
/****** Object:  View [dbo].[view_channel_photo]    Script Date: 11/12/2015 14:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_photo] as SELECT os_article.* FROM os_article_attribute_value INNER JOIN os_article ON os_article_attribute_value.article_id = os_article.id WHERE os_article.channel_id=3
GO
/****** Object:  View [dbo].[view_channel_news]    Script Date: 11/12/2015 14:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_news] as SELECT os_article.* FROM os_article_attribute_value INNER JOIN os_article ON os_article_attribute_value.article_id = os_article.id WHERE os_article.channel_id=1
GO
/****** Object:  View [dbo].[view_channel_miaomuxiaoshou]    Script Date: 11/12/2015 14:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_miaomuxiaoshou] as SELECT os_article.* FROM os_article_attribute_value INNER JOIN os_article ON os_article_attribute_value.article_id = os_article.id WHERE os_article.channel_id=6
GO
/****** Object:  View [dbo].[view_channel_down]    Script Date: 11/12/2015 14:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_down] as SELECT os_article.*,os_article_attribute_value.source,os_article_attribute_value.author FROM os_article_attribute_value INNER JOIN os_article ON os_article_attribute_value.article_id = os_article.id WHERE os_article.channel_id=4
GO
/****** Object:  View [dbo].[view_channel_case]    Script Date: 11/12/2015 14:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_case] as SELECT os_article.* FROM os_article_attribute_value INNER JOIN os_article ON os_article_attribute_value.article_id = os_article.id WHERE os_article.channel_id=2
GO
/****** Object:  View [dbo].[view_channel_article]    Script Date: 11/12/2015 14:42:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_article] as SELECT os_article.* FROM os_article_attribute_value INNER JOIN os_article ON os_article_attribute_value.article_id = os_article.id WHERE os_article.channel_id=5
GO
/****** Object:  Default [DF__os_mail_t__is_sy__74444068]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_mail_template] ADD  CONSTRAINT [DF__os_mail_t__is_sy__74444068]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF__os_link__is_imag__640DD89F]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_link] ADD  CONSTRAINT [DF__os_link__is_imag__640DD89F]  DEFAULT ((0)) FOR [is_image]
GO
/****** Object:  Default [DF__os_link__sort_id__6501FCD8]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_link] ADD  CONSTRAINT [DF__os_link__sort_id__6501FCD8]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__os_link__is_red__65F62111]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_link] ADD  CONSTRAINT [DF__os_link__is_red__65F62111]  DEFAULT ((0)) FOR [is_red]
GO
/****** Object:  Default [DF__os_link__add_tim__66EA454A]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_link] ADD  CONSTRAINT [DF__os_link__add_tim__66EA454A]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__os_feedba__add_t__5F492382]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_feedback] ADD  CONSTRAINT [DF__os_feedba__add_t__5F492382]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__os_feedba__reply__603D47BB]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_feedback] ADD  CONSTRAINT [DF__os_feedba__reply__603D47BB]  DEFAULT ('') FOR [reply_content]
GO
/****** Object:  Default [DF__os_feedba__is_lo__61316BF4]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_feedback] ADD  CONSTRAINT [DF__os_feedba__is_lo__61316BF4]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF_os_category_field_category_id]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_category_field] ADD  CONSTRAINT [DF_os_category_field_category_id]  DEFAULT ((0)) FOR [category_id]
GO
/****** Object:  Default [DF_os_category_field_field_id]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_category_field] ADD  CONSTRAINT [DF_os_category_field_field_id]  DEFAULT ((0)) FOR [field_id]
GO
/****** Object:  Default [DF__os_articl__chann__5006DFF2]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_comment] ADD  CONSTRAINT [DF__os_articl__chann__5006DFF2]  DEFAULT ((0)) FOR [channel_id]
GO
/****** Object:  Default [DF__os_articl__artic__50FB042B]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_comment] ADD  CONSTRAINT [DF__os_articl__artic__50FB042B]  DEFAULT ((0)) FOR [article_id]
GO
/****** Object:  Default [DF__os_articl__paren__51EF2864]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_comment] ADD  CONSTRAINT [DF__os_articl__paren__51EF2864]  DEFAULT ((0)) FOR [parent_id]
GO
/****** Object:  Default [DF__os_articl__user___52E34C9D]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_comment] ADD  CONSTRAINT [DF__os_articl__user___52E34C9D]  DEFAULT ((0)) FOR [user_id]
GO
/****** Object:  Default [DF__os_articl__user___53D770D6]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_comment] ADD  CONSTRAINT [DF__os_articl__user___53D770D6]  DEFAULT ('') FOR [user_name]
GO
/****** Object:  Default [DF__os_articl__is_lo__54CB950F]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_comment] ADD  CONSTRAINT [DF__os_articl__is_lo__54CB950F]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__os_articl__add_t__55BFB948]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_comment] ADD  CONSTRAINT [DF__os_articl__add_t__55BFB948]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__os_articl__is_re__56B3DD81]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_comment] ADD  CONSTRAINT [DF__os_articl__is_re__56B3DD81]  DEFAULT ((0)) FOR [is_reply]
GO
/****** Object:  Default [DF__os_articl__call___4589517F]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF__os_articl__call___4589517F]  DEFAULT ('') FOR [call_index]
GO
/****** Object:  Default [DF__os_articl__paren__467D75B8]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF__os_articl__paren__467D75B8]  DEFAULT ((0)) FOR [parent_id]
GO
/****** Object:  Default [DF__os_articl__class__477199F1]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF__os_articl__class__477199F1]  DEFAULT ((0)) FOR [class_layer]
GO
/****** Object:  Default [DF__os_articl__sort___4865BE2A]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF__os_articl__sort___4865BE2A]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF_os_article_category_model_id]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF_os_article_category_model_id]  DEFAULT ((0)) FOR [model_id]
GO
/****** Object:  Default [DF_os_article_category_is_add_category]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF_os_article_category_is_add_category]  DEFAULT ((0)) FOR [is_add_category]
GO
/****** Object:  Default [DF_os_article_category_is_add_content]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF_os_article_category_is_add_content]  DEFAULT ((0)) FOR [is_add_content]
GO
/****** Object:  Default [DF_os_article_category_is_show_top]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF_os_article_category_is_show_top]  DEFAULT ((0)) FOR [is_show_top]
GO
/****** Object:  Default [DF_os_article_category_is_show_foot]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF_os_article_category_is_show_foot]  DEFAULT ((0)) FOR [is_show_foot]
GO
/****** Object:  Default [DF_os_article_category_is_albums]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF_os_article_category_is_albums]  DEFAULT ((0)) FOR [is_albums]
GO
/****** Object:  Default [DF_os_article_category_is_attach]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF_os_article_category_is_attach]  DEFAULT ((0)) FOR [is_attach]
GO
/****** Object:  Default [DF_os_article_category_page_size]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF_os_article_category_page_size]  DEFAULT ((0)) FOR [page_size]
GO
/****** Object:  Default [DF__os_articl__link___4959E263]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF__os_articl__link___4959E263]  DEFAULT ('') FOR [link_url]
GO
/****** Object:  Default [DF__os_articl__img_u__4A4E069C]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF__os_articl__img_u__4A4E069C]  DEFAULT ('') FOR [img_url]
GO
/****** Object:  Default [DF__os_articl__seo_t__4B422AD5]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF__os_articl__seo_t__4B422AD5]  DEFAULT ('') FOR [seo_title]
GO
/****** Object:  Default [DF__os_articl__seo_k__4C364F0E]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF__os_articl__seo_k__4C364F0E]  DEFAULT ('') FOR [seo_keywords]
GO
/****** Object:  Default [DF__os_articl__seo_d__4D2A7347]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF__os_articl__seo_d__4D2A7347]  DEFAULT ('') FOR [seo_description]
GO
/****** Object:  Default [DF_os_article_category_is_sys]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF_os_article_category_is_sys]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF_os_article_category_is_lock]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_category] ADD  CONSTRAINT [DF_os_article_category_is_lock]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__os_articl__title__1EF99443]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__title__1EF99443]  DEFAULT ('') FOR [title]
GO
/****** Object:  Default [DF__os_articl__data___1FEDB87C]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__data___1FEDB87C]  DEFAULT ((0)) FOR [data_length]
GO
/****** Object:  Default [DF__os_articl__data___20E1DCB5]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__data___20E1DCB5]  DEFAULT ((0)) FOR [data_place]
GO
/****** Object:  Default [DF__os_articl__item___21D600EE]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__item___21D600EE]  DEFAULT ('') FOR [item_option]
GO
/****** Object:  Default [DF__os_articl__defau__22CA2527]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__defau__22CA2527]  DEFAULT ('') FOR [default_value]
GO
/****** Object:  Default [DF__os_articl__is_re__23BE4960]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__is_re__23BE4960]  DEFAULT ((0)) FOR [is_required]
GO
/****** Object:  Default [DF__os_articl__is_pa__24B26D99]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__is_pa__24B26D99]  DEFAULT ((0)) FOR [is_password]
GO
/****** Object:  Default [DF__os_articl__is_ht__25A691D2]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__is_ht__25A691D2]  DEFAULT ((0)) FOR [is_html]
GO
/****** Object:  Default [DF__os_articl__edito__269AB60B]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__edito__269AB60B]  DEFAULT ((0)) FOR [editor_type]
GO
/****** Object:  Default [DF__os_articl__valid__278EDA44]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__valid__278EDA44]  DEFAULT ('') FOR [valid_tip_msg]
GO
/****** Object:  Default [DF__os_articl__valid__2882FE7D]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__valid__2882FE7D]  DEFAULT ('') FOR [valid_error_msg]
GO
/****** Object:  Default [DF__os_articl__valid__297722B6]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__valid__297722B6]  DEFAULT ('') FOR [valid_pattern]
GO
/****** Object:  Default [DF__os_articl__sort___2A6B46EF]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__sort___2A6B46EF]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__os_articl__is_sy__2B5F6B28]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_field] ADD  CONSTRAINT [DF__os_articl__is_sy__2B5F6B28]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF__os_articl__artic__2334397B]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attach] ADD  CONSTRAINT [DF__os_articl__artic__2334397B]  DEFAULT ((0)) FOR [article_id]
GO
/****** Object:  Default [DF__os_articl__file___24285DB4]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attach] ADD  CONSTRAINT [DF__os_articl__file___24285DB4]  DEFAULT ('') FOR [file_name]
GO
/****** Object:  Default [DF__os_articl__file___251C81ED]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attach] ADD  CONSTRAINT [DF__os_articl__file___251C81ED]  DEFAULT ('') FOR [file_path]
GO
/****** Object:  Default [DF__os_articl__file___2610A626]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attach] ADD  CONSTRAINT [DF__os_articl__file___2610A626]  DEFAULT ((0)) FOR [file_size]
GO
/****** Object:  Default [DF__os_articl__file___2704CA5F]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attach] ADD  CONSTRAINT [DF__os_articl__file___2704CA5F]  DEFAULT ('') FOR [file_ext]
GO
/****** Object:  Default [DF__os_articl__down___27F8EE98]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attach] ADD  CONSTRAINT [DF__os_articl__down___27F8EE98]  DEFAULT ((0)) FOR [down_num]
GO
/****** Object:  Default [DF__os_articl__point__28ED12D1]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attach] ADD  CONSTRAINT [DF__os_articl__point__28ED12D1]  DEFAULT ((0)) FOR [point]
GO
/****** Object:  Default [DF__os_articl__add_t__29E1370A]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attach] ADD  CONSTRAINT [DF__os_articl__add_t__29E1370A]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__os_articl__artic__1C873BEC]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_albums] ADD  CONSTRAINT [DF__os_articl__artic__1C873BEC]  DEFAULT ((0)) FOR [article_id]
GO
/****** Object:  Default [DF__os_articl__thumb__1D7B6025]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_albums] ADD  CONSTRAINT [DF__os_articl__thumb__1D7B6025]  DEFAULT ('') FOR [thumb_path]
GO
/****** Object:  Default [DF__os_articl__origi__1E6F845E]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_albums] ADD  CONSTRAINT [DF__os_articl__origi__1E6F845E]  DEFAULT ('') FOR [original_path]
GO
/****** Object:  Default [DF__os_articl__remar__1F63A897]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_albums] ADD  CONSTRAINT [DF__os_articl__remar__1F63A897]  DEFAULT ('') FOR [remark]
GO
/****** Object:  Default [DF__os_articl__add_t__2057CCD0]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_albums] ADD  CONSTRAINT [DF__os_articl__add_t__2057CCD0]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__os_advert__price__382F5661]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_advert] ADD  CONSTRAINT [DF__os_advert__price__382F5661]  DEFAULT ((0)) FOR [price]
GO
/****** Object:  Default [DF__os_advert__view___39237A9A]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_advert] ADD  CONSTRAINT [DF__os_advert__view___39237A9A]  DEFAULT ((0)) FOR [view_num]
GO
/****** Object:  Default [DF__os_advert__view___3A179ED3]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_advert] ADD  CONSTRAINT [DF__os_advert__view___3A179ED3]  DEFAULT ((0)) FOR [view_width]
GO
/****** Object:  Default [DF__os_advert__view___3B0BC30C]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_advert] ADD  CONSTRAINT [DF__os_advert__view___3B0BC30C]  DEFAULT ((0)) FOR [view_height]
GO
/****** Object:  Default [DF__os_advert__add_t__3BFFE745]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_advert] ADD  CONSTRAINT [DF__os_advert__add_t__3BFFE745]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__os_user_g__title__53A266AC]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_groups] ADD  CONSTRAINT [DF__os_user_g__title__53A266AC]  DEFAULT ('') FOR [title]
GO
/****** Object:  Default [DF__os_user_g__grade__54968AE5]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_groups] ADD  CONSTRAINT [DF__os_user_g__grade__54968AE5]  DEFAULT ((0)) FOR [grade]
GO
/****** Object:  Default [DF__os_user_g__upgra__558AAF1E]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_groups] ADD  CONSTRAINT [DF__os_user_g__upgra__558AAF1E]  DEFAULT ((0)) FOR [upgrade_exp]
GO
/****** Object:  Default [DF__os_user_g__amoun__567ED357]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_groups] ADD  CONSTRAINT [DF__os_user_g__amoun__567ED357]  DEFAULT ((0)) FOR [amount]
GO
/****** Object:  Default [DF__os_user_g__point__5772F790]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_groups] ADD  CONSTRAINT [DF__os_user_g__point__5772F790]  DEFAULT ((0)) FOR [point]
GO
/****** Object:  Default [DF__os_user_g__is_de__58671BC9]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_groups] ADD  CONSTRAINT [DF__os_user_g__is_de__58671BC9]  DEFAULT ((0)) FOR [is_default]
GO
/****** Object:  Default [DF__os_user_g__is_up__595B4002]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_groups] ADD  CONSTRAINT [DF__os_user_g__is_up__595B4002]  DEFAULT ((1)) FOR [is_upgrade]
GO
/****** Object:  Default [DF__os_user_g__is_lo__5A4F643B]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_groups] ADD  CONSTRAINT [DF__os_user_g__is_lo__5A4F643B]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__os_manage__is_sy__019E3B86]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_manager_role] ADD  CONSTRAINT [DF__os_manage__is_sy__019E3B86]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF__os_manage__add_t__451F3D2B]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_manager_log] ADD  CONSTRAINT [DF__os_manage__add_t__451F3D2B]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__os_users__group___75F77EB0]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__group___75F77EB0]  DEFAULT ((0)) FOR [group_id]
GO
/****** Object:  Default [DF__os_users__email__76EBA2E9]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__email__76EBA2E9]  DEFAULT ('') FOR [email]
GO
/****** Object:  Default [DF__os_users__nick_n__77DFC722]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__nick_n__77DFC722]  DEFAULT ('') FOR [nick_name]
GO
/****** Object:  Default [DF__os_users__avatar__78D3EB5B]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__avatar__78D3EB5B]  DEFAULT ('') FOR [avatar]
GO
/****** Object:  Default [DF__os_users__sex__79C80F94]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__sex__79C80F94]  DEFAULT ('保密') FOR [sex]
GO
/****** Object:  Default [DF__os_users__telpho__7ABC33CD]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__telpho__7ABC33CD]  DEFAULT ('') FOR [telphone]
GO
/****** Object:  Default [DF__os_users__mobile__7BB05806]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__mobile__7BB05806]  DEFAULT ('') FOR [mobile]
GO
/****** Object:  Default [DF__os_users__qq__7CA47C3F]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__qq__7CA47C3F]  DEFAULT ('') FOR [qq]
GO
/****** Object:  Default [DF__os_users__safe_q__7D98A078]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__safe_q__7D98A078]  DEFAULT ('') FOR [safe_question]
GO
/****** Object:  Default [DF__os_users__safe_a__7E8CC4B1]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__safe_a__7E8CC4B1]  DEFAULT ('') FOR [safe_answer]
GO
/****** Object:  Default [DF__os_users__amount__7F80E8EA]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__amount__7F80E8EA]  DEFAULT ((0)) FOR [amount]
GO
/****** Object:  Default [DF__os_users__point__00750D23]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__point__00750D23]  DEFAULT ((0)) FOR [point]
GO
/****** Object:  Default [DF__os_users__exp__0169315C]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__exp__0169315C]  DEFAULT ((0)) FOR [exp]
GO
/****** Object:  Default [DF__os_users__status__025D5595]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__status__025D5595]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__os_users__reg_ti__035179CE]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users] ADD  CONSTRAINT [DF__os_users__reg_ti__035179CE]  DEFAULT (getdate()) FOR [reg_time]
GO
/****** Object:  Default [DF__os_manage__role___7720AD13]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_manager] ADD  CONSTRAINT [DF__os_manage__role___7720AD13]  DEFAULT ((2)) FOR [role_type]
GO
/****** Object:  Default [DF__os_manage__real___7814D14C]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_manager] ADD  CONSTRAINT [DF__os_manage__real___7814D14C]  DEFAULT ('') FOR [real_name]
GO
/****** Object:  Default [DF__os_manage__telep__7908F585]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_manager] ADD  CONSTRAINT [DF__os_manage__telep__7908F585]  DEFAULT ('') FOR [telephone]
GO
/****** Object:  Default [DF__os_manage__email__79FD19BE]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_manager] ADD  CONSTRAINT [DF__os_manage__email__79FD19BE]  DEFAULT ('') FOR [email]
GO
/****** Object:  Default [DF__os_manage__is_lo__7AF13DF7]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_manager] ADD  CONSTRAINT [DF__os_manage__is_lo__7AF13DF7]  DEFAULT ((0)) FOR [is_lock]
GO
/****** Object:  Default [DF__os_manage__add_t__7BE56230]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_manager] ADD  CONSTRAINT [DF__os_manage__add_t__7BE56230]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__os_articl__chann__0697FACD]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__chann__0697FACD]  DEFAULT ((0)) FOR [channel_id]
GO
/****** Object:  Default [DF__os_articl__categ__078C1F06]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__categ__078C1F06]  DEFAULT ((0)) FOR [category_id]
GO
/****** Object:  Default [DF__os_articl__call___0880433F]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__call___0880433F]  DEFAULT ('') FOR [call_index]
GO
/****** Object:  Default [DF__os_articl__link___09746778]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__link___09746778]  DEFAULT ('') FOR [link_url]
GO
/****** Object:  Default [DF__os_articl__img_u__0A688BB1]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__img_u__0A688BB1]  DEFAULT ('') FOR [img_url]
GO
/****** Object:  Default [DF__os_articl__seo_t__0B5CAFEA]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__seo_t__0B5CAFEA]  DEFAULT ('') FOR [seo_title]
GO
/****** Object:  Default [DF__os_articl__seo_k__0C50D423]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__seo_k__0C50D423]  DEFAULT ('') FOR [seo_keywords]
GO
/****** Object:  Default [DF__os_articl__seo_d__0D44F85C]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__seo_d__0D44F85C]  DEFAULT ('') FOR [seo_description]
GO
/****** Object:  Default [DF__os_articl__zhaiy__0E391C95]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__zhaiy__0E391C95]  DEFAULT ('') FOR [zhaiyao]
GO
/****** Object:  Default [DF__os_articl__sort___0F2D40CE]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__sort___0F2D40CE]  DEFAULT ((99)) FOR [sort_id]
GO
/****** Object:  Default [DF__os_articl__click__10216507]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__click__10216507]  DEFAULT ((0)) FOR [click]
GO
/****** Object:  Default [DF__os_articl__statu__11158940]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__statu__11158940]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__os_articl__group__1209AD79]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__group__1209AD79]  DEFAULT ('') FOR [groupids_view]
GO
/****** Object:  Default [DF__os_articl__vote___12FDD1B2]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__vote___12FDD1B2]  DEFAULT ((0)) FOR [vote_id]
GO
/****** Object:  Default [DF__os_articl__is_ms__13F1F5EB]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__is_ms__13F1F5EB]  DEFAULT ((0)) FOR [is_msg]
GO
/****** Object:  Default [DF__os_articl__is_to__14E61A24]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__is_to__14E61A24]  DEFAULT ((0)) FOR [is_top]
GO
/****** Object:  Default [DF__os_articl__is_re__15DA3E5D]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__is_re__15DA3E5D]  DEFAULT ((0)) FOR [is_red]
GO
/****** Object:  Default [DF__os_articl__is_ho__16CE6296]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__is_ho__16CE6296]  DEFAULT ((0)) FOR [is_hot]
GO
/****** Object:  Default [DF__os_articl__is_sl__17C286CF]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__is_sl__17C286CF]  DEFAULT ((0)) FOR [is_slide]
GO
/****** Object:  Default [DF__os_articl__is_sy__18B6AB08]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__is_sy__18B6AB08]  DEFAULT ((0)) FOR [is_sys]
GO
/****** Object:  Default [DF__os_articl__add_t__19AACF41]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article] ADD  CONSTRAINT [DF__os_articl__add_t__19AACF41]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__os_articl__sourc__3BFFE745]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_value] ADD  CONSTRAINT [DF__os_articl__sourc__3BFFE745]  DEFAULT ('') FOR [source]
GO
/****** Object:  Default [DF__os_articl__autho__3CF40B7E]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_value] ADD  CONSTRAINT [DF__os_articl__autho__3CF40B7E]  DEFAULT ('') FOR [author]
GO
/****** Object:  Default [DF__os_articl__goods__3DE82FB7]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_value] ADD  CONSTRAINT [DF__os_articl__goods__3DE82FB7]  DEFAULT ('') FOR [goods_no]
GO
/****** Object:  Default [DF__os_articl__stock__3EDC53F0]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_value] ADD  CONSTRAINT [DF__os_articl__stock__3EDC53F0]  DEFAULT ((0)) FOR [stock_quantity]
GO
/****** Object:  Default [DF__os_articl__marke__3FD07829]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_value] ADD  CONSTRAINT [DF__os_articl__marke__3FD07829]  DEFAULT ((0)) FOR [market_price]
GO
/****** Object:  Default [DF__os_articl__sell___40C49C62]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_value] ADD  CONSTRAINT [DF__os_articl__sell___40C49C62]  DEFAULT ((0)) FOR [sell_price]
GO
/****** Object:  Default [DF__os_articl__point__41B8C09B]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_value] ADD  CONSTRAINT [DF__os_articl__point__41B8C09B]  DEFAULT ((0)) FOR [point]
GO
/****** Object:  Default [DF__os_user_c__count__4A18FC72]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_code] ADD  CONSTRAINT [DF__os_user_c__count__4A18FC72]  DEFAULT ((0)) FOR [count]
GO
/****** Object:  Default [DF__os_user_c__statu__4B0D20AB]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_code] ADD  CONSTRAINT [DF__os_user_c__statu__4B0D20AB]  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__os_user_c__add_t__4C0144E4]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_code] ADD  CONSTRAINT [DF__os_user_c__add_t__4C0144E4]  DEFAULT (getdate()) FOR [add_time]
GO
/****** Object:  Default [DF__os_user_l__user___5D2BD0E6]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_login_log] ADD  CONSTRAINT [DF__os_user_l__user___5D2BD0E6]  DEFAULT ('') FOR [user_name]
GO
/****** Object:  Default [DF__os_user_l__remar__5E1FF51F]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_login_log] ADD  CONSTRAINT [DF__os_user_l__remar__5E1FF51F]  DEFAULT ('') FOR [remark]
GO
/****** Object:  Default [DF__os_user_l__login__5F141958]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_login_log] ADD  CONSTRAINT [DF__os_user_l__login__5F141958]  DEFAULT (getdate()) FOR [login_time]
GO
/****** Object:  Default [DF__os_user_l__login__60083D91]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_login_log] ADD  CONSTRAINT [DF__os_user_l__login__60083D91]  DEFAULT ('') FOR [login_ip]
GO
/****** Object:  ForeignKey [FK_os_MANAG_REFERENCE_os_MANAG]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_manager_role_value]  WITH CHECK ADD  CONSTRAINT [FK_os_MANAG_REFERENCE_os_MANAG] FOREIGN KEY([role_id])
REFERENCES [dbo].[os_manager_role] ([id])
GO
ALTER TABLE [dbo].[os_manager_role_value] CHECK CONSTRAINT [FK_os_MANAG_REFERENCE_os_MANAG]
GO
/****** Object:  ForeignKey [FK_os_USERS_REFERENCE_os_USER_]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_users]  WITH CHECK ADD  CONSTRAINT [FK_os_USERS_REFERENCE_os_USER_] FOREIGN KEY([group_id])
REFERENCES [dbo].[os_user_groups] ([id])
GO
ALTER TABLE [dbo].[os_users] CHECK CONSTRAINT [FK_os_USERS_REFERENCE_os_USER_]
GO
/****** Object:  ForeignKey [FK_os_MANAG_REFERENCE_os_MANAG_ROLE]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_manager]  WITH CHECK ADD  CONSTRAINT [FK_os_MANAG_REFERENCE_os_MANAG_ROLE] FOREIGN KEY([role_id])
REFERENCES [dbo].[os_manager_role] ([id])
GO
ALTER TABLE [dbo].[os_manager] CHECK CONSTRAINT [FK_os_MANAG_REFERENCE_os_MANAG_ROLE]
GO
/****** Object:  ForeignKey [FK_os_article_os_article_category]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article]  WITH CHECK ADD  CONSTRAINT [FK_os_article_os_article_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[os_article_category] ([id])
GO
ALTER TABLE [dbo].[os_article] CHECK CONSTRAINT [FK_os_article_os_article_category]
GO
/****** Object:  ForeignKey [FK_os_ARTIC_REFERENCE_os_ARTIC]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_article_attribute_value]  WITH CHECK ADD  CONSTRAINT [FK_os_ARTIC_REFERENCE_os_ARTIC] FOREIGN KEY([article_id])
REFERENCES [dbo].[os_article] ([id])
GO
ALTER TABLE [dbo].[os_article_attribute_value] CHECK CONSTRAINT [FK_os_ARTIC_REFERENCE_os_ARTIC]
GO
/****** Object:  ForeignKey [FK_os_USER__REFERENCE_os_USERS_CODE]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_code]  WITH CHECK ADD  CONSTRAINT [FK_os_USER__REFERENCE_os_USERS_CODE] FOREIGN KEY([user_id])
REFERENCES [dbo].[os_users] ([id])
GO
ALTER TABLE [dbo].[os_user_code] CHECK CONSTRAINT [FK_os_USER__REFERENCE_os_USERS_CODE]
GO
/****** Object:  ForeignKey [FK_os_USER__REFERENCE_os_USERS_LOG]    Script Date: 11/12/2015 14:42:52 ******/
ALTER TABLE [dbo].[os_user_login_log]  WITH CHECK ADD  CONSTRAINT [FK_os_USER__REFERENCE_os_USERS_LOG] FOREIGN KEY([user_id])
REFERENCES [dbo].[os_users] ([id])
GO
ALTER TABLE [dbo].[os_user_login_log] CHECK CONSTRAINT [FK_os_USER__REFERENCE_os_USERS_LOG]
GO
