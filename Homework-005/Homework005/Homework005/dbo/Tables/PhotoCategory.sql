CREATE TABLE [dbo].[PhotoCategory] (
    [Id]     INT           IDENTITY (1, 1) NOT NULL,
    [UserId] INT           NOT NULL,
    [Name]   NVARCHAR (64) NOT NULL,
    CONSTRAINT [PK_PhotoCategory] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PhotoCategory_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

