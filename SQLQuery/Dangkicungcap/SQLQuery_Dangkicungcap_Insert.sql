﻿insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue)
values ('NCC001',N'Cty TNHH Toàn Pháp','Hai Chau','05113999888',568941),
		('NCC002',N'Cty Cổ phần Đông Du','Lien Chieu','0511399989',456789),
		('NCC003',N'Ông Nguyễn Văn A','Hoa Thuan','05113999890',321456),
		('NCC004',N'Cty Cổ phần Toàn Cầu Xanh','Hai Chieu','05113658945',513364),
		('NCC005',N'Cty TNHH AMA','Thanh Khe','05113875466',546546),
		('NCC006',N'Bà Trần Thị Bích Vân','Lien Chieu','05113587469',524545),
		('NCC007',N'Cty TNHH Phan Thành','Thanh Khe','05113987456',113021),
		('NCC008',N'Ông Phan Đình Nam','Hoa Thuan','05113532456',121230),
		('NCC009',N'Tập đoàn Đông Nam Á','Lien Chieu','05113987121',533654),
		('NCC010',N'Cty Cổ phần Rạng Đông','Lien Chieu','05113569654',1887864);
select * from NHACUNGCAP;
update NHACUNGCAP set MaSoThue = 187864 where MaNhaCC = 'NCC010';


insert into LOAIDICHVU(MaLoaiDV,TenLoaiDV)
values ('DV01',N'Dịch vụ xe taxi'),
		('DV02',N'Dịch vụ xe buýt công cộng theo tuyến cố định'),
		('DV03',N'Dịch vụ xe cho thuê theo hợp đồng');
select * from LOAIDICHVU;


insert into DONGXE(DongXe,HangXe,SoChoNgoi)
values ('Hiace','Toyota',16),
		('Vios','Toyota',5),
		('Escape','Ford',5),
		('Cerato','KIA',7),
		('Forte','KIA',5),
		('Starex','Huyndai',7),
		('Grand-i10','Huyndai',7);
 select * from DONGXE;


insert into MUCPHI(MaMP,DonGia,MoTa)
values ('MP01',10000,N'Áp dụng từ 1/2015'),
		('MP02',15000,N'Áp dụng từ 2/2015'),
		('MP03',20000,N'Áp dụng từ 1/2010'),
		('MP04',25000,N'Áp dụng từ 2/2012');
select * from MUCPHI;


 insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCC,NgayKetThucCC,SoLuongXeDangKy)
 values ('DK001','NCC001','DV01','Hiace','MP01','2015-11-20','2016-11-20',4),
		 ('DK002','NCC002','DV02','Vios','MP02','2015-11-20','2017-11-20',3),
		 ('DK003','NCC003','DV03','Escape','MP03','2017-11-20','2018-11-20',5),
		 ('DK004','NCC005','DV01','Cerato','MP04','2015-11-20','2019-11-20',7),
		 ('DK005','NCC002','DV02','Forte','MP03','2019-11-20','2020-11-20',1),
		 ('DK006','NCC004','DV03','Starex','MP04','2016-11-10','2021-11-20',2),
		 ('DK007','NCC005','DV01','Cerato','MP03','2015-11-30','2016-01-25',8),
		 ('DK008','NCC006','DV01','Vios','MP02','2016-02-28','2016-08-15',9),
		 ('DK009','NCC005','DV03','Grand-i10','MP02','2016-04-27','2017-04-30',10),
		 ('DK010','NCC006','DV01','Forte','MP02','2015-11-21','2016-02-22',4),
		 ('DK011','NCC007','DV01','Forte','MP01','2016-12-25','2017-02-20',5),
		 ('DK012','NCC007','DV03','Cerato','MP01','2016-04-14','2017-12-20',6),
		 ('DK013','NCC003','DV02','Cerato','MP01','2015-12-21','2016-12-21',8),
		 ('DK014','NCC008','DV02','Cerato','MP01','2016-05-20','2016-12-30',1),
		 ('DK015','NCC003','DV01','Hiace','MP02','2018-04-24','2019-11-20',6),
		 ('DK016','NCC001','DV03','Grand-i10','MP02','2016-06-22','2016-12-21',8),
		 ('DK017','NCC002','DV03','Cerato','MP03','2016-09-30','2019-09-30',4),
		 ('DK018','NCC008','DV03','Escape','MP04','2017-12-13','2018-09-30',2),
		 ('DK019','NCC003','DV03','Escape','MP03','2016-01-24','2016-12-30',8),
		 ('DK020','NCC002','DV03','Cerato','MP04','2016-05-03','2017-10-21',7),
		 ('DK021','NCC005','DV01','Forte','MP02','2015-01-30','2016-12-30',9),
		 ('DK022','NCC002','DV02','Cerato','MP04','2016-07-25','2017-11-30',6),
		 ('DK023','NCC002','DV01','Forte','MP03','2017-11-30','2018-05-20',5),
		 ('DK024','NCC003','DV03','Forte','MP04','2017-12-23','2019-11-30',8),
		 ('DK025','NCC003','DV03','Hiace','MP02','2016-08-24','2017-10-25',1);
 select * from DANGKYCUNGCAP;