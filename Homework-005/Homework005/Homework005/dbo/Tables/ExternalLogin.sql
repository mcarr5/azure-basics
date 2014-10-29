CREATE TABLE [dbo].[ExternalLogin] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [UserId]       INT            NULL,
    [ProviderName] NVARCHAR (128) NULL,
    [EmailAddress] NVARCHAR (128) NOT NULL,
    [FirstName]    NVARCHAR (128) NOT NULL,
    [LastName]     NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_ExternalLogin] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ExternalLogin_User] FOREIGN KEY ([Id]) REFERENCES [dbo].[User] ([Id])
);

