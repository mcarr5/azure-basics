CREATE TABLE [dbo].[WishListCategory] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (64) NOT NULL,
    CONSTRAINT [PK_WishListCategory] PRIMARY KEY CLUSTERED ([Id] ASC)
);

