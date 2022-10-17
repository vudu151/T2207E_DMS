insert into NHACUNGCAP(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue)
values ('NCC001',N'Cty TNHH Toàn Pháp','Hai Chau',05113999888,568941),
('NCC002',N'Cty Cổ phần Đông Du','Lien Chieu',0511399989,456789),
('NCC003',N'Ông Nguyễn Văn A','Hoa Thuan',05113999890,321456),
('NCC004',N'Cty Cổ phần Toàn Cầu Xanh','Hai Chieu',05113658945,513364),
('NCC005',N'Cty TNHH AMA','Thanh Khe',05113875466,546546),
('NCC006',N'Bà Trần Thị Bích Vân','Lien Chieu',05113587469,524545),
('NCC007',N'Cty TNHH Phan Thành','Thanh Khe',05113987456,113021),
('NCC008',N'Ông Phan Đình Nam','Hoa Thuan',05113532456,121230),
('NCC009',N'Tập đoàn Đông Nam Á','Lien Chieu',05113987121,533654),
('NCC010',N'Cty Cổ phần Rạng Đông','Lien Chieu',05113569654,1887864);

select * from NHACUNGCAP;

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
('Grand-10','Huyndai',7);

 select * from DONGXE;

insert into MUCPHI(MaMP,DonGia,MoTa)
values ('MP01',10000,N'Áp dụng từ 1/2015'),
('MP02',15000,N'Áp dụng từ 2/2015'),
('MP03',20000,N'Áp dụng từ 1/2010'),
('MP04',25000,N'Áp dụng từ 2/2012');

select * from MUCPHI;



 insert into DANGKYCUNGCAP(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCC,NgayKetThucCC,SoLuongXeDangKy)
 values ('DK001','NCC001','DV01','Hiace','MP01','20/11/2015','20/11/2016',4),
 ('DK002','NCC002','DV02','Vios','MP02','20/11/2015','20/11/2017',3),
 ('DK003','NCC003','DV03','Escape','MP03','20/11/2017','20/11/2018',5),
 ('DK004','NCC005','DV01','Cerato','MP04','20/11/2015','20/11/2019',7),
 ('DK005','NCC002','DV02','Forte','MP03','20/11/2019','20/11/2020',1),
 ('DK006','NCC004','DV03','Starex','MP04','10/11/2016','20/11/2021',2),
 ('DK007','NCC005','DV01','Cerato','MP03','30/11/2015','25/01/2016',8),
 ('DK008','NCC006','DV01','Vios','MP02','28/02/2016','15/08/2016',9),
 ('DK009','NCC005','DV03','Grand-i10','MP02','27/04/2016','30/04/2017',10),
 ('DK010','NCC006','DV01','Forte','MP02','21/11/2015','22/02/2016',4),
 ('DK011','NCC007','DV01','Forte','MP01','25/12/2016','20/02/2017',5),
 ('DK012','NCC007','DV03','Cerato','MP01','14/04/2016','20/12/2017',6),
 ('DK013','NCC003','DV02','Cerato','MP01','21/12/2015','21/12/2016',8),
 ('DK014','NCC008','DV02','Cerato','MP01','20/05/2016','30/12/2016',1),
 ('DK015','NCC003','DV01','Hiace','MP02','24/04/2018','20/11/2019',6),
 ('DK016','NCC001','DV03','Grand-i10','MP02','22/06/2016','21/12/2016',8),
 ('DK017','NCC002','DV03','Cerato','MP03','30/09/2016','30/09/2019',4),
 ('DK018','NCC008','DV03','Escape','MP04','13/12/2017','30/09/2018',2),
 ('DK019','NCC003','DV03','Escape','MP03','24/01/2016','30/12/2016',8),
 ('DK020','NCC002','DV03','Cerato','MP04','03/05/2016','21/10/2017',7),
 ('DK021','NCC005','DV01','Forte','MP02','30/01/2015','30/12/2016',9),
 ('DK022','NCC002','DV02','Cerato','MP04','25/07/2016','30/12/2017',6),
 ('DK023','NCC002','DV01','Forte','MP03','30/11/2017','20/05/2018',5),
 ('DK024','NCC003','DV03','Forte','MP04','23/12/2017','30/11/2019',8),
 ('DK025','NCC003','DV03','Hiace','MP02','24/08/2016','25/10/20117',1);

 select * from DANGKYCUNGCAP;