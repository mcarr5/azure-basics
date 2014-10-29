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
    CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Post_Blog] FOREIGN KEY ([BlogId]) REFERENCES [dbo].[Blog] ([Id]),
    CONSTRAINT [FK_Post_PostCategory] FOREIGN KEY ([PostCategoryId]) REFERENCES [dbo].[PostCategory] ([Id]),
    CONSTRAINT [FK_Post_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
);

