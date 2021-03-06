﻿/*
Deployment script for sqlazure

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "sqlazure"
:setvar DefaultFilePrefix "sqlazure"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [dbo].[Blog]...';


GO
CREATE TABLE [dbo].[Blog] (
    [Id]     INT           IDENTITY (1, 1) NOT NULL,
    [UserId] INT           NOT NULL,
    [Name]   NVARCHAR (64) NOT NULL,
    CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[CommonWord]...';


GO
CREATE TABLE [dbo].[CommonWord] (
    [Id]   INT        IDENTITY (1, 1) NOT NULL,
    [Word] NCHAR (10) NOT NULL,
    CONSTRAINT [PK_CommonWord] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ExternalLogin]...';


GO
CREATE TABLE [dbo].[ExternalLogin] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [UserId]       INT            NULL,
    [ProviderName] NVARCHAR (128) NULL,
    [EmailAddress] NVARCHAR (128) NOT NULL,
    [FirstName]    NVARCHAR (128) NOT NULL,
    [LastName]     NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_ExternalLogin] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Photo]...';


GO
CREATE TABLE [dbo].[Photo] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [PhotoCategoryId] INT            NOT NULL,
    [UserId]          INT            NOT NULL,
    [Name]            NVARCHAR (128) NOT NULL,
    [Description]     NTEXT          NULL,
    CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PhotoCategory]...';


GO
CREATE TABLE [dbo].[PhotoCategory] (
    [Id]     INT           IDENTITY (1, 1) NOT NULL,
    [UserId] INT           NOT NULL,
    [Name]   NVARCHAR (64) NOT NULL,
    CONSTRAINT [PK_PhotoCategory] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PhotoData]...';


GO
CREATE TABLE [dbo].[PhotoData] (
    [Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [PhotoId]              INT            NOT NULL,
    [ImageHeight]          INT            NOT NULL,
    [ImageWidth]           INT            NOT NULL,
    [VerticalResolution]   INT            NOT NULL,
    [HorizontalResolution] INT            NOT NULL,
    [Iso]                  FLOAT (53)     NOT NULL,
    [Aperture]             FLOAT (53)     NOT NULL,
    [ShutterSpeed]         FLOAT (53)     NOT NULL,
    [Rating]               FLOAT (53)     NOT NULL,
    [DateTaken]            DATETIME       NOT NULL,
    [DateDigitized]        DATETIME       NOT NULL,
    [CameraManufacturer]   NVARCHAR (256) NULL,
    [CameraModel]          NVARCHAR (128) NULL,
    [FocalLength]          NVARCHAR (64)  NULL,
    [ExposureBias]         NVARCHAR (64)  NULL,
    [MeteringMode]         NVARCHAR (128) NULL,
    [Orientation]          NVARCHAR (128) NULL,
    [Copyright]            NVARCHAR (128) NULL,
    CONSTRAINT [PK_PhotoData] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Post]...';


GO
CREATE TABLE [dbo].[Post] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [UserId]         INT            NOT NULL,
    [BlogId]         INT            NOT NULL,
    [PostCategoryId] INT            NOT NULL,
    [Rating]         FLOAT (53)     NULL,
    [Raters]         INT            NULL,
    [DateCreated]    DATETIME       NOT NULL,
    [DateModified]   DATETIME       NULL,
    [IsPublished]    BIT            NOT NULL,
    [EnableComments] BIT            NULL,
    [Title]          NVARCHAR (128) NOT NULL,
    [Excerpt]        NVARCHAR (256) NULL,
    [UrlSlug]        NVARCHAR (256) NOT NULL,
    [Content]        NTEXT          NOT NULL,
    CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PostCategory]...';


GO
CREATE TABLE [dbo].[PostCategory] (
    [Id]     INT IDENTITY (1, 1) NOT NULL,
    [UserId] INT NOT NULL,
    CONSTRAINT [PK_PostCategory] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PostWordCount]...';


GO
CREATE TABLE [dbo].[PostWordCount] (
    [Id]     INT            IDENTITY (1, 1) NOT NULL,
    [PostId] INT            NOT NULL,
    [Word]   NVARCHAR (128) NOT NULL,
    [Count]  INT            NOT NULL,
    CONSTRAINT [PK_PostWordCount] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Quote]...';


GO
CREATE TABLE [dbo].[Quote] (
    [Id]     INT            IDENTITY (1, 1) NOT NULL,
    [UserId] INT            NOT NULL,
    [Text]   NTEXT          NOT NULL,
    [Author] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_Quote] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Role]...';


GO
CREATE TABLE [dbo].[Role] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (64) NOT NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [UserName] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UserRole]...';


GO
CREATE TABLE [dbo].[UserRole] (
    [Id]     INT IDENTITY (1, 1) NOT NULL,
    [UserId] INT NOT NULL,
    [RoleId] INT NOT NULL,
    CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[WishList]...';


GO
CREATE TABLE [dbo].[WishList] (
    [Id]                 INT             IDENTITY (1, 1) NOT NULL,
    [UserId]             INT             NOT NULL,
    [WishListCategoryId] INT             NOT NULL,
    [WishListSiteId]     INT             NOT NULL,
    [WishListCompanyId]  INT             NOT NULL,
    [Name]               NVARCHAR (128)  NOT NULL,
    [Asin]               NVARCHAR (64)   NULL,
    [SiteUrl]            NVARCHAR (256)  NOT NULL,
    [ImageUrl]           NVARCHAR (256)  NOT NULL,
    [Price]              DECIMAL (18, 2) NOT NULL,
    [Quantity]           INT             NOT NULL,
    [Description]        NTEXT           NOT NULL,
    CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[WishListCategory]...';


GO
CREATE TABLE [dbo].[WishListCategory] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (64) NOT NULL,
    CONSTRAINT [PK_WishListCategory] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[WishListCompany]...';


GO
CREATE TABLE [dbo].[WishListCompany] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_WishListCompany] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[WishListSite]...';


GO
CREATE TABLE [dbo].[WishListSite] (
    [Id]      INT            IDENTITY (1, 1) NOT NULL,
    [Name]    NVARCHAR (64)  NOT NULL,
    [Website] NVARCHAR (128) NULL,
    CONSTRAINT [PK_WishListSite] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Blog_User]...';


GO
ALTER TABLE [dbo].[Blog] WITH NOCHECK
    ADD CONSTRAINT [FK_Blog_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ExternalLogin_User]...';


GO
ALTER TABLE [dbo].[ExternalLogin] WITH NOCHECK
    ADD CONSTRAINT [FK_ExternalLogin_User] FOREIGN KEY ([Id]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Photo_User]...';


GO
ALTER TABLE [dbo].[Photo] WITH NOCHECK
    ADD CONSTRAINT [FK_Photo_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PhotoCategory_UserId]...';


GO
ALTER TABLE [dbo].[PhotoCategory] WITH NOCHECK
    ADD CONSTRAINT [FK_PhotoCategory_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PhotoData_Photo]...';


GO
ALTER TABLE [dbo].[PhotoData] WITH NOCHECK
    ADD CONSTRAINT [FK_PhotoData_Photo] FOREIGN KEY ([PhotoId]) REFERENCES [dbo].[Photo] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Post_Blog]...';


GO
ALTER TABLE [dbo].[Post] WITH NOCHECK
    ADD CONSTRAINT [FK_Post_Blog] FOREIGN KEY ([BlogId]) REFERENCES [dbo].[Blog] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Post_PostCategory]...';


GO
ALTER TABLE [dbo].[Post] WITH NOCHECK
    ADD CONSTRAINT [FK_Post_PostCategory] FOREIGN KEY ([PostCategoryId]) REFERENCES [dbo].[PostCategory] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Post_User]...';


GO
ALTER TABLE [dbo].[Post] WITH NOCHECK
    ADD CONSTRAINT [FK_Post_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PostCategory_User]...';


GO
ALTER TABLE [dbo].[PostCategory] WITH NOCHECK
    ADD CONSTRAINT [FK_PostCategory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating [dbo].[FK_PostWordCount_Post]...';


GO
ALTER TABLE [dbo].[PostWordCount] WITH NOCHECK
    ADD CONSTRAINT [FK_PostWordCount_Post] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Post] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Quote_User]...';


GO
ALTER TABLE [dbo].[Quote] WITH NOCHECK
    ADD CONSTRAINT [FK_Quote_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating [dbo].[FK_UserRole_Role]...';


GO
ALTER TABLE [dbo].[UserRole] WITH NOCHECK
    ADD CONSTRAINT [FK_UserRole_Role] FOREIGN KEY ([Id]) REFERENCES [dbo].[Role] ([Id]);


GO
PRINT N'Creating [dbo].[FK_UserRole_User]...';


GO
ALTER TABLE [dbo].[UserRole] WITH NOCHECK
    ADD CONSTRAINT [FK_UserRole_User] FOREIGN KEY ([Id]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating [dbo].[FK_WishList_User]...';


GO
ALTER TABLE [dbo].[WishList] WITH NOCHECK
    ADD CONSTRAINT [FK_WishList_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]);


GO
PRINT N'Creating [dbo].[FK_WishList_WishListCategory]...';


GO
ALTER TABLE [dbo].[WishList] WITH NOCHECK
    ADD CONSTRAINT [FK_WishList_WishListCategory] FOREIGN KEY ([WishListCategoryId]) REFERENCES [dbo].[WishListCategory] ([Id]);


GO
PRINT N'Creating [dbo].[FK_WishList_WishListCompany]...';


GO
ALTER TABLE [dbo].[WishList] WITH NOCHECK
    ADD CONSTRAINT [FK_WishList_WishListCompany] FOREIGN KEY ([WishListCompanyId]) REFERENCES [dbo].[WishListCompany] ([Id]);


GO
PRINT N'Creating [dbo].[FK_WishList_WishListSite]...';


GO
ALTER TABLE [dbo].[WishList] WITH NOCHECK
    ADD CONSTRAINT [FK_WishList_WishListSite] FOREIGN KEY ([WishListSiteId]) REFERENCES [dbo].[WishListSite] ([Id]);


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
INSERT INTO [User] ([UserName]) VALUES ("MattC")
INSERT INTO [User] ([UserName]) Values ("JakeF")
INSERT INTO [User] ([UserName]) Values ("AaronN")
INSERT INTO [User] ([UserName]) Values ("NathanH")

INSERT INTO [Blog] ([Name], [UserId]) Values ("MattC's Blog", "1")
INSERT INTO [Blog] ([Name], [UserId]) Values ("JakeF's Blog", "2")
INSERT INTO [Blog] ([Name], [UserId]) Values ("AaronN's Blog", "3")
INSERT INTO [Blog] ([Name], [UserId]) Values ("NathanH's Blog", "4")

INSERT INTO [PostCategory] ([UserId]) Values ("1")
INSERT INTO [PostCategory] ([UserId]) Values ("2")
INSERT INTO [PostCategory] ([UserId]) Values ("3")
INSERT INTO [PostCategory] ([UserId]) Values ("4")

INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title]) Values ("1", "1", "1", "This is my first blog post", "My First Blog Post")
INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title]) Values ("2", "2", "2", "This is my first blog post", "My First Blog Post")
INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title]) Values ("3", "3", "3", "This is my first blog post", "My First Blog Post")
INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title]) Values ("4", "4", "4", "This is my first blog post", "My First Blog Post")
GO

GO
