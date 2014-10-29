CREATE TABLE [dbo].[Blog] (
    [Id]     INT           IDENTITY (1, 1) NOT NULL,
    [UserId] INT           NOT NULL,
    [Name]   NVARCHAR (64) NOT NULL,
    CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Blog_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

