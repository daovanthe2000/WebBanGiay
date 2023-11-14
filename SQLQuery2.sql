USE master
GO
CREATE DATABASE dbShoesStore123;
GO
USE dbShoesStore123;
GO
CREATE TABLE ChucVu (
  MaChucVu int IDENTITY,
  TenChucVu nvarchar(50),
  PRIMARY KEY (MaChucVu)
);
CREATE TABLE KhachHang (
  MaKhachHang int IDENTITY,
  HoTen nvarchar(50),
  DiaChi nvarchar(100),
  GioiTinh nvarchar(50),
  Cmnd nvarchar(20),
  SoDT varchar(12),
  Email varchar(50),
  TenDangNhap varchar(50),
  MatKhau varchar(50),
  status bit,
  PRIMARY KEY (MaKhachHang)

);
CREATE TABLE NhanVien (
  MaNhanVien int IDENTITY,
  HoTen nvarchar(50),
  DiaChi nvarchar(100),
  GioiTinh nvarchar(50),
  Cmnd nvarchar(20),
  SoDT varchar(12),
  MaChucVu int,
  Email varchar(50),
  TenDangNhap varchar(50),
  MatKhau varchar(50),
  status bit,
  PRIMARY KEY (MaNhanVien),
  CONSTRAINT FK_ChucVu FOREIGN KEY (MaChucVu) REFERENCES ChucVu (MaChucVu)

);

CREATE TABLE DanhMucSanPham (
  MaDanhMuc int IDENTITY,
  TenDanhMuc nvarchar(100),
  PRIMARY KEY (MaDanhMuc)

);

CREATE TABLE NhanHang (
  MaNhanHang int IDENTITY,
  TenNhanHang nvarchar(100),
  HinhNhanHang nvarchar(max),
  PRIMARY KEY (MaNhanHang)

);
CREATE TABLE SanPham (
  MaSanPham int not null,
  MaDanhMuc int,
  MaNhanHang int,
  TenSanPham nvarchar(100),
  MoTa nvarchar(max),
  PRIMARY KEY (MaSanPham),
  CONSTRAINT FK_SanPham_DanhMuc FOREIGN KEY (MaDanhMuc) REFERENCES DanhMucSanPham (MaDanhMuc),
  CONSTRAINT FK_SanPham_NhanHang FOREIGN KEY (MaNhanHang) REFERENCES NhanHang (MaNhanHang)
);
CREATE TABLE MauSanPham(
	MaMau int IDENTITY,
	TenMau nvarchar(50) NULL,
	HexCode varchar(10) NULL,
	 PRIMARY KEY (MaMau)
	)
CREATE TABLE SizeSanPham (
  MaSize int IDENTITY,
  Size nvarchar(20),
  PRIMARY KEY (MaSize)
);

CREATE TABLE ChiTietSanPham (
IdChiTietSP int IDENTITY,
  MaSanPham int,
  MaSize int,
  MaMau int,
  NgayTao nvarchar(50),
  [status] bit not null,
  SoLuong int,
  GiaTien float,
  AnhChinh varchar(200),
  PRIMARY KEY (IdChiTietSP),
  CONSTRAINT FK_CHITET_SanPham FOREIGN KEY (MaSanPham) REFERENCES SanPham (MaSanPham),
   CONSTRAINT FK_CHITET_MauSp FOREIGN KEY (MaMau) REFERENCES MauSanPham (MaMau),
  CONSTRAINT FK_ChiTiet_Size FOREIGN KEY (MaSize) REFERENCES SizeSanPham (MaSize),
);



CREATE TABLE KhuyenMai (
  MaKhuyenMai int IDENTITY,
  TenKhuyenMai nvarchar(200),
  ThoiGianBatDau datetime,
  ThoiGianKetThuc datetime,
  MoTa nvarchar(max),
  GiaGiam int,
  status bit,
  kmtheo bit,
  PRIMARY KEY (MaKhuyenMai)
);

CREATE TABLE ChiTietKhuyenMai (
  MaKhuyenMai int,
  MaSanPham int,
  PRIMARY KEY (MaKhuyenMai, MaSanPham),
  CONSTRAINT FK_CTKM FOREIGN KEY (MaSanPham) REFERENCES SanPham (MaSanPham),
  CONSTRAINT FK_CTKM1 FOREIGN KEY (MaKhuyenMai) REFERENCES KhuyenMai (MaKhuyenMai)
);

CREATE TABLE HoaDon (
  MaHoaDon int IDENTITY,
  TenKhachHang nvarchar(100),
  SoDT char(12),
  DiaChiGiaoHang nvarchar(200),
  TinhTrang int,
  NgayLap date,
  tongTien float,
  MaKhachHang int,
  CONSTRAINT FK_KhachHang FOREIGN KEY (MaKhachHang) REFERENCES KhachHang (MaKhachHang),
  PRIMARY KEY (MaHoaDon)
);

CREATE TABLE ChiTietHoaDon (
  MaHoaDon int,
 IdChiTietSP int,
  SoLuong int,
  GiaTien float,
  ThanhTien float,
  PRIMARY KEY (MaHoaDon, IdChiTietSP),
  CONSTRAINT FK_CTHD FOREIGN KEY (MaHoaDon) REFERENCES HoaDon (MaHoaDon),
  CONSTRAINT FK_ChiTietSanPham_SanPham FOREIGN KEY (IdChiTietSP) REFERENCES ChiTietSanPham (IdChiTietSP)
);
CREATE TABLE Banner (
  MaBanner int IDENTITY,
  AnhBanner nvarchar(100),
  ViTri int,
  PRIMARY KEY (MaBanner)
);