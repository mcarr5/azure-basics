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

INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title], [DateCreated], [IsPublished], [UrlSlug]) Values ('1', '1', '1', 'This is my first blog post', 'My First Blog Post', '9-25-2014', 0, 'mattcsblog.com')
INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title], [DateCreated], [IsPublished], [UrlSlug]) Values ('2', '2', '2', 'This is my first blog post', 'My First Blog Post', '9-25-2014', 0, 'jakefsblog.com')
INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title], [DateCreated], [IsPublished], [UrlSlug]) Values ('3', '3', '3', 'This is my first blog post', 'My First Blog Post', '9-25-2014', 0, 'aaronnsblog.com')
INSERT INTO [Post] ([BlogId], [PostCategoryId], [UserId], [Content], [Title], [DateCreated], [IsPublished], [UrlSlug]) Values ('4', '4', '4', 'This is my first blog post', 'My First Blog Post', '9-25-2014', 0, 'nathanhsblog.com')
GO
