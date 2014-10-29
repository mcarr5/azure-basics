CREATE TABLE [dbo].[WishListSite] (
    [Id]      INT            IDENTITY (1, 1) NOT NULL,
    [Name]    NVARCHAR (64)  NOT NULL,
    [Website] NVARCHAR (128) NULL,
    CONSTRAINT [PK_WishListSite] PRIMARY KEY CLUSTERED ([Id] ASC)
);

