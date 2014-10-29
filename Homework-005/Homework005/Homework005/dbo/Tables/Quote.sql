CREATE TABLE [dbo].[Quote] (
    [Id]     INT            IDENTITY (1, 1) NOT NULL,
    [UserId] INT            NOT NULL,
    [Text]   NTEXT          NOT NULL,
    [Author] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_Quote] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Quote_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

