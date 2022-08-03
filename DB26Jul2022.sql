USE [master]
GO
/****** Object:  Database [FuelQuote]    Script Date: 7/26/2022 10:57:46 PM ******/
CREATE DATABASE [FuelQuote]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FuelQuote', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FuelQuote.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FuelQuote_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FuelQuote_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FuelQuote] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FuelQuote].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FuelQuote] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FuelQuote] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FuelQuote] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FuelQuote] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FuelQuote] SET ARITHABORT OFF 
GO
ALTER DATABASE [FuelQuote] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FuelQuote] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FuelQuote] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FuelQuote] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FuelQuote] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FuelQuote] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FuelQuote] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FuelQuote] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FuelQuote] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FuelQuote] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FuelQuote] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FuelQuote] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FuelQuote] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FuelQuote] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FuelQuote] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FuelQuote] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FuelQuote] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FuelQuote] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FuelQuote] SET  MULTI_USER 
GO
ALTER DATABASE [FuelQuote] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FuelQuote] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FuelQuote] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FuelQuote] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FuelQuote] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FuelQuote] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FuelQuote] SET QUERY_STORE = OFF
GO
USE [FuelQuote]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientsMaster]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientsMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[FullName] [nvarchar](50) NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](2) NULL,
	[Zipcode] [nvarchar](9) NULL,
	[PasswordHash] [nvarchar](500) NULL,
	[Role] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuelQuoteMaster]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelQuoteMaster](
	[FuelId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[GallonsRequested] [int] NULL,
	[DeliveryDate] [date] NULL,
	[SuggestedPrice] [numeric](18, 3) NULL,
	[TotalAmountDue] [numeric](18, 3) NULL,
	[DiliveryAddress] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_FuelQuoteMaster] PRIMARY KEY CLUSTERED 
(
	[FuelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceMaster]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceMaster](
	[PriceId] [int] NOT NULL,
	[GallonUnit] [int] NULL,
	[Amount] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PriceMaster] PRIMARY KEY CLUSTERED 
(
	[PriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[Id] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Token] [text] NULL,
	[CreatedByIp] [text] NULL,
	[RevokedByIp] [text] NULL,
	[ReplacedByToken] [text] NULL,
	[Expires] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Revoked] [datetime] NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_RefreshToken_AccountId]    Script Date: 7/26/2022 10:57:47 PM ******/
CREATE NONCLUSTERED INDEX [IX_RefreshToken_AccountId] ON [dbo].[RefreshToken]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FuelQuoteMaster] ADD  CONSTRAINT [DF_FuelQuoteMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[FuelQuoteMaster]  WITH CHECK ADD  CONSTRAINT [FK_FuelQuoteMaster_ClientsMaster] FOREIGN KEY([ClientId])
REFERENCES [dbo].[ClientsMaster] ([Id])
GO
ALTER TABLE [dbo].[FuelQuoteMaster] CHECK CONSTRAINT [FK_FuelQuoteMaster_ClientsMaster]
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[ClientsMaster] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_Accounts_AccountId]
GO
/****** Object:  StoredProcedure [dbo].[Client_Register]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_Register]
(
  @UserName nvarchar(50),
  @PasswordHash nvarchar(500)
)
AS
BEGIN
	declare @clientCount int
	declare @Role int
	select @clientCount=count(Id) from ClientsMaster

	if(@clientCount > 0)
	set @Role=2
	else
	set @Role=1
    
	INSERT INTO [ClientsMaster]
      ([Role],[UserName],[PasswordHash],Created)
    VALUES
      (@Role,@UserName,@PasswordHash,getdate());
      SELECT * FROM ClientsMaster WHERE [ID] = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Client_ups]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_ups]
(
  @ID int=NULL,
  @UserName nvarchar(50)=NULL,
  @FullName nvarchar(50)=NULL,
  @Address1 nvarchar(100)=NULL,
  @Address2 nvarchar(100)=NULL,
  @City nvarchar(100)=NULL,
  @State nvarchar(2)=NULL,
  @Zipcode nvarchar(9)=NULL,
  @PasswordHash nvarchar(500)=NULL
)
AS
BEGIN
  IF @ID IS NULL OR @ID = 0
    BEGIN
      INSERT INTO [ClientsMaster]
        ([UserName],[FullName],[Address1],[Address2],[City],[State],[Zipcode],[PasswordHash])
      VALUES
        (@UserName,@FullName,@Address1,@Address2,@City,@State,@Zipcode,@PasswordHash);
        SELECT * FROM ClientsMaster WHERE [ID] = SCOPE_IDENTITY();
    END
  ELSE
    BEGIN
      UPDATE [dbo].[ClientsMaster]
        SET 
		[FullName]=@FullName,
		[Address1]=@Address1,
		[Address2]=@Address2,
		[City]=@City,
		[State]=@State,
		[Zipcode]=@Zipcode,
		[Updated]=getdate()
        WHERE ([Id] = @ID);

        SELECT * FROM ClientsMaster WHERE [ID] = @ID;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[generateModelClassfromTable]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[generateModelClassfromTable]
@TableNamee varchar(50)
AS
BEGIN
	declare @TableName sysname = @TableNamee
	declare @Result varchar(max) = 'public class ' + @TableName + '
	{'
	
	select @Result = @Result + '
	    public ' + ColumnType + NullableSign + ' ' + ColumnName + ' { get; set; }
	'
	from
	(
	    select 
	        replace(col.name, ' ', '_') ColumnName,
	        column_id ColumnId,
	        case typ.name 
	            when 'bigint' then 'long'
	            when 'binary' then 'byte[]'
	            when 'bit' then 'bool'
	            when 'char' then 'string'
	            when 'date' then 'DateTime'
	            when 'datetime' then 'DateTime'
	            when 'datetime2' then 'DateTime'
	            when 'datetimeoffset' then 'DateTimeOffset'
	            when 'decimal' then 'decimal'
	            when 'float' then 'double'
	            when 'image' then 'byte[]'
	            when 'int' then 'int'
	            when 'money' then 'decimal'
	            when 'nchar' then 'string'
	            when 'ntext' then 'string'
	            when 'numeric' then 'decimal'
	            when 'nvarchar' then 'string'
	            when 'real' then 'double'
	            when 'smalldatetime' then 'DateTime'
	            when 'smallint' then 'short'
	            when 'smallmoney' then 'decimal'
	            when 'text' then 'string'
	            when 'time' then 'TimeSpan'
	            when 'timestamp' then 'DateTime'
	            when 'tinyint' then 'byte'
	            when 'uniqueidentifier' then 'Guid'
	            when 'varbinary' then 'byte[]'
	            when 'varchar' then 'string'
	            else 'UNKNOWN_' + typ.name
	        end ColumnType,
	        case 
	            when col.is_nullable = 1 and typ.name in ('bigint', 'bit', 'date', 'datetime', 'datetime2', 'datetimeoffset', 'decimal', 'float', 'int', 'money', 'numeric', 'real', 'smalldatetime', 'smallint', 'smallmoney', 'time', 'tinyint', 'uniqueidentifier') 
	            then '?' 
	            else '' 
	        end NullableSign
	    from sys.columns col
	        join sys.types typ on
	            col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
	    where object_id = object_id(@TableName)
	) t
	order by ColumnId
	
	set @Result = @Result  + '
	}'

print @Result
print '---------------VB-------------------'

declare @prop varchar(max)
PRINT 'Public Class ' + @TableName
declare props cursor for
select distinct ' public property ' + ColumnName + ' AS ' + ColumnType AS prop
from ( 
    select  
        replace(col.name, ' ', '_') ColumnName,  column_id, 
        case typ.name  
            when 'bigint' then 'long' 
            when 'binary' then 'byte[]' 
            when 'bit' then 'boolean' 
            when 'char' then 'string' 
            when 'date' then 'DateTime' 
            when 'datetime' then 'DateTime' 
            when 'datetime2' then 'DateTime' 
            when 'datetimeoffset' then 'DateTimeOffset' 
            when 'decimal' then 'decimal' 
            when 'float' then 'float' 
            when 'image' then 'byte[]' 
            when 'int' then 'integer' 
            when 'money' then 'decimal' 
            when 'nchar' then 'char' 
            when 'ntext' then 'string' 
            when 'numeric' then 'decimal' 
            when 'nvarchar' then 'string' 
            when 'real' then 'double' 
            when 'smalldatetime' then 'DateTime' 
            when 'smallint' then 'short' 
            when 'smallmoney' then 'decimal' 
            when 'text' then 'string' 
            when 'time' then 'TimeSpan' 
            when 'timestamp' then 'DateTime' 
            when 'tinyint' then 'byte' 
            when 'uniqueidentifier' then 'Guid' 
            when 'varbinary' then 'byte[]' 
            when 'varchar' then 'string' 
        end ColumnType 
    from sys.columns col join sys.types typ on col.system_type_id = typ.system_type_id 
    where object_id = object_id(@TableName) 
) t 
order by prop
open props
FETCH NEXT FROM props INTO @prop
WHILE @@FETCH_STATUS = 0
BEGIN
    print @prop
    FETCH NEXT FROM props INTO @prop
END
close props
DEALLOCATE props
PRINT 'End Class'

END
--generateModelClassfromTable 'CountryCodeMaster'
GO
/****** Object:  StoredProcedure [dbo].[spCheckUserName]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spCheckUserName]
@UserName nvarchar(50)
AS
BEGIN
	select * from ClientsMaster where
	UserName=@UserName
END
GO
/****** Object:  StoredProcedure [dbo].[spGetFuelHistory]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spGetFuelHistory]
@ClientId int,
@RoleId int
AS
BEGIN
If @RoleId=1
BEGIn

SELECT [FuelId]
      ,[ClientId]
      ,[GallonsRequested]
      ,[DeliveryDate]
      ,[SuggestedPrice]
      ,[TotalAmountDue]
      ,[DiliveryAddress]
      ,[CreatedDate],
	   isnull(b.FullName,b.UserName) as ClientName
  FROM FuelQuoteMaster as a,
  ClientsMaster as b
  where
  a.clientId=b.Id 
END
else
BEGIN
		SELECT [FuelId]
      ,[ClientId]
      ,[GallonsRequested]
      ,[DeliveryDate]
      ,[SuggestedPrice]
      ,[TotalAmountDue]
      ,[DiliveryAddress]
      ,[CreatedDate],
	   isnull(b.FullName,b.UserName) as ClientName
  FROM FuelQuoteMaster as a,
  ClientsMaster as b
  where
  a.clientId=b.Id and
  a.clientid=@ClientId
END

END
GO
/****** Object:  StoredProcedure [dbo].[spLoginCheck]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spLoginCheck]
@UserName nvarchar(50),
@PasswordHash nvarchar(500)
AS
BEGIN
	select * from ClientsMaster where
	UserName=@UserName
END
--spLoginCheck 'sankyn2','$2a$11$ojOw/M3apqimSUn3OVenk.CShrC3dPFLZ4F6YJC7l24r4uprn7s8u'
GO
/****** Object:  StoredProcedure [dbo].[usp_FuelQuoteMasterInsert]    Script Date: 7/26/2022 10:57:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_FuelQuoteMasterInsert] 
    @ClientId int = NULL,
    @GallonsRequested int = NULL,
    @DeliveryDate date = NULL,
    @SuggestedPrice numeric(18,3),
    @TotalAmountDue numeric(18,3),
    @DiliveryAddress nvarchar(200) = NULL
AS 
	SET NOCOUNT ON 

	BEGIN TRAN
	
	INSERT INTO [dbo].[FuelQuoteMaster] ([ClientId], [GallonsRequested], [DeliveryDate], [SuggestedPrice], [TotalAmountDue], [DiliveryAddress], [CreatedDate])
	SELECT @ClientId, @GallonsRequested, @DeliveryDate, @SuggestedPrice, @TotalAmountDue, @DiliveryAddress, GetDate()
	
	-- Begin Return Select <- do not remove
	SELECT [FuelId], [ClientId], [GallonsRequested], [DeliveryDate], [SuggestedPrice], [TotalAmountDue], [DiliveryAddress], [CreatedDate]
	FROM   [dbo].[FuelQuoteMaster]
	WHERE  [FuelId] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
USE [master]
GO
ALTER DATABASE [FuelQuote] SET  READ_WRITE 
GO
