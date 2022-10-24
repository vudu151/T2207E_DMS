--Liệt kê danh sách khách hàng đã mua hàng ở cửa hàng.--Liệt kê danh sách sản phẩm của của hàng select Name from Products;--Liệt kê danh sách các đơn đặt hàng của cửa hàng.select * from Orders;--Liệt kê danh sách khách hàng theo thứ thự ngược alphabetselect * from Customers order by Name desc;--Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dầnselect * from Products order by Price desc;--Liệt kê các sản phẩm mà khách hàng Kim Trọng đã muadeclare @x int;  -- khai baod một biến xset @x=(select Id from Customers where Name like N'Kim Trọng');select *from Orders where CustomerId = @x;--subqueryselect * from Orders where CustomerId in (select Id from Customers where Name like N'Nguyễn Văn A');--Ông AN chưa trả tiền phí ship > Tăng 20$ vào mỗi đơn hàng của ông Anupdate Orders set GrandTotal = GrandTotal + 10 where CustomerId in (select Id from Customers where Name like N'Nguyễn Văn A');--Thêm một đơn hàng cho ông An insert into Orders(OrderDate,GrandTotal,CustomerId) values (getdate(),1200,(select Id from Customers where Name like N'Nguyễn Văn A')) ;--liệt kê các sản phẩm mà ông AN đã mua select * from Products where Id in    (select ProductId from OrderItems where OrderId in       ( select Id from Orders where CustomerId in	     (select Id from Customers where Name like N'Nguyễn Văn A')));-- lấy thông tin của khách hàng đã mua sản phẩm của máy tính T450select * from Customers where Id  in   (select Id from Orders where Id in       (select OrderId from OrderItems where ProductId in	     (select Id from Products where Name like N'Máy tính T450')));--Số khách hàng đã mua ở cửa hàng--Số mặt hàng mà cửa hàng bán--Tổng tiền của từng đơn hàngcreate table Demo_Classes(Id varchar(10) primary key,Name varchar(50));create table Demo_Students(Id int primary key identity(1,1),Name varchar(50),ClassId varchar(10) foreign key references Demo_Classes(Id));insert into Demo_Classes(Id,Name)values ('A','Lop A'),('B','Lop B');insert into Demo_Students(Name,ClassId)values ('An','A'),('Nam','A'),('Tu',null);select * from Demo_Classes;select * from Demo_Students;--INNER JOIN, LEFT JOIN, RIGHT JOIN  -- ĐÂY LÀ CÁCH NỐI BẢNG TRONG SQLselect * from Demo_Studentsinner join Demo_Classes on Demo_Students.ClassId= Demo_Classes.Id;    --Trả về bản ghi có giá trị phù hợp với cả hai bảngselect * from Demo_Studentsleft join Demo_Classes on Demo_Students.ClassId = Demo_Classes.Id;    --Trả về bản ghi có giá trị bên trái và bản ghi trùng với giá trị bên phải select * from Demo_Students right join Demo_Classes on Demo_Students.ClassId = Demo_Classes.Id;    --Trả về bản ghi có giá trị bên phải và bản ghi trùng với giá trị bên tráiselect * from Demo_Students tb1          --Thay tên bảng từ Demo_Students thành tb1 CHO NGẮN GỌNleft join Demo_Classes tb2 on tb1.ClassId = tb2.Idwhere tb2.Name like'%Lop%';select CustomerId,count(Id) as soluong from Orders group by CustomerId;select tb1.Name, tb2.soluong from Customers tb1    inner join(select CustomerId,count(Id) as soluong from Orders group by CustomerId) tb2   on tb1.Id = tb2.CustomerId;select * from OrderItems Ainner join Orders B on A.OrderId = B.Id inner join Products C on A.ProductId = C.Id inner join Customers D on B.CustomerId = D.Id;--Procedure: Tìm kiếm đơn hàng theo tên khách hàng (NHỚ CHỖ NÀY PHẢI CHẠY T2207E_theOrder)
create procedure find_order_by_customer @name nvarchar(255) as
select * from Orders where CustomerId in
(select Id  from Customers where Name like @name);

drop procedure find_order_by_customer;
exec find_order_by_customer @name = N'Nguyễn Văn A';   --exce nghĩa là thực thi lệnh procedure

--Tạo mới bằng procedure bảng customers
create procedure create_customers @name nvarchar(255),@address nvarchar(255),@tel varchar(20) as
insert into Customers (Name,Address,Tel)
values( @name,@address,@tel);

--Tạo mới bằng procedure bảng products và phân cấp người dùng khác nhau: khách thường, vip 1, vip 2,....
create procedure normal_user_create_products @name nvarchar(100),@description ntext, @unit nvarchar(50),@price decimal(12,4) as
if @price <=100000
begin
   insert into Products (Name,Description,Unit,Price)
   values( @name,@description,@unit,@price);
end
else
   print 'Khong duoc dang san pham qua 100000';

exec normal_user_create_products @name=N'Túi xách Gucci',
@description=N'Túi xách hàng hiệu',
@unit=N'Chiếc',
@price=N'1000000';

select * from Products;



--Trigger : được vận hành khi có một sự kiện xảy ra
create trigger thong_bao_them_san_pham
on Products
after insert
as
print 'Vừa có người thêm sản phẩm xong';

drop trigger thong_bao_them_san_pham;

create trigger khong_cho_xoa_sp
on Products 
after delete
as
 if exists (select * from deleted where Id =3)    --ko cho xóa sản phẩm có Id=3, còn Id khác xóa bình thường 
 begin
   rollback transaction;
   print 'Khong cho xoa sp';
 end

drop trigger khong_cho_xoa_sp;
select * from Products;
delete from Products where Id=3;

--ko cho giảm giá sản phẩm
create trigger gia_moi_cao_hon_gia_cu
on Products
after update
as
if(select Price from inserted)<(select Price from deleted)
begin 
   rollback transaction;
   print 'Khong duocgiam gia sp';
 end

 drop trigger gia_moi_cao_hon_gia_cu; 
 update Products set Price = 50000 where Id=3;

 --Viet trigger chỉ cho phép tạo đơn với khách chưa có đơn nào
 create trigger tao_don_lan_dau
 on Orders
 after insert
 as
   if exists (select * from inserted where CustomerId in
      (select distinct CustomerId from Orders))
	  rollback transaction;