--4a) Liệt kê danh sách những người trong danh bạ
select Fullname from Names;

--4b) Liệt kê danh sách số điện thoại có trong danh bạ
select Tel from Contacts;

--5a) Liệt kê danh sách người trong danh bạ theo thứ thự alphabet.
select Fullname from Names order by Fullname asc;

--5b) Liệt kê các số điện thoại của người có tên là Nguyễn Văn An.
select Tel from Contacts where NameId in 
   (select Id from Names where Fullname like N'Nguyễn Văn An');

--5c) Liệt kê những người có ngày sinh là 12/09/1990
select Fullname from Names where Birthday like '1990-12-09';

--6a) Tìm số lượng số điện thoại của mỗi người trong danh bạ.
select count(Tel) from Contacts where NameId in
   (select Id from Names where Fullname like'%');

--6b) Tìm tổng số người trong danh bạ sinh vào thang 12.
select count(Fullname) from Names where Birthday like '%-12-%';

--6c) Hiển thị toàn bộ thông tin về người, của từng số điện thoại.
select * from Names where Id in
   (select NameId from Contacts where Tel like'%');

--6d) Hiển thị toàn bộ thông tin về người, của số điện thoại 987654321
select * from Names where Id in
   (select NameId from Contacts where Tel like '987654321%');

--7a) Viết câu lệnh để thay đổi trường ngày sinh là trước ngày hiện tại.

--7b) Viết câu lệnh để xác định các trường khóa chính và khóa ngoại của các bảng.
--7c) Viết câu lệnh để thêm trường ngày bắt đầu liên lạc.
--8a) Thực hiện các chỉ mục sau(Index)
     --IX_HoTen : đặt chỉ mục cho cột Họ và tên
	 create index IX_HoTen on Names(Fullname);      --Do bảng này có khóa chính rồi nên ko đánh chỉ mục bằng phương pháp vật lí được 
     --IX_SoDienThoai: đặt chỉ mục cho cột Số điện thoại
	 create index IX_SoDienThoai on Contacts(Tel);