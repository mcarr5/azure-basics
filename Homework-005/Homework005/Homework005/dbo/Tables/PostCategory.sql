CREATE TABLE [dbo].[PostCategory] (
    [Id]     INT IDENTITY (1, 1) NOT NULL,
    [UserId] INT NOT NULL,
    CONSTRAINT [PK_PostCategory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PostCategory_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

