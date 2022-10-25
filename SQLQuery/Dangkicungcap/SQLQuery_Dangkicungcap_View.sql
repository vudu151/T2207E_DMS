--View tạo bảng ảo chứa các thông tin, dữ liệu đươc lưu trữ sẵn cho người dùng sử dụng
create view data_all as
select a.MaDKCC, a.MaNhaCC, b.TenNhaCC, b.DiaChi,b.MaSoThue,e.TenLoaiDV,c.DonGia, d.HangXe, a.NgayBatDauCC, a.NgayKetThucCC from DANGKYCUNGCAP a
right join NHACUNGCAP b on a.MaNhaCC = b.MaNhaCC
left join MUCPHI c on a.MaMP =c.MaMP
left join DONGXE d on a.DongXe = d.DongXe
left join LOAIDICHVU e on a.MaLoaiDV = e.MaLoaiDV;

select * from data_all;
drop view data_all;


--Lấy dữ liệu từ database khác sang file này 
create view T2207E_Book as
select * from T2207E_Book.dbo.Books;

--Procedure là một chương trình trong cơ sở dữ liệu gồm nhiều câu lệnh mà bạn lưu lại cho những lần sử dụng sau
create procedure select_all as 
select * from data_all;
select * from T2207E_Book;

drop procedure select_all;

exec select_all;


