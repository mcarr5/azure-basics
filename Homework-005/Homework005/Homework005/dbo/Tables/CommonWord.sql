CREATE TABLE [dbo].[CommonWord] (
    [Id]   INT        IDENTITY (1, 1) NOT NULL,
    [Word] NCHAR (10) NOT NULL,
    CONSTRAINT [PK_CommonWord] PRIMARY KEY CLUSTERED ([Id] ASC)
);

