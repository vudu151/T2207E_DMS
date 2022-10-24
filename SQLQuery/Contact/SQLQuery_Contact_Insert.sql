--3. Viết các câu lệnh để thêm dữ liệu vào các bảng
insert into Names(Fullname,Address,Birthday)
values(N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','1987-11-8'),
(N'Nguyễn Văn Bách',N'112 Nguyễn Trãi, Thanh Xuân, Hà Nội','1990-12-9');


select * from Names;


insert into Contacts(Tel,NameId)
values(N'987654321, 09873452, 09832323, 09434343',2),(N'8123456, 02233445, 09288669, 01289721',3);select * from Contacts;