CREATE TABLE [dbo].[Photo] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [PhotoCategoryId] INT            NOT NULL,
    [UserId]          INT            NOT NULL,
    [Name]            NVARCHAR (128) NOT NULL,
    [Description]     NTEXT          NULL,
    CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Photo_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

