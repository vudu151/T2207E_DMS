insert into Customers(Name,Address,Tel)
values (N'Kim Trọng',N'114 Nguyễn Trãi, Thanh Xuân, Hà Nội','0987654324');

select * from Customers;

insert into Products(Name, Description, Unit, Price)
values (N'Máy tính T450',N'Máy nhập mới',N'Chiếc',1000),    /* Chỉ cần sử dụng values một lần thôi*/
(N'Điện thoại Nokia 567',N'Điện thoại đang hot',N'Chiếc',200),
(N'Máy in Samsung 450',N'Máy in đang ế',N'Chiếc',100);

select * from Products;

insert into Orders(OrderDate,GrandTotal,CustomerId)
values ('2022-10-10',1500,2);    --2 là mã Id của khách hàng tại bảng Customers

select * from Orders;

insert into OrderItems(Qty,Total,ProductId,OrderId)
values (1,1000,1,1),(2,200,2,1),(1,100,3,1);    -- Chú ý về Đúng cái Prodcts (số thứ 3) và Orders(số thứ 4) cần xem đúng Id để lấy đúng dữ liệu cần dùng

select *from OrderItems;

update Customers set Address=N'Số 8A Tôn Thất Thuyết,Nam Từ Liêm' where Id = 2;      --Dùng để sửa lại địa chỉ của khách hàng CHÚ Ý: Dùng Where để chỉ định Id của khách hàng, nếu không dùng Where hệ thống mặc định sẽ sửa lại hết

delete from Customers where Id =4;
delete from Customers;    --Khi chạy lệnh này sẽ bị lỗi ( ko xóa được vì Customers đã có đơn hàng rồi (Đây là tác dụng của khóa ngoại)
                          --Cái bảng này chưa có bảng khác tham chiếu sang thì xóa được, còn nếu có bảng khác tham chiếu sang thì không xóa được (ĐÂY CHÍNH LÀ TÁC DỤNG CỦA QUAN HỆ RÀNG BUỘC
delete from OrderItems;   --Khi chạy lệnh naỳ thì sẽ xóa bảng OrderItems do bảng này không ai tham chiếu đến nó
