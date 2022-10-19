insert into Customers(Name,Address,Tel)
values (N'Nguyễn Văn A',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','0987654326'),
(N'Nguyễn Văn B',N'112 Nguyễn Trãi, Thanh Xuân, Hà Nội','0987654327'),
(N'Nguyễn Văn C',N'113 Nguyễn Trãi, Thanh Xuân, Hà Nội','0987654328');
select  * from Customers;

insert into Products(Name, Description, Unit, Price)
values (N'Máy tính T450',N'Máy nhập mới',N'Chiếc',1000),    /* Chỉ cần sử dụng values một lần thôi*/
(N'Điện thoại Nokia 567',N'Điện thoại đang hot',N'Chiếc',200),
(N'Máy in Samsung 450',N'Máy in đang ế',N'Chiếc',100);
select * from Products;

insert into Orders(OrderDate,GrandTotal,CustomerId)
values ('2022-10-10',1000,1),    --1 là mã Id của khách hàng tại bảng Customers
('2022-10-1',100,4),
('2022-10-4',200,1),
('2022-10-1',100,1),
('2022-10-05',1000,5);  
select * from Orders;

insert into OrderItems(Qty,Total,ProductId,OrderId)
values (2,200,1,9),
(1,100,2,10),
(1,1000,3,11);    -- Chú ý về Đúng cái Prodcts (số thứ 3) và Orders(số thứ 4) cần xem đúng Id để lấy đúng dữ liệu cần dùng
select *from OrderItems;



update Customers set Address=N'Số 8A Tôn Thất Thuyết,Nam Từ Liêm' where Id = 4;      --Dùng để sửa lại địa chỉ của khách hàng CHÚ Ý: Dùng Where để chỉ định Id của khách hàng, nếu không dùng Where hệ thống mặc định sẽ sửa lại hết
update Orders set GrandTotal=200 where Id = 1; 
delete from Orders where Id =4;
delete from Orders where Id =3;
delete from Customers;    --Khi chạy lệnh này sẽ bị lỗi ( ko xóa được vì Customers đã có đơn hàng rồi (Đây là tác dụng của khóa ngoại)
                          --Cái bảng này chưa có bảng khác tham chiếu sang thì xóa được, còn nếu có bảng khác tham chiếu sang thì không xóa được (ĐÂY CHÍNH LÀ TÁC DỤNG CỦA QUAN HỆ RÀNG BUỘC
delete from OrderItems;   --Khi chạy lệnh naỳ thì sẽ xóa bảng OrderItems do bảng này không ai tham chiếu đến nó