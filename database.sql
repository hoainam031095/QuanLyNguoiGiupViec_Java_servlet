USE [master]
GO
/****** Object:  Database [GrabOsin]    Script Date: 16/12/2018 10:53:31 ******/
CREATE DATABASE [GrabOsin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GrabOsin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\GrabOsin.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GrabOsin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\GrabOsin_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GrabOsin] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GrabOsin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GrabOsin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GrabOsin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GrabOsin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GrabOsin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GrabOsin] SET ARITHABORT OFF 
GO
ALTER DATABASE [GrabOsin] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GrabOsin] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [GrabOsin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GrabOsin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GrabOsin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GrabOsin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GrabOsin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GrabOsin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GrabOsin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GrabOsin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GrabOsin] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GrabOsin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GrabOsin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GrabOsin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GrabOsin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GrabOsin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GrabOsin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GrabOsin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GrabOsin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GrabOsin] SET  MULTI_USER 
GO
ALTER DATABASE [GrabOsin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GrabOsin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GrabOsin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GrabOsin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [GrabOsin]
GO
/****** Object:  StoredProcedure [dbo].[GrabOsin_layDanhSachDangKyDichVuTheoMaNguoiDung]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GrabOsin_layDanhSachDangKyDichVuTheoMaNguoiDung]
(
	@maNguoiDung nvarchar(10)
)
as
begin
	select * from DangKyDichVu
	where MaNguoiDung =@maNguoiDung
end



GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_demDangKyDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GrapOsin_demDangKyDichVu]
as
begin
	select count(*) from DangKyDichVu
end






GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_demDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GrapOsin_demDichVu]
as
begin
	select COUNT(*) from DichVu
end







GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_demSoLanLamViecCTV]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GrapOsin_demSoLanLamViecCTV]
@maCongTacVien nvarchar(10)
as
begin
	select count(*) 
	from CongTacVien ctv 
		inner join DangKyDichVu dk on ctv.MaCTV = dk.MaCTV 
	where dk.TrangThai = 3 and ctv.MaCTV = @maCongTacVien
	group by ctv.MaCTV
end






GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layDanhSachDangKyDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_layDanhSachDangKyDichVu]
as
begin
	select dk.MaDangKy,dk.MaDichVu,dv.TenDichVu,dv.DonGia, dv.MoTa ,dk.SoDienThoai,dk.DiaDiem, Convert(nvarchar,CONVERT(date,NgayLam,106),105) as NgayLam, RIGHT(convert(nvarchar(16),NgayLam,21),5) as GioLam,dk.SoGioLam, dk.MaCTV, dk.MaNguoiDung, dk.TrangThai, nd.TenTaiKhoan
	 from DangKyDichVu dk
	 inner join DichVu dv on dk.MaDichVu = dv.MaDichVu
	 left join NguoiDung nd on nd.MaCTV = dk.MaCTV
end





GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layDanhSachDangKyDichVuTheoMa]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_layDanhSachDangKyDichVuTheoMa]
(
	@maDichVu nvarchar(10)
)
as
begin
	select dk.MaDangKy,dk.MaDichVu,dv.TenDichVu,dv.DonGia, dv.MoTa ,dk.SoDienThoai,dk.DiaDiem, Convert(nvarchar,CONVERT(date,NgayLam,106),105) as NgayLam, RIGHT(convert(nvarchar(16),NgayLam,21),5) as GioLam,dk.SoGioLam, dk.MaCTV, dk.MaNguoiDung, dk.TrangThai, nd.TenTaiKhoan
	 from DangKyDichVu dk
	 inner join DichVu dv on dk.MaDichVu = dv.MaDichVu
	 left join NguoiDung nd on nd.MaCTV = dk.MaCTV
	 where dk.MaDichVu = @maDichVu
end



GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layDanhSachDangKyDichVuTheoMaCTV]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrapOsin_layDanhSachDangKyDichVuTheoMaCTV]
	@maCTV nvarchar(10)
AS
BEGIN
	select dk.MaDangKy,dk.MaDichVu,dv.TenDichVu,dv.DonGia, dv.MoTa ,dk.SoDienThoai,dk.DiaDiem, Convert(nvarchar,CONVERT(date,NgayLam,106),105) as NgayLam, RIGHT(convert(nvarchar(16),NgayLam,21),5) as GioLam,dk.SoGioLam, dk.MaCTV, dk.MaNguoiDung, dk.TrangThai, nd.TenTaiKhoan
	 from DangKyDichVu dk
	 inner join DichVu dv on dk.MaDichVu = dv.MaDichVu
	 left join NguoiDung nd on nd.MaCTV = dk.MaCTV
	 where dk.MaCTV  = @maCTV and dk.TrangThai = 2
END


GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layDanhSachDangKyDichVuTheoMaVaTrangThai]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_layDanhSachDangKyDichVuTheoMaVaTrangThai]
(
	@maDichVu char(10),
	@trangThai int
)
as
begin
	select dk.MaDangKy,dk.MaDichVu,dv.TenDichVu,dv.DonGia, dv.MoTa ,dk.SoDienThoai,dk.DiaDiem, Convert(nvarchar,CONVERT(date,NgayLam,106),105) as NgayLam, RIGHT(convert(nvarchar(16),NgayLam,21),5) as GioLam,dk.SoGioLam, dk.MaCTV, dk.MaNguoiDung, dk.TrangThai, nd.TenTaiKhoan
	 from DangKyDichVu dk
	 inner join DichVu dv on dk.MaDichVu = dv.MaDichVu
	 left join NguoiDung nd on nd.MaCTV = dk.MaCTV
	 where dk.MaDichVu = @maDichVu and dk.TrangThai = @trangThai
end



GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layDanhSachDangKyDichVuTheoNguoiDung]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_layDanhSachDangKyDichVuTheoNguoiDung]
	(
	@maNguoiDung nvarchar(10)
	)
	as
begin
	select dk.MaDangKy,dk.MaDichVu,dv.TenDichVu,dv.DonGia, dv.MoTa ,dk.SoDienThoai,dk.DiaDiem, Convert(nvarchar,CONVERT(date,NgayLam,106),105) as NgayLam, RIGHT(convert(nvarchar(16),NgayLam,21),5) as GioLam,dk.SoGioLam, dk.MaCTV, dk.MaNguoiDung, dk.TrangThai, nd.TenTaiKhoan
	 from DangKyDichVu dk
	 inner join DichVu dv on dk.MaDichVu = dv.MaDichVu
	 left join NguoiDung nd on nd.MaCTV = dk.MaCTV
	 where dk.MaNguoiDung = @maNguoiDung
end



GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layDanhSachDangKyDichVuTheoTrangThai]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[GrapOsin_layDanhSachDangKyDichVuTheoTrangThai]
(
	@trangThai int
)
as
begin
	select dk.MaDangKy,dk.MaDichVu,dv.TenDichVu,dv.DonGia, dv.MoTa ,dk.SoDienThoai,dk.DiaDiem, Convert(nvarchar,CONVERT(date,NgayLam,106),105) as NgayLam, RIGHT(convert(nvarchar(16),NgayLam,21),5) as GioLam,dk.SoGioLam, dk.MaCTV, dk.MaNguoiDung, dk.TrangThai, nd.TenTaiKhoan
	 from DangKyDichVu dk
	 inner join DichVu dv on dk.MaDichVu = dv.MaDichVu
	 left join NguoiDung nd on nd.MaCTV = dk.MaCTV
	 where dk.TrangThai = @trangThai
end



GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layDanhSachDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GrapOsin_layDanhSachDichVu]
as
begin
	select dv.MaDichVu, dv.TenDichVu, dv.DonGia, dv.MoTa from DichVu dv
end






GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layDanhSachDichVuDaDangKy]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_layDanhSachDichVuDaDangKy]

as
begin
	select dv.MaDichVu,dkdv.MaDangKy,dkdv.SoDienThoai,dkdv.DiaDiem,dkdv.NgayLam,dkdv.SoGioLam,dkdv.MaCTV,dkdv.MaNguoiDung,dv.TenDichVu, dv.DonGia, dv.MoTa
	from DichVu dv
	inner join DangKyDichVu dkdv 
	ON dv.MaDichVu = dkdv.MaDichVu
end






GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layDanhSachDichVuTheoMa]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GrapOsin_layDanhSachDichVuTheoMa]
(
	@maDichVu nvarchar(10)
)
as
begin
	select MaDichVu, TenDichVu, DonGia, MoTa from DichVu
	where MaDichVu = @maDichVu
end






GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layThoiGianBanCTV]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_layThoiGianBanCTV]
(
	@maCongTacVien nvarchar(10)
)
as
begin
	select Convert(nvarchar,CONVERT(date,NgayLam,106),105) as NgayBan, 
		RIGHT(convert(nvarchar(16),NgayLam,21),5) as GioBan, 
		SoGioLam as SoGioBan
	from DangKyDichVu dk
		inner join CongTacVien ctv on ctv.MaCTV = dk.MaCTV
	where ctv.MaCTV = @maCongTacVien and dk.TrangThai = 2
end





GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layThongTinDanhKyDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_layThongTinDanhKyDichVu]
(
	@maDangKy nvarchar(10)
)
as
begin
	select dk.MaDangKy,dk.MaDichVu,dk.SoDienThoai,dk.DiaDiem, Convert(nvarchar,CONVERT(date,NgayLam,106),105) as NgayLam, RIGHT(convert(nvarchar(16),NgayLam,21),5) as GioLam,dk.SoGioLam, dk.MaCTV, dk.MaNguoiDung, dk.TrangThai
	 from DangKyDichVu dk
	 where dk.MaDangKy = @maDangKy
end





GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_layThongTinDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GrapOsin_layThongTinDichVu]
(
	@maDichVu nvarchar(10)
)
as
begin
	select dv.MaDichVu, dv.TenDichVu, dv.DonGia, dv.MoTa from DichVu dv
	where dv.MaDichVu = @maDichVu
end






GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_suaDangKyDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_suaDangKyDichVu]
(
	@maDangKy nvarchar(10),
	@maDichVu nvarchar(10),
	@soDienThoai nvarchar(50),
	@diaDiem nvarchar(50),
	@ngayLam date,
	@soGioLam int,
	@maCTV nvarchar(10),
	@maNguoiDung nvarchar(10),
	@trangThai int
)
as
begin
	update DangKyDichVu
	set MaDangKy = @maDangKy, 
	MaDichVu = @maDichVu,
	SoDienThoai = @soDienThoai,
	DiaDiem = @diaDiem,
	NgayLam = @ngayLam,
	SoGioLam =@soGioLam,
	MaCTV = @maCTV,
	MaNguoiDung = @maNguoiDung,
	TrangThai = @trangThai
	where MaDangKy  = @maDangKy
end






GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_suaDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_suaDichVu]
(
	@maDichVu nvarchar(10),
	@tenDichVu nvarchar(50),
	@donGia int,
	@moTa ntext
)
as
begin
	update DichVu
	set MaDichVu = @maDichVu,TenDichVu = @tenDichVu, DonGia = @donGia, MoTa = @moTa
	where MaDichVu = @maDichVu
end







GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_themDangKyDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_themDangKyDichVu]
(
	@maDangKy nvarchar(10),
	@maDichVu nvarchar(10),
	@soDienThoai nvarchar(50),
	@diaDiem nvarchar(50),
	@ngayLam datetime,
	@soGioLam int,
	@maCTV nvarchar(10),
	@maNguoiDung nvarchar(10),
	@trangThai int
)
as
 begin
	 insert into DangKyDichVu(MaDangKy, MaDichVu,SoDienThoai, DiaDiem, NgayLam, SoGioLam, MaCTV, MaNguoiDung, TrangThai)
	 values (@maDangKy, @maDichVu, @soDienThoai, @diaDiem, @ngayLam, @soGioLam, @maCTV, @maNguoiDung, @trangThai)
 end






GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_themDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GrapOsin_themDichVu]
(
	@maDichVu nvarchar(10),
	@tenDichVu nvarchar(50),
	@donGia int,
	@moTa ntext
)
as
begin
	insert into DichVu (MaDichVu, TenDichVu, DonGia, MoTa)
	values (@maDichVu, @tenDichVu, @donGia, @moTa)
end






GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_timKiemDangKyDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_timKiemDangKyDichVu]
(
	@keyword nvarchar(200)
)
as
begin
	select dk.MaDangKy, dk.MaDichVu, dv.TenDichVu, dk.SoDienThoai, dk.DiaDiem, uv.HoTen,Convert(nvarchar,CONVERT(date,NgayLam,106),105) as NgayLam, RIGHT(convert(nvarchar(16),NgayLam,21),5) as GioLam, dk.SoGioLam, dk.MaCTV, dk.MaNguoiDung, dk.TrangThai 
	from DangKyDichVu dk
	inner join DichVu dv on dv.MaDichVu = dk.MaDichVu
	inner join CongTacVien ctv on ctv.MaCTV = dk.MaCTV
	inner join UngVien uv on uv.SoDienThoai = ctv.SoDienThoai
	where dk.MaDangKy like N'%' + @keyWord + '%'
	or dk.MaDichVu like N'%' + @keyword + '%'
	or dk.SoDienThoai like N'%' + @keyWord + '%'
	or dk.DiaDiem like N'%' + @keyWord + '%'
	or dk.NgayLam like N'%' + @keyWord + '%'
	or dk.SoGioLam like N'%' + @keyWord + '%'
	or dk.MaCTV like N'%' + @keyWord + '%'
	or dk.MaNguoiDung like N'%' + @keyWord + '%'
	or dk.TrangThai like N'%' + @keyWord + '%'
	or dv.TenDichVu like N'%' + @keyWord + '%'
end

exec [GrapOsin_timKiemDangKyDichVu] 'd'



GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_timKiemDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GrapOsin_timKiemDichVu]
(
	@keyWord nvarchar(200)
)
as
begin
	select dv.MaDichVu, dv.TenDichVu, dv.DonGia, dv.MoTa from DichVu dv
	where dv.MaDichVu like N'%' + @keyWord + '%'
	or dv.TenDichVu like N'%' + @keyWord + '%'
	or dv.DonGia like N'%' + @keyWord + '%'
	or dv.MoTa like N'%' + @keyWord + '%'
end







GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_xoaDangKyDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GrapOsin_xoaDangKyDichVu]
(
	@maDangKy nvarchar(10)
)
as
begin 
	delete from DangKyDichVu
	where MaDangKy = @maDangKy
end






GO
/****** Object:  StoredProcedure [dbo].[GrapOsin_xoaDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GrapOsin_xoaDichVu]
(
	@maDichVu nvarchar(10)
)
as
begin
	delete from DichVu
	where MaDichVu = @maDichVu
end






GO
/****** Object:  Table [dbo].[CongTacVien]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongTacVien](
	[MaCTV] [nvarchar](10) NOT NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
	[DanhGia] [float] NULL,
 CONSTRAINT [PK_CongTacVien] PRIMARY KEY CLUSTERED 
(
	[MaCTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DangKyDichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKyDichVu](
	[MaDangKy] [nvarchar](10) NOT NULL,
	[MaDichVu] [nvarchar](10) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[DiaDiem] [nvarchar](50) NULL,
	[NgayLam] [datetime] NULL,
	[SoGioLam] [int] NULL,
	[MaCTV] [nvarchar](10) NULL,
	[MaNguoiDung] [nvarchar](10) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_DangKyDichVu] PRIMARY KEY CLUSTERED 
(
	[MaDangKy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDichVu] [nvarchar](10) NOT NULL,
	[TenDichVu] [nvarchar](50) NULL,
	[DonGia] [int] NULL,
	[MoTa] [ntext] NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [nvarchar](10) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[MaQuyen] [int] NULL,
	[MaCTV] [nvarchar](10) NULL,
	[Avatar] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguoiDung_1] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaQuyen] [int] NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UngVien]    Script Date: 16/12/2018 10:53:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UngVien](
	[HoTen] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NOT NULL,
	[NamSinh] [int] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[MaDichVu] [nvarchar](10) NULL,
 CONSTRAINT [PK_UngVien] PRIMARY KEY CLUSTERED 
(
	[SoDienThoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[CongTacVien] ([MaCTV], [SoDienThoai], [TrangThai], [DanhGia]) VALUES (N'CTV00001', N'0976573743', 1, 4)
INSERT [dbo].[CongTacVien] ([MaCTV], [SoDienThoai], [TrangThai], [DanhGia]) VALUES (N'CTV00002', N'0976573744', 0, 0)
INSERT [dbo].[CongTacVien] ([MaCTV], [SoDienThoai], [TrangThai], [DanhGia]) VALUES (N'CTV00003', N'0976573745', 0, 2.953125)
INSERT [dbo].[CongTacVien] ([MaCTV], [SoDienThoai], [TrangThai], [DanhGia]) VALUES (N'CTV00004', N'0976573746', 1, 2.83539080619812)
INSERT [dbo].[CongTacVien] ([MaCTV], [SoDienThoai], [TrangThai], [DanhGia]) VALUES (N'CTV00005', N'0976573748', 0, 0)
INSERT [dbo].[CongTacVien] ([MaCTV], [SoDienThoai], [TrangThai], [DanhGia]) VALUES (N'CTV00006', N'0976573747', 0, 4.625)
INSERT [dbo].[CongTacVien] ([MaCTV], [SoDienThoai], [TrangThai], [DanhGia]) VALUES (N'CTV00007', N'0976573749', 0, 5)
INSERT [dbo].[CongTacVien] ([MaCTV], [SoDienThoai], [TrangThai], [DanhGia]) VALUES (N'CTV00008', N'0976573750', 0, 0)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00001', N'DV0001', N'0964567466', N'Ngũ Hành Sơn', CAST(0x0000A945008C1360 AS DateTime), 1, N'CTV00001', N'ND00007', 2)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00002', N'DV0001', N'0964567468', N'Sơn Trà', CAST(0x0000A93B009450C0 AS DateTime), 2, N'CTV00003', N'ND00007', 3)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00003', N'DV0004', N'0964567470', N'Ngũ Hành Sơn', CAST(0x0000A93C00D63BC0 AS DateTime), 4, N'CTV00006', N'ND00007', 3)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00004', N'DV0003', N'0964567464', N'Hải Châu', CAST(0x0000A9360151D460 AS DateTime), 3, N'CTV00004', N'ND00007', 3)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00005', N'DV0001', N'0975769693', N'Hải Châu', CAST(0x0000A93E00FF6EA0 AS DateTime), 5, N'CTV00001', N'ND00007', 2)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00006', N'DV0003', N'0975769694', N'Liên Chiểu', CAST(0x0000A962008C1360 AS DateTime), 3, N'CTV00003', N'ND00007', 2)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00007', N'DV0004', N'0975769696', N'Sơn Trà', CAST(0x0000A94B00A4CB80 AS DateTime), 1, N'CTV00006', N'ND00007', 2)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00008', N'DV0001', N'0975769695', N'Sơn Trà', CAST(0x0000A93E00F73140 AS DateTime), 2, N'CTV00003', N'ND00007', 2)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00009', N'DV0002', N'0987574637', N'Hải Châu', CAST(0x0000A94C00C839D0 AS DateTime), 3, N'CTV00008', N'ND00011', 2)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00010', N'DV0003', N'0985745443', N'Hải Châu', CAST(0x0000A942009C8E20 AS DateTime), 1, N'CTV00007', N'ND00011', 3)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00011', N'DV0004', N'0955865654', N'Sơn Trà', CAST(0x0000A94200EEF3E0 AS DateTime), 3, N'CTV00004', N'ND00011', 3)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00012', N'DV0001', N'0956586758', N'Sơn Trà', CAST(0x0000A94200034BC0 AS DateTime), 1, N'CTV00006', N'ND00011', 3)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00013', N'DV0002', N'0697687676', N'Liên Chiểu', CAST(0x0000A941008721C0 AS DateTime), 1, N'CTV00003', N'ND00011', 3)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00014', N'DV0001', N'1234455555', N'Liên Chiểu', CAST(0x0000A94200034BC0 AS DateTime), 1, N'CTV00001', N'ND00011', 3)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00015', N'DV0003', N'0984743443', N'Liên Chiểu', CAST(0x0000A94200970FE0 AS DateTime), 1, N'CTV00004', N'ND00011', 3)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00016', N'DV0002', N'0945845454', N'Hải Châu', CAST(0x0000A945007B98A0 AS DateTime), 3, NULL, N'ND00021', 1)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00017', N'DV0003', N'0945845454', N'Sơn Trà', CAST(0x0000A946008C1360 AS DateTime), 4, NULL, N'ND00022', 1)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00019', N'DV0001', N'0945857454', N'Thanh Khê', CAST(0x0000A94E00CDFE60 AS DateTime), 3, NULL, N'ND00021', 1)
INSERT [dbo].[DangKyDichVu] ([MaDangKy], [MaDichVu], [SoDienThoai], [DiaDiem], [NgayLam], [SoGioLam], [MaCTV], [MaNguoiDung], [TrangThai]) VALUES (N'DK00020', N'DV0004', N'0944557454', N'Thanh Khê', CAST(0x0000A947009C8E20 AS DateTime), 5, NULL, N'ND00022', 1)
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [DonGia], [MoTa]) VALUES (N'DV0001', N'Dọn nhà', 200000, N'Đây là dịch vụ dọn nhà')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [DonGia], [MoTa]) VALUES (N'DV0002', N'Chăm trẻ', 300000, N'Đây là dịch vụ chăm trẻ')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [DonGia], [MoTa]) VALUES (N'DV0003', N'Sơn nhà', 250000, N'Đây là dịch vụ sơn nhà')
INSERT [dbo].[DichVu] ([MaDichVu], [TenDichVu], [DonGia], [MoTa]) VALUES (N'DV0004', N'Sửa ống nước', 100000, N'Đây là dịch vụ sửa ống nước')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00001', N'Nguyễn Văn A', N'0976573743', N'123', N'anv@gmail.com', 2, N'CTV00001', N'user5-128x128.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00002', N'Nguyễn Văn B', N'0976573745', N'123', N'bnv@gmail.com', 2, N'CTV00003', N'user6-128x128.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00003', N'Nguyễn Văn C', N'0976573746', N'123', N'cnv@gmail.com', 2, N'CTV00004', N'user7-128x128.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00004', N'Nguyễn Văn A', N'0976573747', N'123', N'anv@gmail.com', 2, N'CTV00006', N'user8-128x128.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00006', N'Dân Ai Ti', N'0979333474', N'123', N'admin@gmail.com', 1, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00007', N'Nguyễn Văn E', N'0979333458', N'123', N'env@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00008', N'Nguyễn Văn H', N'0975769681', N'123', N'bnv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00009', N'Nguyễn Văn G', N'0975769682', N'123', N'cnv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00010', N'Nguyễn Văn H', N'0975769683', N'123', N'anv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00011', N'Nguyễn Văn G', N'0975769684', N'123', N'dnv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00012', N'Nguyễn Văn H', N'0975769685', N'123', N'admin@gmail.com', 1, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00013', N'Nguyễn Văn G', N'0975769686', N'123', N'env@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00014', N'Nguyễn Văn H', N'0975769687', N'123', N'anv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00015', N'Nguyễn Văn G', N'0975769688', N'123', N'bnv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00016', N'Nguyễn Văn H', N'0975769689', N'123', N'cnv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00017', N'Nguyễn Văn G', N'0975769690', N'123', N'anv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00018', N'Nguyễn Văn H', N'0975769691', N'123', N'dnv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00019', N'NamNH69', N'01666561924', N'123', N'admin@gmail.com', 1, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00020', N'Nguyễn Văn H', N'0975769693', N'123', N'env@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00021', N'Nguyễn Văn G', N'0975769694', N'123', N'anv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00022', N'Nguyễn Văn H', N'0975769695', N'123', N'bnv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00023', N'Nguyễn Văn G', N'0975769696', N'123', N'cnv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00024', N'Nguyễn Văn H', N'0975769697', N'123', N'anv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00025', N'Nguyễn Văn G', N'0975769698', N'123', N'dnv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00026', N'LinhDVK', N'0975769699', N'123', N'admin@gmail.com', 1, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00027', N'Nguyễn Văn G', N'0975769700', N'123', N'env@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00028', N'Nguyễn Văn H', N'0975769701', N'123', N'anv@gmail.com', 3, NULL, N'user2-160x160.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00029', N'Nguyễn Văn G', N'0975769702', N'123', N'bnv@gmail.com', 3, NULL, NULL)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00030', N'Lê Đăng Nam', N'0976573749', N'123', N'Namld@gmail.com', 2, N'CTV00007', N'user1-128x128.jpg')
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenTaiKhoan], [SoDienThoai], [MatKhau], [Email], [MaQuyen], [MaCTV], [Avatar]) VALUES (N'ND00031', N'Hoàng Khánh Chi', N'0976573750', N'123', N'ChiHK@gmail.com', 2, N'CTV00008', N'user1-128x128.jpg')
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen]) VALUES (1, N'Admin')
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen]) VALUES (2, N'Cộng tác viên')
INSERT [dbo].[PhanQuyen] ([MaQuyen], [TenQuyen]) VALUES (3, N'Khách hàng')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Hoàng Nam Phương', N'0459474464', 1974, N'Hòa Hải, Ngũ Hàng Sơn', N'DV0004')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Lê Phong Quang', N'0945487545', 1980, N'Thanh Khê, Đà Nẵng', N'DV0003')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Nguyễn Văn A', N'0976573743', 1990, N'Nghệ An', N'DV0001')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Nguyễn Văn A', N'0976573744', 1992, N'Nghệ An', N'DV0002')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Nguyễn Văn B', N'0976573745', 1994, N'Đà Nẵng', N'DV0001')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Nguyễn Văn C', N'0976573746', 1987, N'Đà Nẵng', N'DV0003')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Nguyễn Văn A', N'0976573747', 1996, N'Nghệ An', N'DV0004')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Nguyễn Văn D', N'0976573748', 1993, N'Đà Nẵng', N'DV0003')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Lê Đăng Nam', N'0976573749', 1990, N'Hòa Khánh, Ngũ Hành Sơn', N'DV0004')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Hoàng Khánh Chi', N'0976573750', 1993, N'Liên Chiểu', N'DV0001')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Trần Minh Tuyết', N'0976573751', 1990, N'Hòa Hải', N'DV0002')
INSERT [dbo].[UngVien] ([HoTen], [SoDienThoai], [NamSinh], [DiaChi], [MaDichVu]) VALUES (N'Trần Văn Tuấn', N'0976573752', 1989, N'Thọ Quang, Sơn Trà', N'DV0003')
ALTER TABLE [dbo].[CongTacVien]  WITH CHECK ADD  CONSTRAINT [FK_CongTacVien_UngVien] FOREIGN KEY([SoDienThoai])
REFERENCES [dbo].[UngVien] ([SoDienThoai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CongTacVien] CHECK CONSTRAINT [FK_CongTacVien_UngVien]
GO
ALTER TABLE [dbo].[DangKyDichVu]  WITH CHECK ADD  CONSTRAINT [FK_DangKyDichVu_DichVu] FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[DichVu] ([MaDichVu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DangKyDichVu] CHECK CONSTRAINT [FK_DangKyDichVu_DichVu]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_CongTacVien] FOREIGN KEY([MaCTV])
REFERENCES [dbo].[CongTacVien] ([MaCTV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_CongTacVien]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_PhanQuyen] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[PhanQuyen] ([MaQuyen])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_PhanQuyen]
GO
ALTER TABLE [dbo].[UngVien]  WITH CHECK ADD  CONSTRAINT [FK_UngVien_DichVu] FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[DichVu] ([MaDichVu])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UngVien] CHECK CONSTRAINT [FK_UngVien_DichVu]
GO
USE [master]
GO
ALTER DATABASE [GrabOsin] SET  READ_WRITE 
GO
