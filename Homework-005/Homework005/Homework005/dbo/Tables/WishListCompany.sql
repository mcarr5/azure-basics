CREATE TABLE [dbo].[WishListCompany] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_WishListCompany] PRIMARY KEY CLUSTERED ([Id] ASC)
);

