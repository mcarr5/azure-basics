CREATE TABLE [dbo].[WishList] (
    [Id]                 INT             IDENTITY (1, 1) NOT NULL,
    [UserId]             INT             NOT NULL,
    [WishListCategoryId] INT             NOT NULL,
    [WishListSiteId]     INT             NOT NULL,
    [WishListCompanyId]  INT             NOT NULL,
    [Name]               NVARCHAR (128)  NOT NULL,
    [Asin]               NVARCHAR (64)   NULL,
    [SiteUrl]            NVARCHAR (256)  NOT NULL,
    [ImageUrl]           NVARCHAR (256)  NOT NULL,
    [Price]              DECIMAL (18, 2) NOT NULL,
    [Quantity]           INT             NOT NULL,
    [Description]        NTEXT           NOT NULL,
    CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WishList_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_WishList_WishListCategory] FOREIGN KEY ([WishListCategoryId]) REFERENCES [dbo].[WishListCategory] ([Id]),
    CONSTRAINT [FK_WishList_WishListCompany] FOREIGN KEY ([WishListCompanyId]) REFERENCES [dbo].[WishListCompany] ([Id]),
    CONSTRAINT [FK_WishList_WishListSite] FOREIGN KEY ([WishListSiteId]) REFERENCES [dbo].[WishListSite] ([Id])
);

