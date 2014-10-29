CREATE TABLE [dbo].[PhotoData] (
    [Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [PhotoId]              INT            NOT NULL,
    [ImageHeight]          INT            NOT NULL,
    [ImageWidth]           INT            NOT NULL,
    [VerticalResolution]   INT            NOT NULL,
    [HorizontalResolution] INT            NOT NULL,
    [Iso]                  FLOAT (53)     NOT NULL,
    [Aperture]             FLOAT (53)     NOT NULL,
    [ShutterSpeed]         FLOAT (53)     NOT NULL,
    [Rating]               FLOAT (53)     NOT NULL,
    [DateTaken]            DATETIME       NOT NULL,
    [DateDigitized]        DATETIME       NOT NULL,
    [CameraManufacturer]   NVARCHAR (256) NULL,
    [CameraModel]          NVARCHAR (128) NULL,
    [FocalLength]          NVARCHAR (64)  NULL,
    [ExposureBias]         NVARCHAR (64)  NULL,
    [MeteringMode]         NVARCHAR (128) NULL,
    [Orientation]          NVARCHAR (128) NULL,
    [Copyright]            NVARCHAR (128) NULL,
    CONSTRAINT [PK_PhotoData] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PhotoData_Photo] FOREIGN KEY ([PhotoId]) REFERENCES [dbo].[Photo] ([Id])
);

