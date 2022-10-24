create table NHACUNGCAP(
	MaNhaCC varchar(20) primary key,
	TenNhaCC nvarchar(100) not null unique,
	DiaChi nvarchar(255) not null,
	SoDT varchar(15) not null unique check(SoDT like '0%'),
	MaSoThue integer not null unique
);

create table LOAIDICHVU(
	MaLoaiDV varchar(20) primary key,
	TenLoaiDV nvarchar(100)
);

create table DONGXE(
	DongXe varchar(20) primary key,
	HangXe varchar(20) not null,
	SoChoNgoi integer not null check(SoChoNgoi >0) default 1 ,
);
drop table DONGXE;

create table MUCPHI(
	MaMP varchar(20) primary key,
	DonGia decimal(12,4) not null check(DonGia >=0) default 0,
	MoTa nvarchar(255)
);

create table DANGKYCUNGCAP(
	MaDKCC varchar(20) primary key,
	MaNhaCC varchar(20) foreign key references NHACUNGCAP(MaNhaCC),
	MaLoaiDV varchar(20) foreign key references LOAIDICHVU(MaLoaiDV),
	DongXe varchar(20) foreign key references DONGXE(DongXe),
	MaMP varchar (20) foreign key references MUCPHI(MaMP),
	NgayBatDauCC date,
	NgayKetThucCC date,
	SoLuongXeDangKy int not null check(SoLuongXeDangKy >0), 
);
