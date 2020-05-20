USE [master]
GO
/****** Object:  Database [LEnglishDB]    Script Date: 5/20/2020 3:53:11 PM ******/
CREATE DATABASE [LEnglishDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LEnglishDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\LEnglishDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LEnglishDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\LEnglishDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LEnglishDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LEnglishDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LEnglishDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LEnglishDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LEnglishDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LEnglishDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LEnglishDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LEnglishDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LEnglishDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LEnglishDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LEnglishDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LEnglishDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LEnglishDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LEnglishDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LEnglishDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LEnglishDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LEnglishDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LEnglishDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LEnglishDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LEnglishDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LEnglishDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LEnglishDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LEnglishDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LEnglishDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LEnglishDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LEnglishDB] SET  MULTI_USER 
GO
ALTER DATABASE [LEnglishDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LEnglishDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LEnglishDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LEnglishDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LEnglishDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LEnglishDB', N'ON'
GO
ALTER DATABASE [LEnglishDB] SET QUERY_STORE = OFF
GO
USE [LEnglishDB]
GO
/****** Object:  Table [dbo].[BaiTap]    Script Date: 5/20/2020 3:53:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiTap](
	[MaBaiTap] [nvarchar](20) NOT NULL,
	[TenBaiTap] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[DanhMuc] [nvarchar](10) NULL,
	[MoTa] [nvarchar](max) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_bai_tap] PRIMARY KEY CLUSTERED 
(
	[MaBaiTap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BangDiem]    Script Date: 5/20/2020 3:53:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangDiem](
	[MaBangDiem] [int] NOT NULL,
	[MaBaiTap] [nvarchar](20) NOT NULL,
	[TenDangNhap] [nvarchar](30) NOT NULL,
	[SoCauHoi] [int] NULL,
	[SoCauDung] [int] NULL,
	[Diem] [float] NULL,
	[TinhTrang] [nvarchar](20) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_bang_diem] PRIMARY KEY CLUSTERED 
(
	[MaBangDiem] ASC,
	[MaBaiTap] ASC,
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CapBac]    Script Date: 5/20/2020 3:53:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CapBac](
	[MaCapBac] [nvarchar](20) NOT NULL,
	[TenCapBac] [nvarchar](30) NOT NULL,
	[MoTa] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_cap_bac] PRIMARY KEY CLUSTERED 
(
	[MaCapBac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHoi]    Script Date: 5/20/2020 3:53:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi](
	[MaCauHoi] [nvarchar](20) NOT NULL,
	[CauHoi] [nvarchar](max) NULL,
	[CauTraLoi] [nvarchar](max) NULL,
	[DapAn] [nvarchar](max) NULL,
	[BaiTap] [nvarchar](20) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_cau_hoi] PRIMARY KEY CLUSTERED 
(
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 5/20/2020 3:53:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [nvarchar](10) NOT NULL,
	[TenDanhMuc] [nvarchar](30) NOT NULL,
	[CapBac] [nvarchar](20) NULL,
	[MoTa] [nvarchar](100) NULL,
	[GhiChu] [nchar](100) NULL,
 CONSTRAINT [PK_danh_muc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 5/20/2020 3:53:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] NOT NULL,
	[TenDangNhap] [nvarchar](30) NOT NULL,
	[MatKhau] [nvarchar](30) NOT NULL,
	[TenNguoiDung] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [nvarchar](30) NULL,
 CONSTRAINT [PK_nguoi_dung] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BaiTap] ([MaBaiTap], [TenBaiTap], [NoiDung], [DanhMuc], [MoTa], [GhiChu]) VALUES (N'D-TEC50-1', N'Bài đọc 1 TOEIC500', N'Jean spent her first few years in Hooper and her family moved to Otsego early in her life. She was only ten when her father died unexpectedly, leaving her mother to raise and support their family alone. Her mother soon went to work outside the home to provide for the family, and Jean, being one of the oldest, had to help care for her younger siblings. Although she had much responsibility at home, Jean thoroughly enjoyed school and was an excellent student. She went on to graduate 10th in her class at Otsego High School in 1953.
While still in high school, Jean met a young man named Charles "Chuck" Holly, at a dance in Alamo; and they were quite taken with each other. Over the next few years, their love for each other blossomed and they were married on February 24, 1953, while Jean was still in school. At the time, Chuck was serving his country in the military, and had come home on leave to marry his sweetheart. Unfortunately, shortly thereafter, he was sent overseas to serve in Korea for the next fifteen months.
Upon his discharge, the couple settled into married life together in the Plainwell, Otsego area. To help make ends meet, Jean went to work at the collection bureau in Kalamazoo for a while, before taking a job at the cheese company in Otsego. In 1964, Chuck and Jean were overjoyed with the birth of their son, Chuck, who brought great joy into their lives. Jean remembered how her mother was always gone so much working after her father died and she did not want that for her son, so she left her job to devote herself to the role of a mother.', N'D-TEC50', NULL, NULL)
INSERT [dbo].[BangDiem] ([MaBangDiem], [MaBaiTap], [TenDangNhap], [SoCauHoi], [SoCauDung], [Diem], [TinhTrang], [GhiChu]) VALUES (1, N'D-TEC50-1', N'nbdat', 5, NULL, NULL, N'Unfinished', NULL)
INSERT [dbo].[BangDiem] ([MaBangDiem], [MaBaiTap], [TenDangNhap], [SoCauHoi], [SoCauDung], [Diem], [TinhTrang], [GhiChu]) VALUES (2, N'D-TEC50-1', N'nxhung', 5, 5, 10, N'Finished', NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'ILS4', N'IELTS 4.0', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'ILS5', N'IELTS 5.5', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'ILS7', N'IELTS 7.0', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'MVR1', N'Mover 1', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'MVR2', N'Mover 2', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'STR1', N'Starter 1', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'STR2', N'Starter 2', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'TEC35', N'TOEIC 350', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'TEC50', N'TOEIC 500', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'TEC75', N'TOEIC 750', NULL, NULL)
INSERT [dbo].[CapBac] ([MaCapBac], [TenCapBac], [MoTa], [GhiChu]) VALUES (N'TEC90', N'TOEIC 950', NULL, NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [CauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC50-1-1', N'1. Before Jean''s father passed away, her mother used to', N'work outside the home/be a housewife/support the family alone/work as a secretary', N'be a housewife ', N'D-TEC50-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [CauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC50-1-2', N'2. Which is not referred to Jean?', N'She was a responsible girl./She never helped her mother with household chores./She often did well at school./She went to high school.', N'She never helped her mother with household chores.', N'D-TEC50-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [CauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC50-1-3', N'3. Jean''s husband was a _______.', N'teacher/dancer/soldier/servant', N'soldier ', N'D-TEC50-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [CauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC50-1-4', N'4. Jean _______.', N'served in the military/lived in Korea for fifteen months/had a daughter/got married when she was a student', N'got married when she was a student', N'D-TEC50-1', NULL)
INSERT [dbo].[CauHoi] ([MaCauHoi], [CauHoi], [CauTraLoi], [DapAn], [BaiTap], [GhiChu]) VALUES (N'D-TEC50-1-5', N'5. Which is not true about Jean?', N'She disliked staying at home and taking care of her child./She worked outside the home before she had a child./She was very happy when she got a baby./She quit her job to look after her baby.', N'She disliked staying at home and taking care of her child.', N'D-TEC50-1', NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-ILS4', N'Đọc ILS4', N'ILS4', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-ILS5', N'Đọc ILS5', N'ILS5', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-ILS7', N'Đọc ILS7', N'ILS7', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-MVR1', N'Đọc MVR1', N'MVR1', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-MVR2', N'Đọc MVR2', N'MVR2', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-STR1', N'Đọc STR1', N'STR1', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-STR2', N'Đọc STR2', N'STR2', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-TEC35', N'Đọc TEC35', N'TEC35', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-TEC50', N'Đọc TEC50', N'TEC50', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-TEC75', N'Đọc TEC75', N'TEC75', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'D-TEC90', N'Đọc TEC90', N'TEC90', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-ILS4', N'Nghe ILS4', N'ILS4', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-ILS5', N'Nghe ILS5', N'ILS5', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-ILS7', N'Nghe ILS7', N'ILS7', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-MVR1', N'Nghe MVR1', N'MVR1', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-MVR2', N'Nghe MVR2', N'MVR2', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-STR1', N'Nghe STR1', N'STR1', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-STR2', N'Nghe STR2', N'STR2', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-TEC35', N'Nghe TEC35', N'TEC35', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-TEC50', N'Nghe TEC50', N'TEC50', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-TEC75', N'Nghe TEC75', N'TEC75', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'N-TEC90', N'Nghe TEC90', N'TEC90', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-ILS4', N'Viết ILS4', N'ILS4', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-ILS5', N'Viết ILS5', N'ILS5', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-ILS7', N'Viết ILS7', N'ILS7', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-TEC35', N'Viết TEC35', N'TEC35', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-TEC50', N'Viết TEC50', N'TEC50', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-TEC75', N'Viết TEC75', N'TEC75', NULL, NULL)
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc], [CapBac], [MoTa], [GhiChu]) VALUES (N'V-TEC90', N'Viết TEC90', N'TEC90', NULL, NULL)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [GioiTinh], [NgaySinh], [Email]) VALUES (1, N'nbdat', N'dat123', N'Ba Dat', N'Nam', CAST(N'1999-07-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [GioiTinh], [NgaySinh], [Email]) VALUES (2, N'dqminh', N'minh123', N'Dang Minh', N'Nam', CAST(N'1999-08-16T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [GioiTinh], [NgaySinh], [Email]) VALUES (3, N'dqdong', N'dong123', N'Quy Dong', N'Nam', CAST(N'1999-04-24T00:00:00.000' AS DateTime), N'quydong123@gmail.com')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [GioiTinh], [NgaySinh], [Email]) VALUES (4, N'nxhung', N'hung123', N'Xuan Hung', N'Nữ', CAST(N'1999-10-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenDangNhap], [MatKhau], [TenNguoiDung], [GioiTinh], [NgaySinh], [Email]) VALUES (5, N'vvnminh', N'minh123', N'Nhat Minh', N'Nam', CAST(N'1999-04-27T00:00:00.000' AS DateTime), NULL)
SET ANSI_PADDING ON
GO
/****** Object:  Index [u_tendangnhap]    Script Date: 5/20/2020 3:53:11 PM ******/
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [u_tendangnhap] UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [LEnglishDB] SET  READ_WRITE 
GO
