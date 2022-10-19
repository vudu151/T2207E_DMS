--ĐÂY LÀ BÀI LẤY DỮ LIỆU CỦA theOrder

--Liet ke
select *from Products;
select Id,Name,Price from Products;
select Id as Code ,Name,Price from Products ;    --as đổi thông tin để che giấu dữ liệu

--Sap xep
select * from Products order by Price asc;     -- sắp xếp cột Price từ bé đến lớn(asc) , còn desc thì ngược lại
select * from Products order by Price desc;
select * from Products order by Price desc, Name asc;                                           

--Lay so luong nhat dinh
select top 1 * from Products order by Price desc;      --Lấy món đắt nhất
select top 50 percent *from Products order by Price desc;        --Lấy 50% món (chi cẩn lẻ ra một lí cũng làm tròn lên)


--Lọc dữ liệu
select *from Products where Id= 1 or Id=2;
select * from Products where Id in (1,2,3,4,5,6,7,8);          --Trong bảng có cái Id nào thì in ra còn ko có thì thôi
select * from Products where Price >100 and Price <1000;

select * from Orders where OrderDate='2022-10-10';
select * from Orders where OrderDate >='2022-10-01' and OrderDate <='2022-10-10';
select * from Orders where OrderDate between '2022-10-01' and '2022-10-10';

--Tim kiem
select * from Products where Name like 'M%';   --start with 
select * from Products where Name like '%450';  --end with
select * from Products where Name like '%45%';    --contains

--Thong ke
select count(Id) as soluongdonhang from Orders where OrderDate between '2022-10-01' and '2022-10-10';
select sum(GrandTotal) as doanhthu from Orders where OrderDate between '2022-10-01' and '2022-10-10';   --chỉ áp dụng cho kiểu dữ liệu number
select avg(GrandTotal) as trungbinh from Orders where OrderDate between '2022-10-01' and '2022-10-10';
select CustomerId, sum(GrandTotal) as doanhthu from Orders group by CustomerId;        --Nhóm CustomerId cong tính tổng của GrandTotal
select CustomerId, sum(GrandTotal) as doanhthu from Orders where OrderDate= getdate() group by CustomerId;  -- Đi vào from đến where đên group xong đến select