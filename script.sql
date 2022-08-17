USE [master]
GO
/****** Object:  Database [Quanlyhocsinh]    Script Date: 8/17/2022 11:04:22 PM ******/
CREATE DATABASE [Quanlyhocsinh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Quanlyhocsinh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\Quanlyhocsinh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Quanlyhocsinh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\Quanlyhocsinh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Quanlyhocsinh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Quanlyhocsinh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Quanlyhocsinh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET ARITHABORT OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Quanlyhocsinh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Quanlyhocsinh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Quanlyhocsinh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Quanlyhocsinh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET RECOVERY FULL 
GO
ALTER DATABASE [Quanlyhocsinh] SET  MULTI_USER 
GO
ALTER DATABASE [Quanlyhocsinh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Quanlyhocsinh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Quanlyhocsinh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Quanlyhocsinh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Quanlyhocsinh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Quanlyhocsinh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Quanlyhocsinh', N'ON'
GO
ALTER DATABASE [Quanlyhocsinh] SET QUERY_STORE = OFF
GO
USE [Quanlyhocsinh]
GO
/****** Object:  Table [dbo].[tbl_DanhMucLoi]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DanhMucLoi](
	[MaLoi] [int] IDENTITY(1,1) NOT NULL,
	[TenLoi] [nvarchar](50) NULL,
	[Diem] [nvarchar](20) NULL,
	[GhiChu] [text] NULL,
	[Status] [nvarchar](20) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_DanhMucLoi] PRIMARY KEY CLUSTERED 
(
	[MaLoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_GiaoVien]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_GiaoVien](
	[MaGV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_GiaoVien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_GiaoVien_Lop]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_GiaoVien_Lop](
	[MaGV_Lop] [int] IDENTITY(1,1) NOT NULL,
	[MaGV] [int] NULL,
	[MaLop] [int] NULL,
	[MaNamHoc] [int] NULL,
	[MaHK] [int] NULL,
 CONSTRAINT [PK_tbl_GiaoVien_Lop] PRIMARY KEY CLUSTERED 
(
	[MaGV_Lop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_HocKy]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HocKy](
	[MaHK] [int] IDENTITY(1,1) NOT NULL,
	[TenHK] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_HocKy] PRIMARY KEY CLUSTERED 
(
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_HocSinh]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_HocSinh](
	[MaHS] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Ten] [nvarchar](30) NULL,
	[GioiTinh] [nvarchar](30) NULL,
	[DienThoai] [nvarchar](30) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[MaDT] [int] NULL,
	[MaTG] [int] NULL,
	[MaLop] [int] NULL,
	[GhiChu] [text] NULL,
	[DaNghiHoc] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_tbl_HocSinh] PRIMARY KEY CLUSTERED 
(
	[MaHS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_KetQua]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_KetQua](
	[MaKQ] [int] IDENTITY(1,1) NOT NULL,
	[MaMH] [int] NULL,
	[MaHS] [int] NULL,
	[DiemTK] [float] NULL,
	[DiemThiLan1] [float] NULL,
	[DiemThiLan2] [float] NULL,
	[DiemTB] [float] NULL,
	[XepLoai] [nvarchar](20) NULL,
	[MaNamHoc] [int] NULL,
	[MaHocKy] [int] NULL,
	[MaLop] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_KetQua] PRIMARY KEY CLUSTERED 
(
	[MaKQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Lop]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Lop](
	[MaLop] [int] IDENTITY(1,1) NOT NULL,
	[TenLop] [nvarchar](250) NULL,
	[GhiChu] [text] NULL,
	[SapXep] [nvarchar](250) NULL,
	[MaTruong] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_MonHoc]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_MonHoc](
	[MaMH] [int] IDENTITY(1,1) NOT NULL,
	[TenMH] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_MonHoc] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_NamHoc]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NamHoc](
	[MaNamHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenNamHoc] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_NamHoc] PRIMARY KEY CLUSTERED 
(
	[MaNamHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Truong]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Truong](
	[MaTruong] [int] IDENTITY(1,1) NOT NULL,
	[TenTruong] [nvarchar](250) NULL,
	[Email] [nvarchar](30) NULL,
	[DienThoai] [nvarchar](30) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[Website] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Truong] PRIMARY KEY CLUSTERED 
(
	[MaTruong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[MATruong] [int] NULL,
	[MaLop] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [text] NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ViPham]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ViPham](
	[MaViPham] [int] IDENTITY(1,1) NOT NULL,
	[NgayViPham] [datetime] NULL,
	[TongSoLoi] [int] NULL,
	[TongDiem] [int] NULL,
	[MaLop] [int] NULL,
	[MaNamHoc] [int] NULL,
	[MaHK] [int] NULL,
	[GhiChu] [text] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[DeletedBy] [int] NULL,
	[DeletedDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_ViPham] PRIMARY KEY CLUSTERED 
(
	[MaViPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ViPham_CT]    Script Date: 8/17/2022 11:04:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ViPham_CT](
	[MaVPCT] [int] IDENTITY(1,1) NOT NULL,
	[MaViPham] [int] NULL,
	[MaLoi] [int] NULL,
	[TenLoi] [nvarchar](50) NULL,
	[Diem] [float] NULL,
	[MaHS] [int] NULL,
	[NgayViPham] [datetime] NULL,
 CONSTRAINT [PK_tbl_ViPham_CT] PRIMARY KEY CLUSTERED 
(
	[MaVPCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON 

INSERT [dbo].[tbl_User] ([UID], [username], [fullname], [password], [MATruong], [MaLop], [Phone], [Email], [Address]) VALUES (1, N'cuongpham2107', N'Cuongpham', N'Cuonggiun1', 1, 1, N'0984559557', N'cuongpham2107@gmail.com', N'Ninh Binh')
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
GO
USE [master]
GO
ALTER DATABASE [Quanlyhocsinh] SET  READ_WRITE 
GO
