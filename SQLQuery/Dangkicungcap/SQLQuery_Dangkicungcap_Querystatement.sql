--1.liệt kê những dòng xe có chỗ ngồi trên 5 chỗ
select * from DONGXE where SoChoNgoi>5;

--2.liệt kê thông tin của các nhà cung cấp đã từng đăng kí cung cấp những dòng xe thuộc hãng xe 'Toyota' với mức phí có đơn giá là 15.000VNĐ/km hoặc những dòng xe thuộc hãng xe 'KIA' với mức phí có đơn giá là 20.000 VNĐ/km
--Cách 1
select * from NHACUNGCAP where MaNhaCC in
   (select MaNhaCC from DANGKYCUNGCAP where DongXe in
      (select DongXe from DONGXE where HangXe like'Toyota') and MaMP in
         (select MaMP from MUCPHI where DonGia= 15000)
		 )
	or MaNhaCC in
	(select MaNhaCC from DANGKYCUNGCAP where DongXe in
      (select DongXe from DONGXE where HangXe like'KIA') and MaMP in
         (select MaMP from MUCPHI where DonGia= 20000)
    );    
--Cách 2
select distinct b.* from DANGKYCUNGCAP a
inner join NHACUNGCAP b on a.MaNhaCC = b.MaNhaCC
inner join MUCPHI c on a.MaMP = c.MaMP
inner join DONGXE d on a.DongXe = d.DongXe 
where ( d.HangXe like'Toyota' and c.DonGia = 15000)
    or(d.HangXe like'KIA' and c.DonGia = 20000);

--3.Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế
select * from NHACUNGCAP order by TenNhaCC asc,MaSoThue desc;

--4.Đếm số lần đăng kí cung cấp phương tiện tương ứng cho từng nhà cung cấp với yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng kí cung cấp có ngày bắt đầu cung cấp là '20/11/2015'
select MaNhaCC ,count(*) from DANGKYCUNGCAP
   where NgayBatDauCC >= '2015-11-20' group by MaNhaCC;    --group by dùng để lệnh count thực hiện cái đó

--5.Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe chỉ được liệt kê một lần
select distinct HangXe from DONGXE;

--6.Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV,DonGia,HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra
select a.MaDKCC, a.MaNhaCC, b.TenNhaCC, b.DiaChi,b.MaSoThue,e.TenLoaiDV,c.DonGia, d.HangXe, a.NgayBatDauCC, a.NgayKetThucCC from DANGKYCUNGCAP a
right join NHACUNGCAP b on a.MaNhaCC = b.MaNhaCC
left join MUCPHI c on a.MaMP =c.MaMP
left join DONGXE d on a.DongXe = d.DongXe
left join LOAIDICHVU e on a.MaLoaiDV = e.MaLoaiDV;

--7.Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”
select * from NHACUNGCAP where MaNhaCC in(
   select MaNhaCC from DANGKYCUNGCAP where DongXe in('Hiace','Cerato')
   );
--8.Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp phương tiện lần nào cả
select * from NHACUNGCAP where MaNhaCC not in
   (select MaNhaCC from DANGKYCUNGCAP);