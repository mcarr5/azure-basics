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
INSERT INTO [User] ([UserName]) VALUES ('MattC')
INSERT INTO [User] ([UserName]) Values ('JakeF')
INSERT INTO [User] ([UserName]) Values ('AaronN')
INSERT INTO [User] ([UserName]) Values ('NathanH')

INSERT INTO [Blog] ([Name], [UserId]) Values ('MattC''s Blog', '1')
INSERT INTO [Blog] ([Name], [UserId]) Values ('JakeF''s Blog', '2')
INSERT INTO [Blog] ([Name], [UserId]) Values ('AaronN''s Blog', '3')
INSERT INTO [Blog] ([Name], [UserId]) Values ('NathanH''s Blog', '4')

INSERT INTO [PostCategory] ([UserId]) Values ('1')
INSERT INTO [PostCategory] ([UserId]) Values ('2')
INSERT INTO [PostCategory] ([UserId]) Values ('3')
INSERT INTO [PostCategory] ([UserId]) Values ('4')

INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title]) Values ('1', '1', '1', 'This is my first blog post', 'My First Blog Post')
INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title]) Values ('2', '2', '2', 'This is my first blog post', 'My First Blog Post')
INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title]) Values ('3', '3', '3', 'This is my first blog post', 'My First Blog Post')
INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title]) Values ('4', '4', '4', 'This is my first blog post', 'My First Blog Post')
GO

GO
PRINT N'Update complete.';


GO
