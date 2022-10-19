create table NHACUNGCAP(
   MaNhaCC varchar(20) primary key,
   TenNhaCC nvarchar(100) not null unique,
   DiaChi varchar(100) not null,
   SoDT int not null unique check(SoDT like'0%'),
   MaSoThue int not null unique
);
create table LOAIDICHVU(
   MaLoaiDV varchar(20) primary key identity(1,1),
   TenLoaiDV nvarchar(100) not null unique
);
create table MUCPHI(
   MaMP varchar(20) primary key identity(1,1),
   DonGia decimal(12,4) not null unique check(DonGia >0),
   MoTa ntext not null
);
create table DONGXE(
   DongXe varchar(20) primary key identity(1,1),
   HangXe varchar(20) not null unique check(HangXe in ('Toyota','Ford','KIA','Huyndai')),
   SoChoNgoi int not null check(SoChoNgoi>0)
);
create table DANGKICUNGCAP(
   MaDKCC varchar(20) primary key identity(1,1),
   MaNhaCC varchar(20) not null foreign key references NHACUNGCAP(MaNhaCC),
   MaLoaiDV varchar(20) not null foreign key references LOAIDICHVU(MaLoaiDV),
   DongXe varchar(20) not null foreign key references DONGXE(Dongxe),
   MaMP varchar(20) not null foreign key references MUCPHI(MaMP),
   NgayBatDauCungCap varchar(20) not null check(NgayBatDauCungCap < NgayKetThucCungCap),
   NgayKetThucCungCap varchar(20) not null check(NgayKetThucCungCap > NgayBatDauCungCap),
   SoLuongXeDangKi int not null check(SoLuongXeDangKi >0)
);