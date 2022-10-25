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


--THAY ĐỔI DỮ LIỆU TRONG BẢNG: UPDATE,DELETE ,...
update Customers set Address=N'Số 8A Tôn Thất Thuyết,Nam Từ Liêm' where Id = 4;      --Dùng để sửa lại địa chỉ của khách hàng CHÚ Ý: Dùng Where để chỉ định Id của khách hàng, nếu không dùng Where hệ thống mặc định sẽ sửa lại hết
update Orders set GrandTotal=200 where Id = 1; 
delete from Orders where Id =4;
delete from Orders where Id =3;
delete from Customers;    --Khi chạy lệnh này sẽ bị lỗi ( ko xóa được vì Customers đã có đơn hàng rồi (Đây là tác dụng của khóa ngoại)
                          --Cái bảng này chưa có bảng khác tham chiếu sang thì xóa được, còn nếu có bảng khác tham chiếu sang thì không xóa được (ĐÂY CHÍNH LÀ TÁC DỤNG CỦA QUAN HỆ RÀNG BUỘC
delete from OrderItems;   --Khi chạy lệnh naỳ thì sẽ xóa bảng OrderItems do bảng này không ai tham chiếu đến nó


--THAY THẾ CẤU TRÚC TRONG BẢNG: THÊM CỘT, XÓA BẢNG CÓ RÀNG BUỘC,...
alter table Customers add RewardPoint int; --thêm một cột trong bảng đã có sẵn, ko dùng đc not null, bắt buộc phải null(tốt nhất ko viết gì cả)
alter table Customers alter column RewardPoint float; --sửa kiểu dữ liệu
alter table Customers drop column RewardPoint; --xóa cột

alter table Customers add check (RewardPoint>0);--có thằng nào <=0 thì k tạo đc cái này
alter table Customers drop constraint CK__Customers__Rewar__267ABA7A;    --xóa ràng buộc

alter table Customers add constraint check_point check(RewardPoint > 0);   --dòng này bằng 2 dòng trên, check_point là đặt tên cho dễ nhớ
alter table Customers drop constraint check_point;   --xóa ràng buộc khi đã đặt tên riêng



--CHỈ MỤC INDEX TRONG SQL: chỉ mục vật lý và chỉ mục phi vật lý
create table Students(
   Id int,
   Name varchar(50),
   age int
);
drop table Students

insert into Students (Id,Name,age)
values (3,'Nam',18),(1,'Dung',15),(2,'Khoi',21),(4,'Son',12);
select * from Students;

--Dùng để tăng hiệu năng của cơ sở dữ liệu( nhanh hơn)
create clustered index chi_muc_vat_ly on Students(Id);    --chỉ mục vật lý, nếu có khóa chính rồi thì ko đánh được chỉ mục nữa. 
create index chi_muc_phi_vat_ly on Students(Id);              --chỉ mục phi vật lý create index thì đánh bao nhiêu cũng được
  --Chú ý: Khi đánh chỉ mục bất cứ bằng hình thức gì muốn làm lại thì drop=>create=>insert=>select=>Đánh chỉ mục lại