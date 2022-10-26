--3. Liệt kê các cuốn sách có năm xuất bản từ 2008 đến nay
select Name from Books where PublishYear>2008 and PublishYear<getdate();

--4. Liệt kê 10 cuốn sách có giá bán cao nhất
select top 10 * from Books order by Price desc;

--5. Tìm những cuốn sách có tiêu đề chứa từ “Tin học”
select * from Books where Name like N'Tin học %';

--6. Liệt kê các cuốn sách có tên bắt đầu với chữ “T” theo thứ tự giá giảm dần


--7. Liệt kê các cuốn sách của nhà xuất bản Tri thức
select Name from Books where PublisherId in
   (select Id from Publishers where Name like N'Tri thức');

--8. Lấy thông tin chi tiết về nhà xuất bản xuất bản cuốn sách “Trí tuệ Do Thái”
select * from Publishers where Id in
   (select PublisherId from Books where Name like N'Trí tuệ Do Thái');

--9. Hiển thị các thông tin sau về các cuốn sách: Mã sách, Tên sách, Năm xuất bản, Nhà xuất bản,Loại sách
select d.Code,d.Name,d.PublishYear,b.Name,a.Name from Books d
right join Publishers b on d.PublisherId =b.Id        --Lấy bên Books và Name của cả 2 cái
left join Categories a on d.CategoryId=a.Id;          --Lấy bên Categories và Name của cả hai cái

--10. Tìm cuốn sách có giá bán đắt nhất
select top 1 Name from Books order by Price desc;

--11. Tìm cuốn sách có số lượng lớn nhất trong kho
select top 1 Name from Books order by Qty desc;

--12. Tìm các cuốn sách của tác giả “Eran Katz”
select Name from Books where AuthorId in
   (select Id from Authors where Name like N'Eran Katz');

--13. Giảm giá bán 10% các cuốn sách xuất bản từ năm 2008 trở về trước
--update Books set Price = Price - 10 percent Price where PublishYear < 2008;

--14. Thống kê số đầu sách của mỗi nhà xuất bản
--select count(*),Name from Books where PublisherId in
   (select Id from Publishers);

--15. Thống kê số đầu sách của mỗi loại sách


--16. Đặt chỉ mục (Index) cho trường tên sách
create index chi_muc_phi_vat_ly on Books(Code);
select * from Books;
drop index chi_muc_phi_vat_ly on Books;             --xóa chỉ mục phi vật lý

--17. Viết view lấy thông tin gồm: Mã sách, tên sách, tác giả, nhà xb và giá bán
create view information as
select d.Code,d.Name,d.Price,c.Name,b.Name from Books d
right join Publishers b on d.PublisherId =b.Id   
left join Authors c on d.AuthorId=c.Id;

select * from information;
--làm sai rồi
  
--18. Viết Store Procedure:
      --◦ SP_Them_Sach: thêm mới một cuốn sách
	  create procedure add_new_book @Code varchar(20),@Name nvarchar(255),@Description text, @PublishYear int,@NumberOfPublish int, @Price int, @Qty int as
	  insert into Books(Code,Name,Description,PublishYear,NumberOfPublish,Price,Qty)
	  values(@Code,@Name,@Description,@PublishYear,@NumberOfPublish,@Price,@Qty);
	  print 'Da them moi mot cuon sach';

	  exec add_new_book 
	     @Code = 'B004',
		 @Name = N'Đắc nhân tâm',
		 @Description = N'Sách bán chạy',
		 @PublishYear = 1936,
		 @NumberOfPublish = 1,
		 @Price = 99000,
		 @Qty = 6923;
	  select * from Books;

      --◦ SP_Tim_Sach: Tìm các cuốn sách theo từ khóa
	  create procedure search_book @Name nvarchar(255) as
	  select * from Books where Name like @Name;

	  exec search_book @Name = 'T%';

      --◦ SP_Sach_ChuyenMuc: Liệt kê các cuốn sách theo mã chuyên mục
	  create procedure list_book @Code varchar(20) as
	  exec list_book
		 @Code='B007';
	  select * from Books order by Code asc;
	  --làm sai rồi

--19. Viết trigger không cho phép xóa các cuốn sách vẫn còn trong kho (số lượng > 0)
create trigger khong_cho_xoa_san_pham
on Books
after delete
as
if exists(select * from Books)
begin 
   rollback transaction;
   print 'Khong cho xoa san pham';
end

delete from Books; 
select * from Books;

--20. Viết trigger chỉ cho phép xóa một danh mục sách khi không còn cuốn sách nào thuộc chuyên mục này
create trigger xoa_danh_muc_sach_khi_khong_con_sach
on Categories 
after delete 
as
if select * from Categories where Id in
  (select CategoryId from Books where count(Code) =0);
else
  print 'Khong xoa duoc danh muc san pham do van con sach';

exec xoa_danh_muc_sach_khi_khong_con_sach;
delete from Categories;
--CÂU NÀY VẪN CHƯA ẤN CHẠY ĐÂU