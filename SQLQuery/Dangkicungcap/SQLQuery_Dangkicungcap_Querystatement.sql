--liệt kê những dòng xe có chỗ ngồi trên 5 chỗ
select * from DONGXE where SoChoNgoi>5;

--liệt kê thông tin của các nhà cung cấp đã từng đăng kí cung cấp những dòng xe thuộc hãng xe 'Toyota' với mức phí có đơn giá là 15.000VNĐ/km hoặc những dòng xe thuộc hãng xe 'KIA' với mức phí có đơn giá là 20.000 VNĐ/km
 

--Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế
select * from NHACUNGCAP order by TenNhaCC asc,MaSoThue desc;

--Đếm số lần đăng kí cung cấp phương tiện tương ứng cho từng nhà cung cấp với yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng kí cung cấp có ngày bắt đầu cung cấp là '20/11/2015'

--Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe chỉ được liệt kê một lần
select distinct HangXe from
--Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV,DonGia,HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra

--Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”

--Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp phương tiện lần nào cả