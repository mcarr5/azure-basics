CREATE TABLE [dbo].[PostWordCount] (
    [Id]     INT            IDENTITY (1, 1) NOT NULL,
    [PostId] INT            NOT NULL,
    [Word]   NVARCHAR (128) NOT NULL,
    [Count]  INT            NOT NULL,
    CONSTRAINT [PK_PostWordCount] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PostWordCount_Post] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Post] ([Id])
);

